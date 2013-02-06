using System;
using System.Linq;
using log4net;
using SME.UserSystem.Core.Exceptions;
using SME.UserSystem.Core.Model;

namespace SME.UserSystem.Core.DAL
{
    public class UserProfileRepository : IUserProfileRepository
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private UserSystemEntities _context;

        public UserProfileRepository(UserSystemEntities context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            _context = context;
        }

        #region Implement IDispose

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    if (_context != null)
                    {
                        _context.Dispose();
                        _context = null;
                    }
                }
                disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        #endregion Implement IDispose

        public void Save()
        {
            _context.SaveChanges();
        }

        public ProfileViewModel CreateProfileForUser(string username, string ApplicationName)
        {
            if (isDebugEnabled)
            {
                log.Debug("CreateProfileForUser");
            }

            APP_PROFILE ap = GetAppProfile(username, ApplicationName);

            if (null == ap)
            {
                //prepare profile to add to table APP_PROFILE
                ap = new APP_PROFILE();

                ap.EMP_ID = username;
                ap.APP_KEY = (from app in _context.APPLICATION
                              where app.APP_DESC == ApplicationName
                              select app.APP_KEY).FirstOrDefault();
                ap.CREATE_DATE = DateTime.Now;
                ap.LAST_ACTIVITY = "CreateProfileForUser";
                ap.LAST_ACTIVITY_DATE = DateTime.Now;
                ap.DEL_FLAG = false;
            }
            else
            {
                UpdateActivity(username, ApplicationName, "CreateProfileForUser");
            }
            //check exists emp in USER_DATA
            USER_DATA userData = GetUserData(username);

            if (null == userData)
            {
                //add new emp by see in TB_EMPLOYEE

                var emp = GetEmployee(username);

                //check exists in TB_EMPLOYEE
                if (null == emp)
                {
                    //not exists in TB_EMPLOYEE too
                    //insert new data to TB_EMPLOYEE or throw exception
                    throw new UserProfileException("Can't find employee " + userData + " in System.");
                }
                else
                {
                    //exists in TB_EMPLOYEE
                    //insert new data to USER_DATA use data from TB_EMPLOYEE
                    userData = new USER_DATA();
                    userData.APP_PROFILE.Add(ap);
                    AddUserData(userData, emp);
                }
            }
            else
            {
                //already emp record in USER_DATA
                //can add new profile
                userData.APP_PROFILE.Add(ap);
            }

            return new ProfileViewModel(ap);
        }

        public ProfileViewModel GetUserProfile(string empId, string appDesc)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetUserProfile");
            }

            ProfileViewModel pm = null;

            APP_PROFILE profile = GetAppProfile(empId, appDesc);

            if (null != profile)
            {
                pm = new ProfileViewModel(profile);
            }

            return pm;
        }

        public void UpdateUserProfile(ProfileViewModel profile, string appDesc)
        {
            if (isDebugEnabled)
            {
                log.Debug("UpdateUserProfile");
            }

            APP_PROFILE ap = GetAppProfile(profile.EMP_ID, appDesc);
            ap.DEL_FLAG = profile.APP_PROFILE_DEL_FLAG;
            ap.USER_DATA.EMAIL = profile.EMAIL;
            ap.EXPIRE_DATE = profile.EXPIRE_DATE;
            ap.IS_AUTHENTICATED = profile.IS_AUTHENTICATED;
            ap.LAST_ACTIVITY = profile.LAST_ACTIVITY;
            ap.LAST_ACTIVITY_DATE = profile.LAST_ACTIVITY_DATE;
            ap.USER_DATA.LAST_SIGN_ON_DATE = profile.LAST_SIGN_ON_DATE;
            ap.USER_DATA.DEL_FLAG = profile.USER_DATA_DEL_FLAG;
        }

        public APP_PROFILE GetAppProfile(string empId, string appDesc)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetAppProfile_appDesc");
            }

            return (from p in _context.APP_PROFILE
                    where p.EMP_ID == empId
                     && p.APPLICATION.APP_DESC == appDesc
                    //&& p.DEL_FLAG.Value == false
                    select p).FirstOrDefault();
        }

        public APP_PROFILE GetAppProfile(string empId, int appKey)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetAppProfile_appKey");
            }

            return (from p in _context.APP_PROFILE
                    where p.EMP_ID == empId
                     && p.APP_KEY == appKey
                    //&& p.DEL_FLAG.Value == false
                    select p).FirstOrDefault();
        }

        public void DeleteAppProfile(string empId, string appDesc)
        {
            if (isDebugEnabled)
            {
                log.Debug("DeleteAppProfile");
            }

            APP_PROFILE ap = GetAppProfile(empId, appDesc);

            if (ap != null)
            {
                _context.APP_PROFILE.DeleteObject(ap);
            }
            else
            {
                log.Info("User " + empId + " has no profile in application " + appDesc + ".");
            }
        }

        public void UpdateActivity(string empId, string appDesc, string activity)
        {
            if (isDebugEnabled)
            {
                log.Debug("UpdateActivity");
            }
            APP_PROFILE ap = GetAppProfile(empId, appDesc);

            if (ap == null)
            {
                ProfileViewModel pv = CreateProfileForUser(empId, appDesc);
                ap = GetAppProfile(empId, appDesc);
            }

            ap.LAST_ACTIVITY = activity;
            ap.LAST_ACTIVITY_DATE = DateTime.Now;
        }

        public USER_DATA GetUserData(string empId)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetUserData");
            }
            return (from u in _context.USER_DATA
                    where u.EMP_ID == empId
                    select u).FirstOrDefault();
        }

        public void AddUserData(USER_DATA user, TB_EMPLOYEE emp)
        {
            if (isDebugEnabled)
            {
                log.Debug("AddUserData");
            }
            //add USER_DATA from TB_EMPLOYEE
            //TB_EMPLOYEE emp = GetEmployee(userData.EMP_ID);

            user.CREATE_DATE = DateTime.Now;
            user.DEL_FLAG = false;
            user.EMAIL = emp.EMAIL;
            user.EMP_ID = emp.EMP_ID;
            user.EMP_NAME = emp.EMPNAME;
            user.EMP_NAME_E = emp.EMPNAME_E;
            user.EMP_SURNAME = emp.EMPSURNAME;
            user.EMP_SURNAME_E = emp.EMPSURNAME_E;
            user.EMP_TITLE = emp.TB_TITLE.TITLE_NAME;
            user.EMP_TITLE_E = emp.TB_TITLE.TITLE_NAME_E;
            user.LAST_CHANGE_PASS_DATE = null;
            user.LAST_SIGN_ON_DATE = null;
            user.PASSWD = emp.PASSWD;
            user.UPDATE_DATE = DateTime.Now;

            //emp.USER_DATAReference.Attach(user);
            //user.TB_EMPLOYEEReference.Attach(emp);

            _context.USER_DATA.AddObject(user);
            _context.ObjectStateManager.ChangeObjectState(user, System.Data.EntityState.Added);
        }

        public void DeleteUserData(string empId)
        {
            if (isDebugEnabled)
            {
                log.Debug("DeleteUserData");
            }
            USER_DATA user = GetUserData(empId);
            _context.USER_DATA.DeleteObject(user);
            _context.ObjectStateManager.ChangeObjectState(user, System.Data.EntityState.Deleted);
        }

        public TB_EMPLOYEE GetEmployee(string empId)
        {
            if (isDebugEnabled)
            {
                log.Debug("GetEmployee");
            }
            return (from e in _context.TB_EMPLOYEE
                    where e.EMP_ID == empId
                    select e).FirstOrDefault();
        }
    }
}