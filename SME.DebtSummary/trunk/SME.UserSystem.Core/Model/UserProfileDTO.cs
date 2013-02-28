using log4net;

namespace SME.UserSystem.Core.DTO
{
    public class UserProfileDTO : IUserProfileDTO
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        #region Member

        private string empid;
        private string empFullname;
        private string empFullnameE;
        private string passwd;
        private string email;
        private System.DateTime? lastSignonDate;
        private System.DateTime? expireDate;
        private bool? userdataDELFlag;
        private int? appKey;
        private string appDesc;
        private string lastActivity;
        private System.DateTime? lastActivityDate;
        private bool? isAuthenticated;
        private string categoryStr;
        private System.Collections.Generic.List<CATEGORY> categoryList;

        #endregion Member

        #region Propeties

        #region USER_DATA Properties

        public string EMP_ID
        {
            get
            {
                return this.empid;
            }
            set
            {
                this.empid = value;
            }
        }

        public string EMP_FULLNAME
        {
            get
            {
                return this.empFullname;
            }
            set
            {
                this.empFullname = value;
            }
        }

        public string EMP_FULLNAME_E
        {
            get
            {
                return this.empFullnameE;
            }
            set
            {
                this.empFullnameE = value;
            }
        }

        public string PASSWD
        {
            get
            {
                return this.passwd;
            }
            set
            {
                this.passwd = value;
            }
        }

        public string EMAIL
        {
            get
            {
                return this.email;
            }
            set
            {
                this.email = value;
            }
        }

        public System.DateTime? LAST_SIGN_ON_DATE
        {
            get
            {
                return this.lastSignonDate;
            }
            set
            {
                this.lastSignonDate = value;
            }
        }

        public System.DateTime? EXPIRE_DATE
        {
            get
            {
                return this.expireDate;
            }
            set
            {
                this.expireDate = value;
            }
        }

        public bool? USER_DATA_DEL_FLAG
        {
            get
            {
                return this.userdataDELFlag;
            }
            set
            {
                this.userdataDELFlag = value;
            }
        }

        #endregion USER_DATA Properties

        #region APP_PROFILE Properties

        public int? APP_KEY
        {
            get
            {
                return this.appKey;
            }
            set
            {
                this.appKey = value;
            }
        }

        public string APP_DESC
        {
            get
            {
                return this.appDesc;
            }
            set
            {
                this.appDesc = value;
            }
        }

        public string LAST_ACTIVITY
        {
            get
            {
                return this.lastActivity;
            }
            set
            {
                this.lastActivity = value;
            }
        }

        public System.DateTime? LAST_ACTIVITY_DATE
        {
            get
            {
                return this.lastActivityDate;
            }
            set
            {
                this.lastActivityDate = value;
            }
        }

        public bool? IS_AUTHENTICATED
        {
            get
            {
                return this.isAuthenticated;
            }
            set
            {
                this.isAuthenticated = value;
            }
        }

        #endregion APP_PROFILE Properties

        #region Category (Role)

        public string CATEGORIES_STR
        {
            get
            {
                return this.categoryStr;
            }
            set
            {
                this.categoryStr = value;
            }
        }

        public System.Collections.Generic.List<CATEGORY> CATEGORY_LIST
        {
            get
            {
                return this.categoryList;
            }
            set
            {
                this.categoryList = value;
            }
        }

        #endregion Category (Role)

        #endregion Propeties

        public UserProfileDTO()
            : base()
        {
        }

        //public UserProfileDTO(USER_DATA u)
        //{
        //    if (null != u)
        //    {
        //        this.EMP_ID = u.EMP_ID;
        //        this.EMP_FULLNAME = u.EMP_TITLE + u.EMP_NAME + " " + u.EMP_SURNAME;
        //        this.EMP_FULLNAME_E = u.EMP_TITLE_E + "." + u.EMP_NAME_E + " " + u.EMP_SURNAME_E;
        //        this.PASSWD = u.PASSWD;
        //        this.EMAIL = u.EMAIL;
        //        this.LAST_SIGN_ON_DATE = u.LAST_SIGN_ON_DATE;
        //        this.EXPIRE_DATE = u.EXPIRE_DATE;
        //        this.USER_DATA_DEL_FLAG = u.DEL_FLAG;

        //        this.LAST_ACTIVITY = u.APP_PROFILE.LAST_ACTIVITY;
        //        this.LAST_ACTIVITY_DATE = u.APP_PROFILE.LAST_ACTIVITY_DATE;
        //        this.IS_AUTHENTICATED = u.APP_PROFILE.IS_AUTHENTICATED;
        //        //this.APP_PROFILE_DEL_FLAG = ap.DEL_FLAG;

