using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Profile;
using log4net;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.Profile;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosProfileProvider : ProfileProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private string _appName;
        private Guid _appGuid;
        private string _providerName;

        //private string _connString;

        public override string Name
        {
            get
            {
                return _providerName;
            }
        }

        public override string ApplicationName
        {
            get
            {
                return _appName;
            }
            set
            {
                return;
            }
        }

        //
        //  System.Configuration.Provider.ProviderBase.Initialize Method
        //
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");

            if (config["applicationGUID"] == null || config["applicationGUID"].Trim() == "")
            {
                throw new ArgumentNullException("applicationGUID");
            }
            else
            {
                _appGuid = new Guid(config["applicationGUID"]);
            }

            if (config["applicationName"] == null || config["applicationName"].Trim() == "")
            {
                _appName = System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath;
            }
            else
            {
                _appName = config["applicationName"];
            }

            if (name == null || name.Length == 0)
                name = "AsynchronosProfileProvider";
            if (string.IsNullOrEmpty(name))
                name = "AsynchronosProfileProvider";
            _providerName = name;

            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Asynchronos custom profile provider.");
            }

            base.Initialize(name, config);

            //
            // Initialize connection string.
            //
            //ConnectionStringSettings pConnectionStringSettings = ConfigurationManager.
            //    ConnectionStrings[config["connectionStringName"]];

            //if (pConnectionStringSettings == null ||
            //    pConnectionStringSettings.ConnectionString.Trim() == "")
            //{
            //    throw new ProviderException("Connection string cannot be blank.");
            //}

            //_connString = pConnectionStringSettings.ConnectionString;
        }

        public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption, System.DateTime userInactiveSinceDate)
        {
            throw new System.NotImplementedException();
        }

        public override int DeleteProfiles(string[] usernames)
        {
            throw new System.NotImplementedException();
        }

        public override int DeleteProfiles(ProfileInfoCollection profiles)
        {
            throw new System.NotImplementedException();
        }

        public override ProfileInfoCollection FindInactiveProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, System.DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption, System.DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption, System.DateTime userInactiveSinceDate)
        {
            throw new System.NotImplementedException();
        }

        public override System.Configuration.SettingsPropertyValueCollection GetPropertyValues(System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyCollection collection)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetPropertyValues");
            }
            //the serializeAs attribute is ignored in this provider implementation.

            string username = (string)context["UserName"];
            //ใช้สำหรับเก็บ Flag ลง database ถ้าต้องการเก็บข้อมูลการ Authenticated
            //bool isAuthenticated = (bool)context["IsAuthenticated"];

            Dictionary<string, object> properties = new Dictionary<string, object>();
            properties.Add("SettingsCollection", collection);
            properties.Add("UserName", username);
            properties.Add("ApplicationGuid", _appGuid);
            properties.Add("ApplicationName", ApplicationName);
            properties.Add("ProfileSettings", null);

            // The serializeAs attribute is ignored in this provider implementation.
            SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();

            foreach (SettingsProperty prop in collection)
            {
                SettingsPropertyValue pv = new SettingsPropertyValue(prop);

                using (UserSystemEntities dataContext = new UserSystemEntities())
                {
                    using (IUserProfileRepository repo = new UserProfileRepository(dataContext))
                    {
                        UserProfileBase p = repo.GetUserProfile(username, ApplicationName);

                        switch (prop.Name)
                        {
                            case "EMP_FULLNAME":
                                pv.PropertyValue = p.EMP_FULLNAME;
                                break;
                            case "EMP_FULLNAME_E":
                                pv.PropertyValue = p.EMP_FULLNAME_E;
                                break;
                            case "EMAIL":
                                pv.PropertyValue = p.EMAIL;
                                break;
                            case "LAST_SIGN_ON_DATE":
                                pv.PropertyValue = p.LAST_SIGN_ON_DATE;
                                break;
                            case "USER_DATA_DEL_FLAG":
                                pv.PropertyValue = p.USER_DATA_DEL_FLAG;
                                break;
                            case "CATEGORY_LIST":
                                pv.PropertyValue = p.CATEGORIES_STR;
                                break;
                            default:
                                throw new ProviderException("Unsupported property:" + prop.Name);
                        }

                        //u.LAST_SIGN_ON_DATE = DateTime.Now;
                        repo.UpdateActivity(username, ApplicationName, "GetProfile");
                        repo.Save();
                    }
                    //change to use respository save method
                    //dataContext.SaveChanges();
                }
                svc.Add(pv);
            }
            return svc;
        }

        public override void SetPropertyValues(System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyValueCollection collection)
        {
            if (isDebugEnabled)
            {
                log.Debug("SetPropertyValues");
            }
            //the serializeAs attribute is ignored in this provider implementation.
            string username = (string)context["UserName"];
            //ใช้สำหรับเก็บ Flag ลง database ถ้าต้องการเก็บข้อมูลการ Authenticated
            //bool isAuthenticated = (bool)context["IsAuthenticated"];

            using (UserSystemEntities dataContext = new UserSystemEntities())
            {
                using (IUserProfileRepository repo = new UserProfileRepository(dataContext))
                {
                    UserProfileBase p = repo.GetUserProfile(username, ApplicationName);
                    if (null == p)
                    {
                        p = repo.CreateProfileForUser(username, ApplicationName);
                    }
                    else
                    {
                        foreach (SettingsPropertyValue pv in collection)
                        {
                            switch (pv.Property.Name)
                            {
                                case "EMP_FULLNAME":
                                    p.EMP_FULLNAME = (string)pv.PropertyValue;
                                    break;
                                case "EMP_FULLNAME_E":
                                    p.EMP_FULLNAME_E = (string)pv.PropertyValue;
                                    break;
                                case "EMAIL":
                                    p.EMAIL = (string)pv.PropertyValue;
                                    break;
                                case "LAST_SIGN_ON_DATE":
                                    p.LAST_SIGN_ON_DATE = (DateTime)pv.PropertyValue;
                                    break;
                                case "USER_DATA_DEL_FLAG":
                                    p.USER_DATA_DEL_FLAG = (bool)pv.PropertyValue;
                                    break;
                                case "CATEGORY_LIST":
                                    p.CATEGORIES_STR = (string)pv.PropertyValue;
                                    break;
                                default:
                                    throw new ProviderException("Unsupported property");
                            }
                        }
                    }

                    repo.Save();
                }
            }
        }

        /*
         * Custom ProfileManager methods
         */

        public int GetTotalNumberofProfiles()
        {
            throw new NotImplementedException();
        }
    }
}