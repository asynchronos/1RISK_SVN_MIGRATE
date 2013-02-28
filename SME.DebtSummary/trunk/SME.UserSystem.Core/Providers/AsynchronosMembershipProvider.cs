using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Objects;
using System.Linq;
using System.Web.Security;
using log4net;
using SME.UserSystem.Core.AD;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.Exceptions;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosMembershipProvider : MembershipProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

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
            throw new System.NotImplementedException();
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new System.NotImplementedException();
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

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            throw new System.NotImplementedException();
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new System.NotImplementedException();
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
                throw new System.NotImplementedException();
                //return false;
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

        public override bool UnlockUser(string userName)
        {
            throw new System.NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new System.NotImplementedException();
        }

        public override bool ValidateUser(string username, string password)
        {
            bool result = false;

            //use own database
            //using (Bay01_Entities en = new Bay01_Entities())
            //{
            //    var queryUser = (from user in en.TB_EMPLOYEE
            //                     where user.EMP_ID == username
            //                     //&& user.EXPIRE_DATE >= DateTime.Now
            //                     //&& user.DEL_FLAG == false
            //                     select user);

            //    if (queryUser.FirstOrDefault() != null)
            //    {
            //        if (queryUser.FirstOrDefault().PASSWD.Equals(password))
            //        {
            //            result = true;
            //            //queryUser.FirstOrDefault().LAST_SIGN_ON_DATE = DateTime.Now;
            //            //en.SaveChanges();
            //            en.Dispose();
            //        }
            //    }
            //}

            LdapAuthentication adAuth = new LdapAuthentication();
            bool adResult = adAuth.IsAuthenticated(username, password);

            if (adResult)
            {
                DateTime currentDate = new DateTime(DateTime.Now.Year,
                                        DateTime.Now.Month,
                                        DateTime.Now.Day);
                using (UnitOfWork uow = new UnitOfWork())
                {
                    IQueryable<USER_DATA> user = uow.UserData
                        .FindBy(u => u.EMP_ID.Equals(username)
                                && u.DEL_FLAG != true);

                    log.Debug(((ObjectQuery)user).ToTraceString());

                    //IUserProfileDTO profile = uow.GetUserProfileDTO(username, ApplicationName);

                    if (user.FirstOrDefault<USER_DATA>() != null)
                    {
                        //check expire date (All App)
                        if (user.FirstOrDefault<USER_DATA>().EXPIRE_DATE != null
                            && user.FirstOrDefault<USER_DATA>().EXPIRE_DATE >= currentDate)
                        {
                            throw new UserInfoException
                                    ("You account is expired on "
                                    + user.FirstOrDefault<USER_DATA>()
                                    .EXPIRE_DATE.Value.ToString("dd/MM/yyyy") + ".");
                        }

                        //get profile
                        APP_PROFILE profile = user.FirstOrDefault<USER_DATA>()
                            .APP_PROFILE.Where(p => p.APPLICATION.APP_DESC == ApplicationName)
                            .FirstOrDefault();

                        //get categoryList
                        List<CATE_AND_EMP> categoryList = user.FirstOrDefault<USER_DATA>()
                        .CATE_AND_EMP.Where(cae => cae.DEL_FLAG.Value != true
                            && cae.CATEGORY.CATE_AND_APP
                                .Any(caa => caa.APP_KEY == profile.APP_KEY))
                        .ToList<CATE_AND_EMP>();

                        if (profile != null) //&& profile.APPLICATION.APP_DESC.Equals(ApplicationName)
                        {
                            if (categoryList != null
                                && categoryList.Count >= 1)
                            {
                                result = true;

                                profile.LAST_ACTIVITY_DATE = DateTime.Now;
                                profile.LAST_ACTIVITY = "Sign On.";
                                profile.IS_AUTHENTICATED = true;

                                user.FirstOrDefault<USER_DATA>()
                                    .LAST_SIGN_ON_DATE = DateTime.Now;

                                //update profile
                                uow.Save();
                            }
                            else
                            {
                                throw new UserInfoException
                                    ("You don't have any roles on application "
                                    + ApplicationName + ".");
                            }
                        }
                        else
                        {
                            throw new UserInfoException
                                ("You don't have permission to use application "
                                + ApplicationName + ".");
                        }
                    }
                    else
                    {
                        throw new UserInfoException
                            ("Can't find user data " + username + ".");
                    }
                }
            }

            return result;
        }
    }
}