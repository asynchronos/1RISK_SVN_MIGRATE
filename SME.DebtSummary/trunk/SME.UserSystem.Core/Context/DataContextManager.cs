using System;
using System.Data.Linq;
using log4net;

namespace SME.UserSystem.Core.Context
{
    public static class DataContextManager<T> where T : DataContext, new()
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static T _context = null;

        static DataContextManager()
        {
            lock (typeof(DataContextManager<T>))
            {
                if (null == _context)
                {
                    _context = new T();
                }
            }
        }

        public static T GetInstance()
        {
            return (null == _context) ? new T() : _context;
        }

        public static void UpdateEntity<K>(K entity, Action<K> updateAction)
            where K : class
        {
            T instance = GetInstance();
            //As a precation attach entity to a DataContext before update.
            //Context might be lost when passing through application boundaries.
            instance.GetTable<K>().Attach(entity, true);
            updateAction(entity);
            instance.SubmitChanges();
        }

        public static void DeleteEntity<K>(K entity) where K : class
        {
            T instance = GetInstance();
            Table<K> table = instance.GetTable<K>();
            table.Attach(entity);
            table.DeleteOnSubmit(entity);
            instance.SubmitChanges();
        }
    }
}