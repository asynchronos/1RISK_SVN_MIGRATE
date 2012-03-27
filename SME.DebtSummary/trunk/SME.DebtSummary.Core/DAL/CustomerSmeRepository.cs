using System.Collections.Generic;
using System.Linq;
using SME.DebtSummary.Core.Cache;
using SME.DebtSummary.Core.Model;

namespace SME.DebtSummary.Core.DAL
{
    public class CustomerSmeRepository : ICustomerSmeRepository, ICacheRepository
    {
        public readonly static string CACHE_NAME = "MIS_STATUS";

        public ICacheProvider Cache { get; set; }

        public CustomerSmeRepository()
            : this(new DefaultCacheProvider())
        {
        }

        public CustomerSmeRepository(ICacheProvider cacheProvider)
        {
            //this.DataContext = new Bay01_Entities();
            this.Cache = cacheProvider;
        }

        public List<Model.MISStatusViewModel> GetStatuses()
        {
            // First, check the cache
            List<MISStatusViewModel> statusList = Cache.Get(CACHE_NAME) as List<MISStatusViewModel>;

            // If it's not in the cache, we need to read it from the repository
            if (statusList == null)
            {
                // Get the repository data
                using (Bay01_Entities DataContext = new Bay01_Entities())
                {
                    statusList = (from s in DataContext.CUSTOMER_STATUS
                                  select new MISStatusViewModel
                                  {
                                      MISStatusID = s.STATUS_ID,
                                      MISStatus = s.STATUS_DETAIL,
                                      MISStatusOrdersPriority = s.PRIORITY
                                  }).OrderBy(s => s.MISStatusOrdersPriority).ToList();

                    if (statusList != null)
                    {
                        // Put this data into the cache for 480 minutes
                        Cache.Set(CACHE_NAME, statusList, 480);
                    }
                }
            }

            return statusList;
        }

        public void ClearCache()
        {
            Cache.Invalidate(CACHE_NAME);
        }
    }
}