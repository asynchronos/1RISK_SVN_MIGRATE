using System;
using System.Configuration;
using System.Data.Objects;
using System.Linq;
using System.Web.Security;
using log4net;
using SME.UserSystem.Core.AD;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.Exceptions;
using System.Security.Cryptography;
using System.Text;
using WebMatrix.WebData;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosMembershipProvider : ExtendedMembershipProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private string _appName;
        private string _providerName;
        private bool _requiresQuestionAndAnswer = false;
        private bool _ldapOnly = true;

        private LdapAuthentication adAuth = new LdapAuthentication();

        public override string ApplicationName
        {
            get
            {
                return _appName;
            }
            set
            {
                throw new System.NotImplementedException();
            }
        }

        public override string Name
        {
            get
            {
                return _providerName;
            }
        }

        public bool LDAP_Only
        {
            get
            {
                return _ldapOnly;
            }
        }

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");

            if (config["applicationName"] == null || config["applicationName"].Trim() == "")
            {
                _appName = ConfigurationManager.AppSettings["APPLICATION_NAME"];
            }
            else
            {
                _appName = config["applicationName"];
            }

            if (_appName == null)
            {
                throw new AsynchronosProviderException("Can't find application name in any config.");
            }

            if (name == null || name.Length == 0)
                name = config["name"];
            if (string.IsNullOrEmpty(name))
                name = "AsynchronosMembershipProvider";
            _providerName = name;

            if (config["requiresQuestionAndAnswer"] != null)
            {
                bool.TryParse(config["requiresQuestionAndAnswer"], out _requiresQuestionAndAnswer);
            }

            if (config["LDAPOnly"] != null)
            {
                bool.TryParse(config["LDAPOnly"], out _ldapOnly);
            }
            
            log.Info(_providerName + " initialized");

            base.Initialize(name, config);
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            throw new System.NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new System.NotImplementedException();
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            if (LDAP_Only)
            {
                throw new Exception("Can't create user in LDAP only mode.");
            }

            AsynchronosMembershipUser membershipUser = null;
            status = MembershipCreateStatus.UserRejected;

            using (UnitOfWork uow = new UnitOfWork())
            {
                try
                {
                    USER_DATA user = uow.UserDataRepo.FindBy(u => u.EMP_ID == username)
                        .FirstOrDefault<USER_DATA>();

                    if (null != user)
                    {
                        if (user.DEL_FLAG == true)
                        {
                            user.DEL_FLAG = false;
                        }
                        else
                        {
                            status = MembershipCreateStatus.DuplicateUserName;
                            throw new AsynchronosProviderException("User " + username
                                + " is already exists.");
                        }
                    }
                    else
                    {
                        DateTime current = DateTime.Now;
                        //create user in db
                        user = new USER_DATA();
                        user.EMP_ID = username;
                        user.EMP_TITLE = username;
                        user.EMP_NAME = username;
                        user.EMP_SURNAME = username;
                        user.PASSWD = password;
                        user.EMAIL = email;
                        user.CREATE_DATE = current;
                        user.EXPIRE_DATE = current.AddYears(1);
                        user.DEL_FLAG = false;
                    }

                    APP_PROFILE profile = user.APP_PROFILE
                        .Where(ap => ap.APPLICATION.APP_DESC == ApplicationName)
                        .FirstOrDefault<APP_PROFILE>();

                    if (null == profile)
                    {
                        APPLICATION app = uow.ApplicationRepo
                            .FindBy(a => a.APP_DESC == ApplicationName)
                            .FirstOrDefault<APPLICATION>();

                        if (app == null)
                        {
                            throw new AsynchronosProviderException("Application " + ApplicationName
                                + " is not exists.");
                        }

                        profile = new APP_PROFILE();
                        profile.APP_KEY = app.APP_KEY;
                        profile.EMP_ID = user.EMP_ID;
                        profile.IS_AUTHENTICATED = null;
                        profile.CREATE_DATE = DateTime.Now;

                        user.APP_PROFILE.Add(profile);
                        app.APP_PROFILE.Add(profile);
                    }

                    profile.LAST_ACTIVITY_DATE = DateTime.Now;
                    profile.LAST_ACTIVITY = Name + "." + System.Reflection.MethodBase.GetCurrentMethod().Name;

                    //create MembershipUser Object
                    membershipUser = new AsynchronosMembershipUser(this.Name,
                                                      user.EMP_ID,
                                                      user.EMP_ID,
                                                      user.EMAIL,
                                                      String.Empty,
                                                      String.Empty,
                                                      false,//isApproved,
                                                      false,//isLockedOut,
                                                      null != user.CREATE_DATE ? user.CREATE_DATE.Value : DateTime.Now,//creationDate,
                                                      null != user.LAST_SIGN_ON_DATE ? user.LAST_SIGN_ON_DATE.Value : DateTime.Now, //lastLoginDate,
                                                      null != profile ? profile.LAST_ACTIVITY_DATE.Value : DateTime.Now,//lastActivityDate,
                                                      DateTime.Now,//lastPasswordChangedDate,
                                                      DateTime.Now,//lastLockedOutDate,
                                                      user.EMP_TITLE,
                                                      user.EMP_NAME,
                                                      user.EMP_SURNAME,
                                                      user.EMP_TITLE_E,
                                                      user.EMP_NAME_E,
                                                      user.EMP_SURNAME_E,
                                                      user.PASSWD,
                                                      user.CREATE_DATE,
                                                      user.EXPIRE_DATE,
                                                      user.UPDATE_DATE,
                                                      user.LAST_SIGN_ON_DATE,
                                                      user.LAST_CHANGE_PASS_DATE,
                                                      user.DEL_FLAG);

                    uow.Save();
                    status = MembershipCreateStatus.Success;
                }
                catch (Exception ex)
                {
                    status = MembershipCreateStatus.ProviderError;
                    log.Error(ex);
                    throw ex;
                }
            }

            return membershipUser;
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            if (LDAP_Only)
            {
                throw new Exception("Can't delete user in LDAP only mode.");
            }

            bool result = false;

            using (UnitOfWork uow = new UnitOfWork())
            {
                USER_DATA user = uow.UserDataRepo
                    .FindBy(u => u.EMP_ID == username
                        && u.DEL_FLAG != true)
                    .FirstOrDefault<USER_DATA>();

                if (null != user)
                {
                    user.DEL_FLAG = true;
                }

                result = true;
            }

            return result;
        }

        public override bool EnablePasswordReset
        {
            get { throw new System.NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval
        {
            get { throw new System.NotImplementedException(); }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new System.NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new System.NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// GetUser
        /// </summary>
        /// <param name="username">รหัสพนักงาน</param>
        /// <param name="userIsOnline">เก็บข้อมูลว่า Online อยู่หรือไม่ (ยังไม่รองรับ)</param>
        /// <returns></returns>
        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            if (isDebugEnabled)
                log.Debug("Invoke " + System.Reflection.MethodBase.GetCurrentMethod().Name);

            return GetUserFromLinq(username, userIsOnline);
        }

        /// <summary>
        /// GetUser
        /// </summary>
        /// <param name="providerUserKey">รหัสพนักงาน</param>
        /// <param name="userIsOnline">เก็บข้อมูลว่า Online อยู่หรือไม่ (ยังไม่รองรับ)</param>
        /// <returns></returns>
        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            if (isDebugEnabled)
                log.Debug("Invoke " + System.Reflection.MethodBase.GetCurrentMethod().Name);

            return GetUserFromLinq(providerUserKey.ToString(), userIsOnline);
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new System.NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { throw new System.NotImplementedException(); }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { throw new System.NotImplementedException(); }
        }

        public override int MinRequiredPasswordLength
        {
            get { return 8; }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new System.NotImplementedException(); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new System.NotImplementedException(); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { throw new System.NotImplementedException(); }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get
            {
                return _requiresQuestionAndAnswer;
            }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new System.NotImplementedException(); }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// Test Unlocked AD
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public override bool UnlockUser(string userName)
        {
            LdapAuthentication adAuth = new LdapAuthentication();
            return adAuth.UnlockedUser(userName);
        }

        public override void UpdateUser(MembershipUser user)
        {
            if (LDAP_Only)
            {
                throw new Exception("Can't update user in LDAP only mode.");
            }

            using (UnitOfWork uow = new UnitOfWork())
            {
                USER_DATA userData = uow.UserDataRepo
                    .FindBy(u => u.EMP_ID == ((AsynchronosMembershipUser)user).UserName)
                    .FirstOrDefault<USER_DATA>();

                if (null != userData)
                {
                    //userData.EMP_ID = ((AsynchronosMembershipUser)user).UserName;
                    userData.EMP_TITLE = ((AsynchronosMembershipUser)user).EMP_TITLE;
                    userData.EMP_NAME = ((AsynchronosMembershipUser)user).EMP_NAME;
                    userData.EMP_SURNAME = ((AsynchronosMembershipUser)user).EMP_SURNAME;
                    userData.EMP_TITLE_E = ((AsynchronosMembershipUser)user).EMP_TITLE_E;
                    userData.EMP_NAME_E = ((AsynchronosMembershipUser)user).EMP_NAME_E;
                    userData.EMP_SURNAME_E = ((AsynchronosMembershipUser)user).EMP_SURNAME_E;
                    userData.PASSWD = ((AsynchronosMembershipUser)user).PASSWD;
                    userData.EMAIL = ((AsynchronosMembershipUser)user).Email;
                    userData.CREATE_DATE = ((AsynchronosMembershipUser)user).CREATE_DATE;
                    userData.EXPIRE_DATE = ((AsynchronosMembershipUser)user).EXPIRE_DATE;
                    userData.UPDATE_DATE = ((AsynchronosMembershipUser)user).UPDATE_DATE;
                    userData.LAST_SIGN_ON_DATE = ((AsynchronosMembershipUser)user).LAST_SIGN_ON_DATE;
                    userData.LAST_CHANGE_PASS_DATE = ((AsynchronosMembershipUser)user).LAST_CHANGE_PASS_DATE;
                    userData.DEL_FLAG = ((AsynchronosMembershipUser)user).DEL_FLAG;

                    uow.Save();
                }
                else
                {
                    throw new AsynchronosProviderException("User " + user.UserName
                        + " not exists.");
                }
            }
        }

        public override bool ValidateUser(string username, string password)
        {
            if (isDebugEnabled)
                log.Debug("Invoke " + System.Reflection.MethodBase.GetCurrentMethod().Name);

            bool result = false;

            bool adResult = adAuth.IsAuthenticated(username, password);
            if (isDebugEnabled)
            {
                log.Debug("Username " + username +" authenticate "+adAuth);
            }

            if (LDAP_Only)
            {
                return adResult;
            }

            if (adResult)
            {
                DateTime currentDate = new DateTime(DateTime.Now.Year,
                                        DateTime.Now.Month,
                                        DateTime.Now.Day);

                using (UnitOfWork uow = new UnitOfWork())
                {
                    IQueryable<USER_DATA> userQuery = uow.UserDataRepo
                        .FindBy(u => u.EMP_ID.Equals(username)
                                //&& u.DEL_FLAG != true
                                );

                    //write log
                    if (isDebugEnabled) log.Debug(((ObjectQuery)userQuery).ToTraceString());

                    USER_DATA user = userQuery.FirstOrDefault<USER_DATA>();

                    if (user == null)
                    {
                        UserInfoException ex = new UserInfoException
                            ("Can't find user data " + username + " in database.");
                        log.Error(ex);
                        throw ex;
                    }

                    if (user.DEL_FLAG == null 
                        || user.DEL_FLAG != false)
                    {
                        UserInfoException ex = new UserInfoException
                            ("The user "+username + " is locked.");
                        log.Error(ex);
                        throw ex;
                    }

                    //check expire date (All App)
                    if (user.EXPIRE_DATE == null
                        || user.EXPIRE_DATE < currentDate)
                    {
                        string expireDate = "Null";

                        if (user.EXPIRE_DATE != null)
                        {
                            expireDate = user.EXPIRE_DATE.Value.ToString("dd/MMM/yyyy");
                        }

                        UserInfoException ex = new UserInfoException
                                ("Your account is expired. [" + expireDate + "]");
                        

                        log.Error(ex);
                        throw (ex);
                    }

                    ////get categoryList
                    //userQuery.Where(u => u.CATE_AND_EMP
                    //    .Where(cae => cae.DEL_FLAG.Value != true
                    //        && cae.CATEGORY.CATE_AND_APP
                    //            .Any(caa => caa.APPLICATION.APP_DESC == ApplicationName)))
                    //    .Select(cae);
                    //IQueryable<CATE_AND_EMP> categoryList = user
                    //    .CATE_AND_EMP.Where(cae => cae.DEL_FLAG.Value != true
                    //        && cae.CATEGORY.CATE_AND_APP
                    //            .Any(caa => caa.APPLICATION.APP_DESC == ApplicationName))
                    //    .AsQueryable<CATE_AND_EMP>();

                    ////get profile
                    //APP_PROFILE profile = userQuery
                    //    .APP_PROFILE.Where(p => p.APPLICATION.APP_DESC == ApplicationName)
                    //    .FirstOrDefault();

                    //if (profile != null) //&& profile.APPLICATION.APP_DESC.Equals(ApplicationName)
                    //{
                    //    if (profile.EXPIRE_DATE != null
                    //        && DateTime.Now > profile.EXPIRE_DATE.Value)
                    //    {
                    //        UserInfoException ex = new UserInfoException
                    //            ("Your account permission ["
                    //            + ApplicationName
                    //            + "] is expired on "
                    //            + userQuery
                    //            .EXPIRE_DATE.Value.ToString("dd/MM/yyyy") + ".");
                    //        log.Error(ex);
                    //        throw ex;
                    //    }

                    //    if (categoryList != null
                    //        && categoryList.Count >= 1)
                    //    {
                    //        result = true;

                    //        profile.LAST_ACTIVITY_DATE = DateTime.Now;
                    //        profile.LAST_ACTIVITY = "Sign On.";
                    //        profile.IS_AUTHENTICATED = true;

                    //        userQuery.LAST_SIGN_ON_DATE = DateTime.Now;

                    //        //update profile
                    //        uow.Save();
                    //    }
                    //    else
                    //    {
                    //        UserInfoException ex = new UserInfoException
                    //            ("You don't have any roles on application "
                    //            + ApplicationName + ".");
                    //        log.Error(ex);
                    //        throw ex;
                    //    }
                    //}
                    //else
                    //{
                    //    UserInfoException ex = new UserInfoException
                    //        ("You don't have permission to use application "
                    //        + ApplicationName + ".");
                    //    log.Error(ex);
                    //    throw ex;
                    //}
                }
                result = true;
            }

            return result;
        }

        /// <summary>
        /// GetUserFromLinq
        /// </summary>
        /// <param name="empId">รหัสพนักงาน</param>
        /// <param name="userIsOnline">เก็บข้อมูลว่า Online อยู่หรือไม่ (ยังไม่รองรับ)</param>
        /// <returns>MembershipUser</returns>
        private MembershipUser GetUserFromLinq(string empId, bool userIsOnline)
        {
            if (LDAP_Only)
            {
                throw new Exception("Can't get user in LDAP only mode.");
            }

            if (isDebugEnabled)
                log.Debug("Invoke " + System.Reflection.MethodBase.GetCurrentMethod().Name);

            AsynchronosMembershipUser membershipUser = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                USER_DATA user = uow.UserDataRepo.FindBy(u => u.EMP_ID == empId)
                    .FirstOrDefault<USER_DATA>();

                if (null == user)
                {
                    throw new AsynchronosProviderException("Can't find user " + empId);
                }

                APP_PROFILE profile = user.APP_PROFILE
                    .Where(ap => ap.APPLICATION.APP_DESC == ApplicationName)
                    .FirstOrDefault<APP_PROFILE>();

                membershipUser = new AsynchronosMembershipUser(this.Name,
                                                  user.EMP_ID,
                                                  user.EMP_ID,
                                                  user.EMAIL,
                                                  String.Empty,
                                                  String.Empty,
                                                  false,//isApproved,
                                                  false,//isLockedOut,
                                                  null != user.CREATE_DATE ? user.CREATE_DATE.Value : DateTime.Now,//creationDate,
                                                  null != user.LAST_SIGN_ON_DATE ? user.LAST_SIGN_ON_DATE.Value : DateTime.Now, //lastLoginDate,
                                                  null != profile ? profile.LAST_ACTIVITY_DATE.Value : DateTime.Now,//lastActivityDate,
                                                  DateTime.Now,//lastPasswordChangedDate,
                                                  DateTime.Now,//lastLockedOutDate,
                                                  user.EMP_TITLE,
                                                  user.EMP_NAME,
                                                  user.EMP_SURNAME,
                                                  user.EMP_TITLE_E,
                                                  user.EMP_NAME_E,
                                                  user.EMP_SURNAME_E,
                                                  user.PASSWD,
                                                  user.CREATE_DATE,
                                                  user.EXPIRE_DATE,
                                                  user.UPDATE_DATE,
                                                  user.LAST_SIGN_ON_DATE,
                                                  user.LAST_CHANGE_PASS_DATE,
                                                  user.DEL_FLAG);

                
                if (userIsOnline)
                {
                    if (null == profile)
                    {
                        APPLICATION app = uow.ApplicationRepo
                            .FindBy(a => a.APP_DESC == ApplicationName)
                            .FirstOrDefault<APPLICATION>();

                        profile = new APP_PROFILE();
                        profile.APP_KEY = app.APP_KEY;
                        profile.EMP_ID = user.EMP_ID;
                        profile.IS_AUTHENTICATED = null;

                        user.APP_PROFILE.Add(profile);
                        app.APP_PROFILE.Add(profile);
                    }

                    profile.LAST_ACTIVITY_DATE = DateTime.Now;
                    profile.LAST_ACTIVITY = Name + "." + System.Reflection.MethodBase.GetCurrentMethod().Name;

                    uow.Save();
                }
            }
            return membershipUser;
        }

        public static string GetMD5Hash(string value)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(value));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        public override bool ConfirmAccount(string accountConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override bool ConfirmAccount(string userName, string accountConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override string CreateAccount(string userName, string password, bool requireConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override string CreateUserAndAccount(string userName, string password, bool requireConfirmation, System.Collections.Generic.IDictionary<string, object> values)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteAccount(string userName)
        {
            throw new NotImplementedException();
        }

        public override string GeneratePasswordResetToken(string userName, int tokenExpirationInMinutesFromNow)
        {
            throw new NotImplementedException();
        }

        public override System.Collections.Generic.ICollection<OAuthAccountData> GetAccountsForUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetCreateDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetLastPasswordFailureDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetPasswordChangedDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override int GetPasswordFailuresSinceLastSuccess(string userName)
        {
            throw new NotImplementedException();
        }

        public override int GetUserIdFromPasswordResetToken(string token)
        {
            throw new NotImplementedException();
        }

        public override bool IsConfirmed(string userName)
        {
            throw new NotImplementedException();
        }

        public override bool ResetPasswordWithToken(string token, string newPassword)
        {
            throw new NotImplementedException();
        }
    }
}