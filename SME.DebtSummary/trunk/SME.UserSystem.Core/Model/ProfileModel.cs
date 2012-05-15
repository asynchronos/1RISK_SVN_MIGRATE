using System;
using log4net;
using SME.UserSystem.Core;

namespace SME.ceSystem.Core.Model
{
    public class ProfileModel
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public string EMP_ID { get; set; }

        public string PASSWD { get; set; }

        public bool? DEL_FLAG { get; set; }

        public string EMP_FULLNAME { get; set; }

        public string EMP_FULLNAME_E { get; set; }

        public string EMAIL { get; set; }

        public DateTime? EXPIRE_DATE { get; set; }

        public DateTime? LAST_SIGN_ON_DATE { get; set; }

        public string CATEGORY_LIST { get; set; }

        public ProfileModel()
            : base()
        {
        }

        public ProfileModel(USER_DATA u)
        {
            this.EMP_ID = u.EMP_ID;
            this.DEL_FLAG = u.DEL_FLAG;

            this.EMP_FULLNAME = u.EMP_TITLE + u.EMP_NAME + " " + u.EMP_SURNAME;

            this.EMP_FULLNAME_E = u.EMP_TITLE_E + u.EMP_NAME_E + " " + u.EMP_SURNAME_E;

            this.EMAIL = u.EMAIL;
            this.EXPIRE_DATE = u.EXPIRE_DATE;
            this.LAST_SIGN_ON_DATE = u.LAST_SIGN_ON_DATE;

            var iterator = u.CATE_AND_EMP.GetEnumerator();
            while (iterator.MoveNext())
            {
                this.CATEGORY_LIST = this.CATEGORY_LIST + "|" + iterator.Current.CATEGORY.CATEGORY_DESC;
            }

            this.CATEGORY_LIST = this.CATEGORY_LIST.Substring(1);
        }
    }
}