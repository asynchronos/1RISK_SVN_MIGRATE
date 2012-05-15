using System;
using System.Linq;
using log4net;

namespace SME.UserSystem.Core.DAL
{
    public class UserDataRepository : IUserDataRepository
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private UserSystemEntities _context;

        public UserDataRepository(UserSystemEntities context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            _context = context;
        }

        public USER_DATA GetUserByEmpId(string empId)
        {
            USER_DATA user = (from u in _context.USER_DATA
                              where u.EMP_ID == empId
                              select u).FirstOrDefault();

            return user;
        }

        public void UpdateActivity(string empId)
        {
            GetUserByEmpId(empId).LAST_SIGN_ON_DATE = DateTime.Now;
        }

        public void Save()
        {
            _context.SaveChanges();
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
    }
}