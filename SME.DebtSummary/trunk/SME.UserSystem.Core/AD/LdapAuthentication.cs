using System;
using System.DirectoryServices;
using System.Text;
using log4net;
using SME.UserSystem.Core.Exceptions;

namespace SME.UserSystem.Core.AD
{
    /// <summary>
    /// Must Config LDAP_SERVER,LDAP_PORT,LDAP_USERNAME,LDAP_PASSWORD
    /// </summary>
    public class LdapAuthentication
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static string _domainName;
        private static string _path;
        private static string _filterAttribute;

        public LdapAuthentication()
        {
            _domainName = System.Configuration.ConfigurationManager.AppSettings["LDAP_SERVER"];
            _path = "LDAP://" + _domainName
                + ":" + System.Configuration.ConfigurationManager.AppSettings["LDAP_PORT"];
        }

        public LdapAuthentication(string ldapServer)
        {
            _domainName = ldapServer;
            _path = "LDAP://" + _domainName
                + ":" + System.Configuration.ConfigurationManager.AppSettings["LDAP_PORT"];
        }

        /*
        string username = "user id"; // Who has the permission to access the AD
        string pwd = "passwod"; //Password for the user
        */

        /// <summary>
        /// Authenticate And Check Locked if Authenticate Fail
        /// throw UserSystemInfoException
        /// </summary>
        /// <param name="username"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool IsAuthenticated(string username, string pwd)
        {
            if (isDebugEnabled)
            {
                log.Debug(username + " Start Authenticate.");
            }

            bool authenticated = false;

            try
            {
                using (DirectoryEntry entry = new DirectoryEntry(_path, _domainName + @"\" + username, pwd))
                {
                    // Bind to the native AdsObject to force authentication.
                    //Object obj = entry.NativeObject;
                    DirectorySearcher search = new DirectorySearcher(entry);
                    search.Filter = "(SAMAccountName=" + username + ")";
                    search.PropertiesToLoad.Add("cn");
                    SearchResult result = search.FindOne();
                    if (null == result)
                    {
                        authenticated = false;
                    }
                    // Update the new path to the user in the directory
                    _path = result.Path;
                    _filterAttribute = (String)result.Properties["cn"][0];

                    authenticated = true;

                    if (isDebugEnabled)
                    {
                        log.Debug(username + " authenticated:" + authenticated);
                    }
                }
            }
            catch (DirectoryServicesCOMException cex)
            {
                IsUserLocked(username);

                log.Error(cex.StackTrace);
                throw new LDAPInfoException(cex.Message, cex);
            }
            catch (System.Exception ex)
            {
                log.Error(ex.StackTrace);
                throw ex;
            }

            return authenticated;
        }

        private void IsUserLocked(string username)
        {
            string LDAPUser = System.Configuration.ConfigurationManager.AppSettings["LDAP_USERNAME"];
            string LDAPPass = System.Configuration.ConfigurationManager.AppSettings["LDAP_PASSWORD"];

            using (DirectoryEntry entry = new DirectoryEntry(_path, _domainName + @"\" + LDAPUser, LDAPPass))
            {
                // Bind to the native AdsObject to force authentication.
                //Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    log.Info("Can't not find username " + username + "in AD");
                    throw new LDAPInfoException("Can't not find username " + username + " in AD.");
                }
                else
                {
                    DirectoryEntry getSearchEntry = result.GetDirectoryEntry();
                    bool IsAccountLocked = Convert.ToBoolean(getSearchEntry.InvokeGet("IsAccountLocked"));

                    if (IsAccountLocked)
                    {
                        log.Info("Username " + username + "in AD is Locked.");
                        throw new LDAPInfoException("Username " + username + " in AD is Locked.");
                    }
                }
            }
        }

        public string GetGroups()
        {
            DirectorySearcher search = new DirectorySearcher(_path);
            search.Filter = "(cn=" + _filterAttribute + ")";
            search.PropertiesToLoad.Add("memberOf");
            StringBuilder groupNames = new StringBuilder();
            try
            {
                SearchResult result = search.FindOne();

                int propertyCount = result.Properties["memberOf"].Count;

                String dn;
                int equalsIndex, commaIndex;

                for (int propertyCounter = 0; propertyCounter < propertyCount;
                     propertyCounter++)
                {
                    dn = (String)result.Properties["memberOf"][propertyCounter];

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if (-1 == equalsIndex)
                    {
                        return null;
                    }
                    groupNames.Append(dn.Substring((equalsIndex + 1),
                                      (commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");
                }
            }
            catch (System.Exception ex)
            {
                log.Error("Error obtaining group names. " + ex.Message);
                throw new LDAPInfoException("Error obtaining group names. " + ex.Message);
            }
            return groupNames.ToString();
        }
    }
}