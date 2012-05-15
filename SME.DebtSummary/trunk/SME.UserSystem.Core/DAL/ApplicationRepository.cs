using System;
using System.Collections.Generic;
using System.Linq;
using log4net;

namespace SME.UserSystem.Core.DAL
{
    public class ApplicationRepository : IApplicationRepository
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private UserSystemEntities _context;

        public ApplicationRepository(UserSystemEntities context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            _context = context;
        }

        public IEnumerable<APPLICATION> GetApplications()
        {
            throw new NotImplementedException();
        }

        public APPLICATION GetApplicationByAppKey(int appKey)
        {
            throw new NotImplementedException();
        }

        public APPLICATION GetApplicationByAppDesc(string appDesc)
        {
            APPLICATION app = (from a in _context.APPLICATION
                               where a.APP_DESC == appDesc
                               select a).FirstOrDefault();

            return app;
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