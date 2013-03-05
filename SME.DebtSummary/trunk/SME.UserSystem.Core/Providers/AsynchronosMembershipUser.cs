using System;
using System.Web.Security;
using log4net;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosMembershipUser : MembershipUser
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public string EMP_TITLE { get; set; }

        public string EMP_NAME { get; set; }

        public string EMP_SURNAME { get; set; }

        public string EMP_TITLE_E { get; set; }

        public string EMP_NAME_E { get; set; }

        public string EMP_SURNAME_E { get; set; }

        public string PASSWD { get; set; }

        public DateTime? CREATE_DATE { get; set; }

        public DateTime? EXPIRE_DATE { get; set; }

        public DateTime? UPDATE_DATE { get; set; }

        public DateTime? LAST_SIGN_ON_DATE { get; set; }

        public DateTime? LAST_CHANGE_PASS_DATE { get; set; }

        public bool? DEL_FLAG { get; set; }

        public AsynchronosMembershipUser(string providername,
                                  string username,
                                  object providerUserKey,
                                  string email,
                                  string passwordQuestion,
                                  string comment,
                                  bool isApproved,
                                  bool isLockedOut,
                                  DateTime creationDate,
                                  DateTime lastLoginDate,
                                  DateTime lastActivityDate,
                                  DateTime lastPasswordChangedDate,
                                  DateTime lastLockedOutDate,
                                  string empTitle,
                                  string empName,
            string empSurname,
            string empTitleE,
            string empNameE,
            string empSurnameE,
            string passwd,
            DateTime? createDate,
            DateTime? expireDate,
            DateTime? updateDate,
            DateTime? lastSignonDate,
            DateTime? lastChangePassDate,
            bool? delFlag) :

            base(providername,
                                       username,
                                       providerUserKey,
                                       email,
                                       passwordQuestion,
                                       comment,
                                       isApproved,
                                       isLockedOut,
                                       creationDate,
                                       lastLoginDate,
                                       lastActivityDate,
                                       lastPasswordChangedDate,
                                       lastLockedOutDate)
        {
            this.EMP_TITLE = empTitle;
            this.EMP_NAME = empName;
            this.EMP_SURNAME = empSurname;
            this.EMP_TITLE_E = empTitle;
            this.EMP_NAME_E = empNameE;
            this.EMP_SURNAME_E = empSurnameE;
            this.PASSWD = passwd;
            this.CREATE_DATE = createDate;
            this.EXPIRE_DATE = expireDate;
            this.UPDATE_DATE = updateDate;
            this.LAST_SIGN_ON_DATE = lastSignonDate;
            this.LAST_CHANGE_PASS_DATE = lastChangePassDate;
            this.DEL_FLAG = delFlag;
        }
    }
}