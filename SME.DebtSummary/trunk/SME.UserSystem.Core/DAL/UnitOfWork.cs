using System;
using log4net;

namespace SME.UserSystem.Core.DAL
{
    public class UnitOfWork : IDisposable
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private UserSystemEntities context = new UserSystemEntities();
        //private ApplicationRepository applicationRepo;
        private GenericRespository<APPLICATION> applicationRepo;
        private GenericRespository<APP_PROFILE> appProfileRepo;
        private GenericRespository<USER_DATA> userDataRepo;
        private GenericRespository<CATE_AND_EMP> cateAndEmpRepo;
        private GenericRespository<CATEGORY> categoryRepo;
        private GenericRespository<CATE_AND_APP> cateAndAppRepo;

        public UserSystemEntities Context
        {
            get
            {
                return this.context;
            }
        }

        //public ApplicationRepository ApplicationRepo
        //{
        //    get
        //    {
        //        if (this.applicationRepo == null)
        //        {
        //            this.applicationRepo = new ApplicationRepository(context);
        //        }

        //        return this.applicationRepo;
        //    }
        //}

        public GenericRespository<APPLICATION> ApplicationRepo
        {
            get
            {
                if (this.applicationRepo == null)
                {
                    this.applicationRepo = new GenericRespository<APPLICATION>(context);
                }

                return this.applicationRepo;
            }
        }

        public GenericRespository<APP_PROFILE> AppProfileRepo
        {
            get
            {
                if (this.appProfileRepo == null)
                {
                    this.appProfileRepo = new GenericRespository<APP_PROFILE>(context);
                }

                return this.appProfileRepo;
            }
        }

        public GenericRespository<USER_DATA> UserDataRepo
        {
            get
            {
                if (this.userDataRepo == null)
                {
                    this.userDataRepo = new GenericRespository<USER_DATA>(context);
                }

                return this.userDataRepo;
            }
        }

        public GenericRespository<CATE_AND_EMP> CateAndEMPRepo
        {
            get
            {
                if (this.cateAndEmpRepo == null)
                {
                    this.cateAndEmpRepo = new GenericRespository<CATE_AND_EMP>(context);
                }

                return this.cateAndEmpRepo;
            }
        }

        public GenericRespository<CATEGORY> CategoryRepo
        {
            get
            {
                if (this.categoryRepo == null)
                {
                    this.categoryRepo = new GenericRespository<CATEGORY>(context);
                }

                return this.categoryRepo;
            }
        }

        public GenericRespository<CATE_AND_APP> CateAndAppRepo
        {
            get
            {
                if (this.cateAndAppRepo == null)
                {
                    this.cateAndAppRepo = new GenericRespository<CATE_AND_APP>(context);
                }

                return this.cateAndAppRepo;
            }
        }

        public void Save()
        {
            this.context.SaveChanges();
        }

        #region Implement IDispose

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    if (context != null)
                    {
                        context.Dispose();
                        context = null;
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
    }
}