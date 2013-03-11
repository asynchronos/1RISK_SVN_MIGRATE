using System;
using System.Collections.Generic;
using System.Linq;
using log4net;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.DTO;
using SME.UserSystem.Core.Exceptions;

namespace SME.UserSystem.Core.BL
{
    public class UserBL : IUserBL
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        //public UserBL(EntityConnection connection)
        //{
        //    this.uow = new UnitOfWork(connection);
        //}

        private UnitOfWork uow;

        public UnitOfWork UOW
        {
            get
            {
                return this.uow;
            }
        }

        public void Save()
        {
            uow.Save();
        }

        #region Implement IDispose

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    if (uow != null)
                    {
                        uow.Dispose();
                        uow = null;
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

        public IUserProfileDTO GetUserProfileDTO(string empId, string appDesc)
        {
            return GetUserProfileDTO(empId
                , GetApplication(appDesc).APP_KEY);
        }

        public IUserProfileDTO GetUserProfileDTO(string empId, int appKey)
        {
            UserProfileDTO up = null;

            USER_DATA uTable = GetUserData(empId);
            APP_PROFILE apTable = uTable.APP_PROFILE.Where(ap => ap.APP_KEY == appKey)
                .FirstOrDefault<APP_PROFILE>();

            up = new UserProfileDTO();
            up.EMP_ID = uTable.EMP_ID;
            up.EMP_FULLNAME = uTable.EMP_TITLE + uTable.EMP_NAME + " " + uTable.EMP_SURNAME;
            up.EMP_FULLNAME_E = uTable.EMP_TITLE_E + "." + uTable.EMP_NAME_E + " " + uTable.EMP_SURNAME_E;
            up.PASSWD = uTable.PASSWD;
            up.EMAIL = uTable.EMAIL;
            up.LAST_SIGN_ON_DATE = uTable.LAST_SIGN_ON_DATE;
            up.EXPIRE_DATE = uTable.EXPIRE_DATE;
            up.USER_DATA_DEL_FLAG = uTable.DEL_FLAG;

            string categoriesStr = string.Empty;
            List<CATEGORY> categories = null;
            var iterator = uTable.CATE_AND_EMP.GetEnumerator();
            while (iterator.MoveNext())
            {
                if (null != iterator.Current)
                {
                    if (null == categories)
                    {
                        categories = new List<CATEGORY>();
                    }

                    categoriesStr = categoriesStr + "|" + iterator.Current.CATEGORY_KEY;

                    CATEGORY c = new CATEGORY();
                    c.CATEGORY_DESC = iterator.Current.CATEGORY.CATEGORY_DESC;
                    c.CATEGORY_DESC_TH = iterator.Current.CATEGORY.CATEGORY_DESC_TH;
                    c.CATEGORY_KEY = iterator.Current.CATEGORY.CATEGORY_KEY;
                    c.CATEGORY_TYPE = iterator.Current.CATEGORY.CATEGORY_TYPE;
                    c.CATEGORY_TYPE_KEY = iterator.Current.CATEGORY.CATEGORY_TYPE_KEY;
                    c.CATEGORY_VALUE = iterator.Current.CATEGORY.CATEGORY_VALUE;
                    c.DEL_FLAG = iterator.Current.CATEGORY.DEL_FLAG;
                    c.PRIORITY = iterator.Current.CATEGORY.PRIORITY;
                    categories.Add(c);
                }
            }

            if (System.String.Empty != categoriesStr && null != categoriesStr)
                categoriesStr = categoriesStr.Substring(1);

            up.CATEGORY_LIST = categories;
            up.CATEGORIES_STR = categoriesStr;

            string tempAppDesc = String.Empty;

            if (apTable == null)
            {
                tempAppDesc = GetApplication(appKey).APP_DESC;

                apTable = new APP_PROFILE();
                apTable.APP_KEY = appKey;
                apTable.CREATE_DATE = DateTime.Now;
                apTable.EMP_ID = empId;
                apTable.IS_AUTHENTICATED = null;
                apTable.LAST_ACTIVITY = "Insert App Profile";
                apTable.LAST_ACTIVITY_DATE = DateTime.Now;

                uTable.APP_PROFILE.Add(apTable);
            }
            else
            {
                tempAppDesc = apTable.APPLICATION.APP_DESC;
            }

            up.APP_DESC = tempAppDesc;

            up.APP_KEY = apTable.APP_KEY;
            up.LAST_ACTIVITY = apTable.LAST_ACTIVITY;
            up.LAST_ACTIVITY_DATE = apTable.LAST_ACTIVITY_DATE;
            up.IS_AUTHENTICATED = apTable.IS_AUTHENTICATED;

            return up;
        }

        public USER_DATA GetUserData(string empId)
        {
            return this.UOW.UserDataRepo.FindBy(u => u.EMP_ID == empId)
                .FirstOrDefault<USER_DATA>();
        }

        public void UpdateUserProfileDTO(IUserProfileDTO userProfile, int appKey)
        {
            USER_DATA uTable = GetUserData(userProfile.EMP_ID);

            if (uTable == null)
            {
                throw new UserInfoException("Not found user data " + userProfile.EMP_ID + ".");
            }
            else
            {
                //update user date
                uTable.EMP_ID = userProfile.EMP_ID;
                uTable.PASSWD = userProfile.PASSWD;
                uTable.EMAIL = userProfile.EMAIL;
                uTable.LAST_SIGN_ON_DATE = userProfile.LAST_SIGN_ON_DATE;
                uTable.EXPIRE_DATE = userProfile.EXPIRE_DATE;
                uTable.DEL_FLAG = userProfile.USER_DATA_DEL_FLAG;

                //get app profile
                APP_PROFILE apTable = uTable.APP_PROFILE.Where(ap => ap.APP_KEY == appKey)
                    .FirstOrDefault<APP_PROFILE>();

                if (apTable == null)
                {
                    //insert new app profile

                    apTable = new APP_PROFILE();

                    apTable.APP_KEY = appKey;
                    apTable.EMP_ID = userProfile.EMP_ID;
                    apTable.CREATE_DATE = DateTime.Now;
                    apTable.IS_AUTHENTICATED = userProfile.IS_AUTHENTICATED;
                    apTable.LAST_ACTIVITY = userProfile.LAST_ACTIVITY;
                    apTable.LAST_ACTIVITY_DATE = userProfile.LAST_ACTIVITY_DATE;

                    uTable.APP_PROFILE.Add(apTable);
                    GetApplication(appKey).APP_PROFILE.Add(apTable);

                    //this.UOW.Context.ObjectStateManager.GetObjectStateEntry(apTable)
                    //.ChangeState(System.Data.EntityState.Added);
                }
                else
                {
                    //update old app profile
                    apTable.LAST_ACTIVITY = userProfile.LAST_ACTIVITY;
                    apTable.LAST_ACTIVITY_DATE = userProfile.LAST_ACTIVITY_DATE;
                    apTable.IS_AUTHENTICATED = userProfile.IS_AUTHENTICATED;

                    //this.UOW.Context.ObjectStateManager.GetObjectStateEntry(apTable)
                    //.ChangeState(System.Data.EntityState.Modified);
                }
            }
        }

        public APPLICATION GetApplication(int appKey)
        {
            return this.UOW.ApplicationRepo.FindBy(a => a.APP_KEY == appKey)
                .FirstOrDefault<APPLICATION>();
        }

        public APPLICATION GetApplication(string appName)
        {
            return this.UOW.ApplicationRepo.FindBy(a => a.APP_DESC == appName)
                .FirstOrDefault<APPLICATION>();
        }

        public IEnumerable<APP_PROFILE> GetAllAppProfile()
        {
            return this.UOW.AppProfileRepo.GetAll().DefaultIfEmpty<APP_PROFILE>();
        }

        //public void InsertAppProfile(APP_PROFILE appProfile)
        //{
        //    GetUserData(appProfile.EMP_ID).APP_PROFILE.Add(appProfile);
        //    GetApplication(appProfile.APP_KEY.Value).APP_PROFILE.Add(appProfile);
        //}
    }
}