        //        var iterator = ap.USER_DATA.CATE_AND_EMP.GetEnumerator();
        //        while (iterator.MoveNext())
        //        {
        //            if (null != iterator.Current)
        //            {
        //                if (null == this.CATEGORY_LIST)
        //                {
        //                    this.CATEGORY_LIST = new System.Collections.Generic.List<CATEGORY>();
        //                }

        //                this.CATEGORIES_STR = this.CATEGORIES_STR + "|" + iterator.Current.CATEGORY_KEY;

        //                CATEGORY c = new CATEGORY();
        //                c.CATEGORY_DESC = iterator.Current.CATEGORY.CATEGORY_DESC;
        //                c.CATEGORY_DESC_TH = iterator.Current.CATEGORY.CATEGORY_DESC_TH;
        //                c.CATEGORY_KEY = iterator.Current.CATEGORY.CATEGORY_KEY;
        //                c.CATEGORY_TYPE = iterator.Current.CATEGORY.CATEGORY_TYPE;
        //                c.CATEGORY_TYPE_KEY = iterator.Current.CATEGORY.CATEGORY_TYPE_KEY;
        //                c.CATEGORY_VALUE = iterator.Current.CATEGORY.CATEGORY_VALUE;
        //                c.DEL_FLAG = iterator.Current.CATEGORY.DEL_FLAG;
        //                c.PRIORITY = iterator.Current.CATEGORY.PRIORITY;
        //                this.CATEGORY_LIST.Add(c);
        //            }
        //        }

        //        if (System.String.Empty != this.CATEGORIES_STR && null != this.CATEGORIES_STR)
        //            this.CATEGORIES_STR = this.CATEGORIES_STR.Substring(1);
        //    }
        //    else
        //    {
        //    }
        //}

        //public UserProfileDTO(APP_PROFILE ap)
        //{
        //    if (null != ap)
        //    {
        //        this.EMP_ID = ap.EMP_ID;
        //        this.EMP_FULLNAME = ap.USER_DATA.EMP_TITLE + ap.USER_DATA.EMP_NAME + " " + ap.USER_DATA.EMP_SURNAME;
        //        this.EMP_FULLNAME_E = ap.USER_DATA.EMP_TITLE_E + "." + ap.USER_DATA.EMP_NAME_E + " " + ap.USER_DATA.EMP_SURNAME_E;
        //        this.PASSWD = ap.USER_DATA.PASSWD;
        //        this.EMAIL = ap.USER_DATA.EMAIL;
        //        this.LAST_SIGN_ON_DATE = ap.USER_DATA.LAST_SIGN_ON_DATE;
        //        this.USER_DATA_DEL_FLAG = ap.USER_DATA.DEL_FLAG;

        //        this.EXPIRE_DATE = ap.EXPIRE_DATE;
        //        this.LAST_ACTIVITY = ap.LAST_ACTIVITY;
        //        this.LAST_ACTIVITY_DATE = ap.LAST_ACTIVITY_DATE;
        //        this.IS_AUTHENTICATED = ap.IS_AUTHENTICATED;
        //        //this.APP_PROFILE_DEL_FLAG = ap.DEL_FLAG;

        //        var iterator = ap.USER_DATA.CATE_AND_EMP.GetEnumerator();
        //        while (iterator.MoveNext())
        //        {
        //            if (null != iterator.Current)
        //            {
        //                if (null == this.CATEGORY_LIST)
        //                {
        //                    this.CATEGORY_LIST = new System.Collections.Generic.List<CATEGORY>();
        //                }

        //                this.CATEGORIES_STR = this.CATEGORIES_STR + "|" + iterator.Current.CATEGORY_KEY;

        //                CATEGORY c = new CATEGORY();
        //                c.CATEGORY_DESC = iterator.Current.CATEGORY.CATEGORY_DESC;
        //                c.CATEGORY_DESC_TH = iterator.Current.CATEGORY.CATEGORY_DESC_TH;
        //                c.CATEGORY_KEY = iterator.Current.CATEGORY.CATEGORY_KEY;
        //                c.CATEGORY_TYPE = iterator.Current.CATEGORY.CATEGORY_TYPE;
        //                c.CATEGORY_TYPE_KEY = iterator.Current.CATEGORY.CATEGORY_TYPE_KEY;
        //                c.CATEGORY_VALUE = iterator.Current.CATEGORY.CATEGORY_VALUE;
        //                c.DEL_FLAG = iterator.Current.CATEGORY.DEL_FLAG;
        //                c.PRIORITY = iterator.Current.CATEGORY.PRIORITY;
        //                this.CATEGORY_LIST.Add(c);
        //            }
        //        }

        //        if (System.String.Empty != this.CATEGORIES_STR && null != this.CATEGORIES_STR)
        //            this.CATEGORIES_STR = this.CATEGORIES_STR.Substring(1);
        //    }
        //}
    }
}