using System;
using System.Collections.Generic;
using log4net;

namespace SME.UserSystem.Core.Model
{
    [Serializable()]
    public class ProfileViewModel
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        //USER_DATA Properties
        public string EMP_ID { get; set; }

        public string EMP_FULLNAME { get; set; }

        public string EMP_FULLNAME_E { get; set; }

        public string PASSWD { get; set; }

        public string EMAIL { get; set; }

        public DateTime? LAST_SIGN_ON_DATE { get; set; }

        public bool? USER_DATA_DEL_FLAG { get; set; }

        //APP_PROFILE Properties
        public DateTime? EXPIRE_DATE { get; set; }

        public string LAST_ACTIVITY { get; set; }

        public DateTime? LAST_ACTIVITY_DATE { get; set; }

        public bool? IS_AUTHENTICATED { get; set; }

        public bool? APP_PROFILE_DEL_FLAG { get; set; }

        //Category (Role)
        public string CATEGORIES_STR { get; set; }

        public List<CATEGORY> CATEGORY_LIST { get; set; }

        public ProfileViewModel()
            : base()
        {
        }

        public ProfileViewModel(APP_PROFILE ap)
        {
            if (null != ap)
            {
                this.EMP_ID = ap.EMP_ID;
                this.EMP_FULLNAME = ap.USER_DATA.EMP_TITLE + ap.USER_DATA.EMP_NAME + " " + ap.USER_DATA.EMP_SURNAME;
                this.EMP_FULLNAME_E = ap.USER_DATA.EMP_TITLE_E + "." + ap.USER_DATA.EMP_NAME_E + " " + ap.USER_DATA.EMP_SURNAME_E;
                this.PASSWD = ap.USER_DATA.PASSWD;
                this.EMAIL = ap.USER_DATA.EMAIL;
                this.LAST_SIGN_ON_DATE = ap.USER_DATA.LAST_SIGN_ON_DATE;
                this.USER_DATA_DEL_FLAG = ap.USER_DATA.DEL_FLAG;

                this.EXPIRE_DATE = ap.EXPIRE_DATE;
                this.LAST_ACTIVITY = ap.LAST_ACTIVITY;
                this.LAST_ACTIVITY_DATE = ap.LAST_ACTIVITY_DATE;
                this.IS_AUTHENTICATED = ap.IS_AUTHENTICATED;
                this.APP_PROFILE_DEL_FLAG = ap.DEL_FLAG;

                var iterator = ap.USER_DATA.CATE_AND_EMP.GetEnumerator();
                while (iterator.MoveNext())
                {
                    if (null != iterator.Current)
                    {
                        if (null == this.CATEGORY_LIST)
                        {
                            this.CATEGORY_LIST = new List<CATEGORY>();
                        }

                        this.CATEGORIES_STR = this.CATEGORIES_STR + "|" + iterator.Current.CATEGORY_KEY;

                        CATEGORY c = new CATEGORY();
                        c.CATEGORY_DESC = iterator.Current.CATEGORY.CATEGORY_DESC;
                        c.CATEGORY_DESC_TH = iterator.Current.CATEGORY.CATEGORY_DESC_TH;
                        c.CATEGORY_KEY = iterator.Current.CATEGORY.CATEGORY_KEY;
                        c.CATEGORY_TYPE = iterator.Current.CATEGORY.CATEGORY_TYPE;
                        c.CATEGORY_TYPE_KEY = iterator.Current.CATEGORY.CATEGORY_TYPE_KEY;
                        c.CATEGORY_VALUE = iterator.Current.CATEGORY.CATEGORY_VALUE;
                        c.DEL_FLAG = iterator.Current.CATEGORY.DEL_FLAG;
                        c.PRIORITY = iterator.Current.CATEGORY.PRIORITY;
                        this.CATEGORY_LIST.Add(c);
                    }
                }

                if (String.Empty != this.CATEGORIES_STR && null != this.CATEGORIES_STR)
                    this.CATEGORIES_STR = this.CATEGORIES_STR.Substring(1);
            }
        }
    }
}