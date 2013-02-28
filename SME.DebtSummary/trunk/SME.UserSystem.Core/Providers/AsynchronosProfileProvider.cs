using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Linq;
using System.Web.Profile;
using log4net;
using SME.UserSystem.Core.BL;
using SME.UserSystem.Core.DTO;

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
            //throw new System.NotImplementedException();
            CheckParameters(pageIndex, pageSize);

            return GetProfileInfo(authenticationOption, usernameToMatch,
                null, pageIndex, pageSize, out totalRecords);
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
            bool isAuthenticated = (bool)context["IsAuthenticated"];

            Dictionary<string, object> properties = new Dictionary<string, object>();
            properties.Add("SettingsCollection", collection);
            properties.Add("UserName", username);
            properties.Add("ApplicationGuid", _appGuid);
            properties.Add("ApplicationName", ApplicationName);
            properties.Add("ProfileSettings", null);

            //Workflow.WorkflowManager.ExecuteWorkflow(
            //    typeof(Workflow.GetProfilePropertiesWorkflow)
            //    , properties);

            //return properties["ProfileSettings"] as SettingsPropertyValueCollection;

            // The serializeAs attribute is ignored in this provider implementation.
            SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();

            foreach (SettingsProperty prop in collection)
            {
                SettingsPropertyValue pv = new SettingsPropertyValue(prop);

                using (IUserBL bl = new UserBL())
                {
                    IUserProfileDTO p = bl.GetUserProfileDTO(username, ApplicationName);

                    switch (prop.Name)
                    {
                        case "EMP_ID":
                            pv.PropertyValue = p.EMP_ID;
                            break;
                        case "EMP_FULLNAME":
                            pv.PropertyValue = p.EMP_FULLNAME;
                            break;
                        case "EMP_FULLNAME_E":
                            pv.PropertyValue = p.EMP_FULLNAME_E;
                            break;
                        case "PASSWD":
                            pv.PropertyValue = p.PASSWD;
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
                        case "EXPIRE_DATE":
                            pv.PropertyValue = p.EXPIRE_DATE;
                            break;
                        case "APP_KEY":
                            pv.PropertyValue = p.APP_KEY;
                            break;
                        case "APP_DESC":
                            pv.PropertyValue = p.APP_DESC;
                            break;
                        case "LAST_ACTIVITY":
                            pv.PropertyValue = p.LAST_ACTIVITY;
                            break;
                        case "LAST_ACTIVITY_DATE":
                            pv.PropertyValue = p.LAST_ACTIVITY_DATE;
                            break;
                        case "IS_AUTHENTICATED":
                            pv.PropertyValue = p.IS_AUTHENTICATED;
                            break;
                        case "CATEGORIES_STR":
                            pv.PropertyValue = p.CATEGORIES_STR;
                            break;
                        case "CATEGORY_LIST":
                            pv.PropertyValue = p.CATEGORY_LIST;
                            break;
                        default:
                            throw new ProviderException("Unsupported property:" + prop.Name);
                    }

                    p.IS_AUTHENTICATED = isAuthenticated;
                    p.LAST_SIGN_ON_DATE = DateTime.Now;
                    //p.LAST_ACTIVITY = "GetProfile";
                    p.LAST_ACTIVITY_DATE = DateTime.Now;

                    bl.UpdateUserProfileDTO(p, p.APP_KEY.Value);
                    bl.Save();
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
            bool isAuthenticated = (bool)context["IsAuthenticated"];

            Dictionary<string, object> properties = new Dictionary<string, object>();
            properties.Add("ProfileSettings", collection);
            properties.Add("UserName", username);
            properties.Add("isUserAuthenticated", isAuthenticated);
            properties.Add("ApplicationGuid", _appGuid);
            properties.Add("ApplicationName", ApplicationName);

            using (IUserBL bl = new UserBL())
            {
                IUserProfileDTO p = bl.GetUserProfileDTO(username, ApplicationName);

                foreach (SettingsPropertyValue pv in collection)
                {
                    switch (pv.Property.Name)
                    {
                        case "EMP_ID":
                            p.EMP_ID = (string)pv.PropertyValue;
                            break;
                        case "EMP_FULLNAME":
                            p.EMP_FULLNAME = (string)pv.PropertyValue;
                            break;
                        case "EMP_FULLNAME_E":
                            p.EMP_FULLNAME_E = (string)pv.PropertyValue;
                            break;
                        case "PASSWD":
                            p.PASSWD = (string)pv.PropertyValue;
                            break;
                        case "EMAIL":
                            p.EMAIL = (string)pv.PropertyValue;
                            break;
                        case "LAST_SIGN_ON_DATE":
                            p.LAST_SIGN_ON_DATE = DateTime.Now;//(DateTime)pv.PropertyValue;
                            break;
                        case "USER_DATA_DEL_FLAG":
                            p.USER_DATA_DEL_FLAG = (bool)pv.PropertyValue;
                            break;
                        case "EXPIRE_DATE":
                            p.EXPIRE_DATE = (DateTime)pv.PropertyValue;
                            break;
                        case "APP_KEY":
                            p.APP_KEY = (int)pv.PropertyValue;
                            break;
                        case "APP_DESC":
                            p.APP_DESC = (string)pv.PropertyValue;
                            break;
                        case "LAST_ACTIVITY":
                            p.LAST_ACTIVITY = (string)pv.PropertyValue;
                            break;
                        case "LAST_ACTIVITY_DATE":
                            p.LAST_ACTIVITY_DATE = DateTime.Now;//(DateTime)pv.PropertyValue;
                            break;
                        case "IS_AUTHENTICATED":
                            p.IS_AUTHENTICATED = isAuthenticated;//(bool)pv.PropertyValue;
                            break;
                        case "CATEGORIES_STR":
                            p.CATEGORIES_STR = (string)pv.PropertyValue;
                            break;
                        case "CATEGORY_LIST":
                            p.CATEGORY_LIST = (List<CATEGORY>)pv.PropertyValue;
                            break;
                        default:
                            throw new ProviderException("Unsupported property");
                    }
                }

                bl.UpdateUserProfileDTO(p, p.APP_KEY.Value);
                bl.Save();
            }
        }

        /*
         * Custom ProfileManager methods
         */

        public int GetTotalNumberofProfiles()
        {
            int result = 0;

            using (IUserBL bl = new UserBL())
            {
                result = bl.GetAllAppProfile().Count();
            }

            return result;
        }

        //
        // CheckParameters
        // Verifies input parameters for page size and page index.
        // Called by GetAllProfiles, GetAllInactiveProfiles,
        // FindProfilesByUserName, and FindInactiveProfilesByUserName.
        //
        private void CheckParameters(int pageIndex, int pageSize)
        {
            if (pageIndex < 0)
                throw new ArgumentException("Page index must 0 or greater.");
            if (pageSize < 1)
                throw new ArgumentException("Page size must be greater than 0.");
        }

        //
        // GetProfileInfo
        // Retrieves a count of profiles and creates a
        // ProfileInfoCollection from the profile data in the
        // database. Called by GetAllProfiles, GetAllInactiveProfiles,
        // FindProfilesByUserName, FindInactiveProfilesByUserName,
        // and GetNumberOfInactiveProfiles.
        // Specifying a pageIndex of 0 retrieves a count of the results only.
        //

        private ProfileInfoCollection GetProfileInfo(
          ProfileAuthenticationOption authenticationOption,
          string usernameToMatch,
          object userInactiveSinceDate,
          int pageIndex,
          int pageSize,
          out int totalRecords)
        {
            ProfileInfoCollection profiles = new ProfileInfoCollection();

            if (pageSize == 0)
            {
                totalRecords = 0;
                return profiles;
            }

            IEnumerable<APP_PROFILE> appProfile = null;

            using (IUserBL bl = new UserBL())
            {
                appProfile = bl.GetAllAppProfile()
                    .Where(ap => ap.APPLICATION.APP_DESC.Equals(_appName));

                if (usernameToMatch != null)
                {
                    appProfile = appProfile
                        .Where(ap => ap.EMP_ID.Contains(usernameToMatch));
                }

                if (userInactiveSinceDate != null)
                {
                    appProfile = appProfile
                        .Where(ap => ap.LAST_ACTIVITY_DATE <= (DateTime)userInactiveSinceDate);
                }

                switch (authenticationOption)
                {
                    case ProfileAuthenticationOption.Anonymous:
                        appProfile = appProfile
                            .Where(ap => ap.IS_AUTHENTICATED.Value.Equals(false));
                        break;
                    case ProfileAuthenticationOption.Authenticated:
                        appProfile = appProfile
                            .Where(ap => ap.IS_AUTHENTICATED.Value.Equals(true));
                        break;
                    default:
                        break;
                }

                totalRecords = appProfile.Count();
                if (totalRecords <= 0)
                {
                    return profiles;
                }

                List<APP_PROFILE> appProfileList = appProfile.ToList<APP_PROFILE>();

                int startIndex = pageSize * (pageIndex - 1);
                int endIndex = startIndex + pageSize - 1;
                for (int i = startIndex; i < endIndex; i++)
                {
                    ProfileInfo p = new ProfileInfo(
                        appProfileList[i].EMP_ID,
                        appProfileList[i].IS_AUTHENTICATED.Value,
                        appProfileList[i].LAST_ACTIVITY_DATE.Value,
                        appProfileList[i].LAST_ACTIVITY_DATE.Value,
                        0);
                    profiles.Add(p);
                }
            }

            return profiles;
        }
    }
}