using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Profile;
using log4net;
using SME.UserSystem.Core.DTO;

namespace SME.UserSystem.Core.Profile
{
    /// <summary>
    /// View of USER_DATA and APP_PROFILE and CATEGORY(ROEL)
    /// </summary>
    [Serializable()]
    public class UserProfileBase : ProfileBase, IUserProfileDTO
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        #region USER_DATA Properties

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string EMP_ID
        {
            get
            {
                return (String)this.GetPropertyValue("EMP_ID");
            }
            set
            {
                this.SetPropertyValue("EMP_ID", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string EMP_FULLNAME
        {
            get
            {
                return (String)this.GetPropertyValue("EMP_FULLNAME");
            }
            set
            {
                this.SetPropertyValue("EMP_FULLNAME", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string EMP_FULLNAME_E
        {
            get
            {
                return (String)this.GetPropertyValue("EMP_FULLNAME_E");
            }
            set
            {
                this.SetPropertyValue("EMP_FULLNAME_E", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string PASSWD
        {
            get
            {
                return (String)this.GetPropertyValue("PASSWD");
            }
            set
            {
                this.SetPropertyValue("PASSWD", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string EMAIL
        {
            get
            {
                return (String)this.GetPropertyValue("EMAIL");
            }
            set
            {
                this.SetPropertyValue("EMAIL", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual DateTime? LAST_SIGN_ON_DATE
        {
            get
            {
                return (DateTime?)this.GetPropertyValue("LAST_SIGN_ON_DATE");
            }
            set
            {
                this.SetPropertyValue("LAST_SIGN_ON_DATE", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual bool? USER_DATA_DEL_FLAG
        {
            get
            {
                return (bool?)this.GetPropertyValue("USER_DATA_DEL_FLAG");
            }
            set
            {
                this.SetPropertyValue("USER_DATA_DEL_FLAG", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual DateTime? EXPIRE_DATE
        {
            get
            {
                return (DateTime?)this.GetPropertyValue("EXPIRE_DATE");
            }
            set
            {
                this.SetPropertyValue("EXPIRE_DATE", value);
            }
        }

        #endregion USER_DATA Properties

        #region APP_PROFILE Properties

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual int? APP_KEY
        {
            get
            {
                return (int?)this.GetPropertyValue("APP_KEY");
            }
            set
            {
                this.SetPropertyValue("APP_KEY", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string APP_DESC
        {
            get
            {
                return (string)this.GetPropertyValue("APP_DESC");
            }
            set
            {
                this.SetPropertyValue("APP_DESC", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string LAST_ACTIVITY
        {
            get
            {
                return (string)this.GetPropertyValue("LAST_ACTIVITY");
            }
            set
            {
                this.SetPropertyValue("LAST_ACTIVITY", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual DateTime? LAST_ACTIVITY_DATE
        {
            get
            {
                return (DateTime?)this.GetPropertyValue("LAST_ACTIVITY_DATE");
            }
            set
            {
                this.SetPropertyValue("LAST_ACTIVITY_DATE", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual bool? IS_AUTHENTICATED
        {
            get
            {
                return (bool?)this.GetPropertyValue("IS_AUTHENTICATED");
            }
            set
            {
                this.SetPropertyValue("IS_AUTHENTICATED", value);
            }
        }

        #endregion APP_PROFILE Properties

        #region Category (Role)

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual string CATEGORIES_STR
        {
            get
            {
                return (string)this.GetPropertyValue("CATEGORIES_STR");
            }
            set
            {
                this.SetPropertyValue("CATEGORIES_STR", value);
            }
        }

        [SettingsAllowAnonymous(false)]
        [DefaultSettingValue(null)]
        public virtual List<CATEGORY> CATEGORY_LIST
        {
            get
            {
                return (List<CATEGORY>)this.GetPropertyValue("CATEGORY_LIST");
            }
            set
            {
                this.SetPropertyValue("CATEGORY_LIST", value);
            }
        }

        #endregion Category (Role)

        //public UserProfileBase()
        //    : base()
        //{
        //}

        //public UserProfileBase(IUserProfileDTO dto)
        //{
        //    this.CATEGORIES_STR = dto.CATEGORIES_STR;
        //    this.CATEGORY_LIST = dto.CATEGORY_LIST;
        //    this.EMAIL = dto.EMAIL;
        //    this.EMP_FULLNAME = dto.EMP_FULLNAME;
        //    this.EMP_FULLNAME_E = dto.EMP_FULLNAME_E;
        //    this.EMP_ID = dto.EMP_ID;
        //    this.EXPIRE_DATE = dto.EXPIRE_DATE;
        //    this.IS_AUTHENTICATED = dto.IS_AUTHENTICATED;
        //    this.LAST_ACTIVITY = dto.LAST_ACTIVITY;
        //    this.LAST_ACTIVITY_DATE = dto.LAST_ACTIVITY_DATE;
        //    this.LAST_SIGN_ON_DATE = dto.LAST_SIGN_ON_DATE;
        //    this.PASSWD = dto.PASSWD;
        //    this.USER_DATA_DEL_FLAG = dto.USER_DATA_DEL_FLAG;
        //    this.APP_KEY = dto.APP_KEY;
        //    this.APP_DESC = dto.APP_DESC;
        //}
    }
}