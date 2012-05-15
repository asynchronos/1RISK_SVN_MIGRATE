﻿using System;
using System.DirectoryServices;
using System.Text;
using log4net;

namespace SME.UserSystem.Core.AD
{
    public class LdapAuthentication
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static string _path;
        private static string _filterAttribute;

        public LdapAuthentication(string path)
        {
            _path = path;
        }

        /*
        string username = "use id"; // Who has the permission to access the AD
        string pwd = "passwod"; //Password for the user
        string domainName = ""; //"LDAP://<IP Address of the Server where AD data is stored>"
        */

        public bool IsAuthenticated(string username, string pwd, string domainName)
        {
            bool authenticated = false;

            string domainAndUsername = domainName + @"\" + username;
            using (DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd))
            {
                try
                {
                    // Bind to the native AdsObject to force authentication.
                    Object obj = entry.NativeObject;
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
                }
                catch (DirectoryServicesCOMException cex)
                {
                    throw cex;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return authenticated;
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
            catch (Exception ex)
            {
                throw new Exception("Error obtaining group names. " +
                  ex.Message);
            }
            return groupNames.ToString();
        }
    }
}