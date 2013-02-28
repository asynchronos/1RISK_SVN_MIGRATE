using System;
using System.Data;
using System.Data.Objects;
using System.Linq;
using System.Linq.Expressions;
using log4net;

namespace SME.UserSystem.Core.DAL
{
    public class GenericRespository<T> : IGenericRepository<T>
        where T : class
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        internal UserSystemEntities context;
        internal ObjectSet<T> objectSet;

        public GenericRespository(UserSystemEntities context)
        {
            this.context = context;
            this.objectSet = context.CreateObjectSet<T>();
        }

        public IQueryable<T> GetAll()
        {
            IQueryable<T> query = this.objectSet;
            return query;
        }

        public IQueryable<T> FindBy(Expression<Func<T, bool>> predicate)
        {
            IQueryable<T> query = this.objectSet.Where(predicate);
            return query;
        }

        public void Add(T entity)
        {
            this.objectSet.AddObject(entity);
            //this.context.ObjectStateManager
            //    .GetObjectStateEntry(entity)
            //    .ChangeState(EntityState.Added);
        }

        public void Delete(T entity)
        {
            if (this.context
                .ObjectStateManager
                .GetObjectStateEntry(entity).Equals(EntityState.Detached))
            {
                this.objectSet.Attach(entity);
            }
            this.objectSet.DeleteObject(entity);

            //this.context.ObjectStateManager
            //    .GetObjectStateEntry(entity)
            //    .ChangeState(EntityState.Deleted);
        }

        public void Edit(T entity)
        {
            this.objectSet.Attach(entity);
            this.context.ObjectStateManager
                .GetObjectStateEntry(entity)
                .ChangeState(EntityState.Modified);
        }

        public void Save()
        {
            this.context.SaveChanges();
        }
    }
}