using System;
using System.Web.Profile;
using log4net;
using SME.UserSystem.Core.Model;

namespace SME.UserSystem.Core.Profile
{
    [Serializable]
    public class MyProfile : ProfileBase
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        //[SettingsAllowAnonymous(false)]
        //[ProfileProvider("EmployeeInfoProvider")]
        //public string Department
        //{
        //    get { return base["EmployeeDepartment"].ToString(); }
        //    set { base["EmployeeDepartment"] = value; }
        //}

        [SettingsAllowAnonymous(false)]
        //[ProfileProvider("AsynchronosProfileProvider")]
        public ProfileViewModel Details
        {
            get { return (ProfileViewModel)base["ProfileViewModel"]; }
            set { base["ProfileViewModel"] = value; }
        }

        public virtual MyProfile GetProfile(string username)
        {
            return Create(username) as MyProfile;
        }
    }
}