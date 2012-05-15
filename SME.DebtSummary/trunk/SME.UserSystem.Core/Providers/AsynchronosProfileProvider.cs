using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Profile;
using log4net;
using SME.ceSystem.Core.Model;
using SME.UserSystem.Core.DAL;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosProfileProvider : ProfileProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        //can't use in this framework
        //private IUserDataRepository _userDataRepository;

        //public AsynchronosProfileProvider()
        //    : base()
        //{
        //    this._userDataRepository = new UserDataRepository(new UserSystemEntities());
        //}

        //public AsynchronosProfileProvider(IUserDataRepository userDataRepository)
        //{
        //    this._userDataRepository = userDataRepository;
        //}

        //
        //  System.Configuration.Provider.ProviderBase.Initialize Method
        //
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");

            if (string.IsNullOrEmpty(name))
                name = "AsynchronosProfileProvider";

            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Asynchronos custom profile provider.");
            }

            base.Initialize(name, config);
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

        public override string ApplicationName
        {
            get
            {
                return ConfigurationManager.AppSettings["APPLICATION_NAME"];
            }
            set
            {
                throw new System.NotImplementedException();
            }
        }

        public override System.Configuration.SettingsPropertyValueCollection GetPropertyValues(System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyCollection collection)
        {
            //the serializeAs attribute is ignored in this provider implementation.

            string username = (string)context["UserName"];

            //ใช้สำหรับเก็บ Flag ลง database ถ้าต้องการเก็บข้อมูลการ Authenticated
            //bool isAuthenticated = (bool)context["IsAuthenticated"];

            SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();

            foreach (SettingsProperty prop in collection)
            {
                SettingsPropertyValue pv = new SettingsPropertyValue(prop);

                using (UserSystemEntities dataContext = new UserSystemEntities())
                {
                    using (IUserDataRepository repo = new UserDataRepository(dataContext))
                    {
                        USER_DATA u = repo.GetUserByEmpId(username);
                        ProfileModel p = new ProfileModel(u);

                        switch (prop.Name)
                        {
                            case "DEL_FLAG":
                                pv.PropertyValue = p.DEL_FLAG;
                                break;
                            case "EMP_FULLNAME":
                                pv.PropertyValue = p.EMP_FULLNAME;
                                break;
                            case "EMP_FULLNAME_E":
                                pv.PropertyValue = p.EMP_FULLNAME_E;
                                break;
                            case "EMAIL":
                                pv.PropertyValue = p.EMAIL;
                                break;
                            case "EXPIRE_DATE":
                                pv.PropertyValue = p.EXPIRE_DATE;
                                break;
                            case "LAST_SIGN_ON_DATE":
                                pv.PropertyValue = p.LAST_SIGN_ON_DATE;
                                break;
                            case "ROLE_LIST":
                                pv.PropertyValue = p.CATEGORY_LIST;
                                break;
                            default:
                                throw new ProviderException("Unsupported property");
                        }

                        //u.LAST_SIGN_ON_DATE = DateTime.Now;
                        repo.UpdateActivity(username);
                        repo.Save();
                    }
                    //change to use respository save method
                    //dataContext.SaveChanges();
                }
            }
            return svc;
        }

        public override void SetPropertyValues(System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyValueCollection collection)
        {
            //the serializeAs attribute is ignored in this provider implementation.
            string username = (string)context["UserName"];

            //ใช้สำหรับเก็บ Flag ลง database ถ้าต้องการเก็บข้อมูลการ Authenticated
            //bool isAuthenticated = (bool)context["IsAuthenticated"];

            foreach (SettingsPropertyValue pv in collection)
            {
                //switch (prop.Name)
                //{
                //    case "DEL_FLAG":
                //        pv.PropertyValue = p.DEL_FLAG;
                //        break;
                //    case "EMP_FULLNAME":
                //        pv.PropertyValue = p.EMP_FULLNAME;
                //        break;
                //    case "EMP_FULLNAME_E":
                //        pv.PropertyValue = p.EMP_FULLNAME_E;
                //        break;
                //    case "EMAIL":
                //        pv.PropertyValue = p.EMAIL;
                //        break;
                //    case "EXPIRE_DATE":
                //        pv.PropertyValue = p.EXPIRE_DATE;
                //        break;
                //    case "LAST_SIGN_ON_DATE":
                //        pv.PropertyValue = p.LAST_SIGN_ON_DATE;
                //        break;
                //    case "ROLE_LIST":
                //        pv.PropertyValue = p.ROLE_LIST;
                //        break;
                //    default:
                //        throw new ProviderException("Unsupported property");
                //}
            }
        }
    }
}