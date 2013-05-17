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

        private string _LDAPUser;
        private string _LDAPPass;

        public LdapAuthentication()
        {
            _domainName = System.Configuration.ConfigurationManager.AppSettings["LDAP_SERVER"];
            _path = "LDAP://" + _domainName
                + ":" + System.Configuration.ConfigurationManager.AppSettings["LDAP_PORT"];
            _LDAPUser = System.Configuration.ConfigurationManager.AppSettings["LDAP_USERNAME"];
            _LDAPPass = System.Configuration.ConfigurationManager.AppSettings["LDAP_PASSWORD"];
        }

        public LdapAuthentication(string ldapServer)
        {
            _domainName = ldapServer;
            _path = "LDAP://" + _domainName
                + ":" + System.Configuration.ConfigurationManager.AppSettings["LDAP_PORT"];
            _LDAPUser = System.Configuration.ConfigurationManager.AppSettings["LDAP_USERNAME"];
            _LDAPPass = System.Configuration.ConfigurationManager.AppSettings["LDAP_PASSWORD"];
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
            bool authenticated = false;

            if (isDebugEnabled)
            {
                log.Debug(username + " Start Authenticate.");
            }

            using (DirectoryEntry userEntry = new DirectoryEntry(_path
                , _domainName + @"\" + username
                , pwd
                , AuthenticationTypes.Secure))
            {
                DirectorySearcher searcher = new DirectorySearcher(userEntry);
                searcher.Filter = "(SAMAccountName=" + username + ")";
                //searcher.PropertiesToLoad.Add("cn");
                SearchResult userSearchResult = null;

                try
                {
                    userSearchResult = searcher.FindOne();
                }catch(DirectoryServicesCOMException cex){
                    if (IsUserLocked(username))
                    {
                        log.Info("Username " + username + "in AD is Locked.");
                        throw new LDAPInfoException("Username " + username + " in AD is Locked.");
                    }

                    log.Error(cex.GetType().ToString());
                    log.Error(cex.Message);
                    log.Error(cex.StackTrace);
                    throw new LDAPInfoException(cex.Message,cex);
                }
                catch (COMException comEx)
                {
                    log.Error(comEx.GetType().ToString());
                    log.Error(comEx.Message);
                    log.Error(comEx.StackTrace);

                    throw new LDAPInfoException(comEx.Message, comEx);
                }
                catch (System.Exception ex)
                {
                    log.Error(ex.GetType().ToString());
                    log.Error(ex.Message);
                    log.Error(ex.StackTrace);
                    throw ex;
                }

                #region ListLDAPProperties

                if (false)//(isDebugEnabled)
                {
                    //username = "249987";
                    //search = new DirectorySearcher(entry);
                    //search.Filter = "(SAMAccountName=" + username + ")";
                    //search.PropertiesToLoad.Add("cn");
                    //result = search.FindOne();

                    log.Debug("");
                    log.Debug("result.Path:" + userSearchResult.Path);
                    log.Debug("filterAttribute:" + (String)userSearchResult.Properties["cn"][0]);

                    DirectoryEntry entry2 = userSearchResult.GetDirectoryEntry();
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
                #endregion

                // Update the new path to the user in the directory
                //_path = userSearchResult.Path;
                //_filterAttribute = (String)userSearchResult.Properties["cn"][0];

                authenticated = true;

                if (isDebugEnabled)
                {
                    log.Debug(username + " authenticated:" + authenticated);
                }
            }

            return authenticated;
        }

        public bool IsUserLocked(string username)
        {
            bool isLocked = false;

            using (DirectoryEntry rootEntry = new DirectoryEntry(_path
                , _domainName + @"\" + _LDAPUser
                , _LDAPPass
                , AuthenticationTypes.Secure))
            {
                //rootEntry.RefreshCache();

                DirectorySearcher searcher = new DirectorySearcher(rootEntry);
                searcher.Filter = "(SAMAccountName=" + username + ")";
                //searcher.PropertiesToLoad.Add("cn");
                SearchResult searchResult = null;

                try
                {
                    searchResult = searcher.FindOne();
                }
                catch (DirectoryServicesCOMException comEx)
                {
                    if (comEx.Message.Equals("Logon failure: unknown user name or bad password."))
                    {
                        log.Info("Username " + username + "in not exists.");
                        throw new LDAPInfoException("Username " + username + "in not exists.");
                    }
                    else
                    {
                        log.Error(comEx.Message);
                        log.Error(comEx.StackTrace);
                        throw new LDAPInfoException(comEx.Message, comEx);
                    }
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                    log.Error(ex.StackTrace);
                    throw new LDAPInfoException(ex.Message, ex);
                }

                using(DirectoryEntry getSearchEntry = searchResult.GetDirectoryEntry())
                {
                    isLocked = Convert.ToBoolean(getSearchEntry.InvokeGet("IsAccountLocked"));
                }

                if(isDebugEnabled)
                {
                    log.Debug("IsAccountLocked Type:" + isLocked.ToString());
                }

                if (isLocked)
                {
                    log.Info("Username " + username + "in AD is Locked.");
                    throw new LDAPInfoException("Username " + username + " in AD is Locked.");
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
                log.Error(ex.StackTrace);
                throw new LDAPInfoException("Error obtaining group names. " + ex.Message);
            }
            return groupNames.ToString();
        }

        
    }
}