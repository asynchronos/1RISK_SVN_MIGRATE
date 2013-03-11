using System;
using System.Collections;
using System.DirectoryServices;
using System.Runtime.InteropServices;
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

                    if (null == search)
                    {
                    }

                    SearchResult result = search.FindOne();

                    if (null == result)
                    {
                        authenticated = false;
                    }

                    if (false)//(isDebugEnabled)
                    {
                        //username = "249987";
                        //search = new DirectorySearcher(entry);
                        //search.Filter = "(SAMAccountName=" + username + ")";
                        //search.PropertiesToLoad.Add("cn");
                        //result = search.FindOne();

                        log.Debug("");
                        log.Debug("result.Path:" + result.Path);
                        log.Debug("filterAttribute:" + (String)result.Properties["cn"][0]);

                        DirectoryEntry entry2 = result.GetDirectoryEntry();
                        //log.Debug("entry2.Username:" + entry2.Username);
                        //log.Debug("entry2.AuthenticationType:" + entry2.AuthenticationType);
                        //log.Debug("entry2.Children:" + entry2.Children);
                        log.Debug("entry2.Name:" + entry2.Name);
                        //log.Debug("entry2.Parent.Username:" + entry2.Parent.Username);
                        log.Debug("entry2.Properties.Count:" + entry2.Properties.Count);

                        IDictionaryEnumerator myEnumerator = entry2.Properties.GetEnumerator();
                        while (myEnumerator.MoveNext())
                        {
                            log.Debug(myEnumerator.Key + ":" + myEnumerator.Value);

                            IEnumerator myEnumerator2 = ((PropertyValueCollection)myEnumerator.Value).GetEnumerator();
                            while (myEnumerator2.MoveNext())
                            {
                                log.Debug("   " + myEnumerator2.Current.ToString());
                            }
                        }
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
                if (IsUserLocked(username))
                {
                    log.Info("Username " + username + "in AD is Locked.");
                    throw new LDAPInfoException("Username " + username + " in AD is Locked.");
                }

                log.Error(cex);
                throw new LDAPInfoException(cex.Message, cex);
            }
            catch (COMException comEx)
            {
                log.Error(comEx);
                throw new LDAPInfoException(comEx.Message, comEx);
            }
            catch (System.Exception ex)
            {
                log.Error(ex);
                throw ex;
            }

            return authenticated;
        }

        public bool IsUserLocked(string username)
        {
            bool isLocked = false;

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
                    isLocked = Convert.ToBoolean(getSearchEntry.InvokeGet("IsAccountLocked"));
                    log.Debug("IsAccountLocked Type:" + getSearchEntry.InvokeGet("IsAccountLocked").ToString());
                }
            }

            return isLocked;
        }

        public bool UnlockedUser(string username)
        {
            bool success = false;

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
                        getSearchEntry.InvokeSet("IsAccountLocked", false);
                        log.Info("Username " + username + "in AD is Unlocked.");
                        success = true;
                    }
                }
            }

            return success;
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