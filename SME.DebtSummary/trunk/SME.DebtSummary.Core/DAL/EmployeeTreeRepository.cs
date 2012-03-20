using System.Collections.Generic;
using System.Linq;
using SME.DebtSummary.Core.Cache;

namespace SME.DebtSummary.Core.DAL
{
    public class EmployeeTreeRepository : IEmployeeTreeRepository, ICacheRepository
    {
        //protected Bay01_Entities DataContext { get; private set; }
        public readonly static string CACHE_NAME = "EMP_TREE";
        public readonly static string SPACE_CHAR = "---";

        private List<string> cacheList = new List<string>();

        public ICacheProvider Cache { get; set; }

        public EmployeeTreeRepository()
            : this(new DefaultCacheProvider())
        {
        }

        public EmployeeTreeRepository(ICacheProvider cacheProvider)
        {
            //this.DataContext = new Bay01_Entities();
            this.Cache = cacheProvider;
        }

        public List<GetEmployeeTree_Result> GetEmployeeTree()
        {
            // First, check the cache
            List<GetEmployeeTree_Result> empTreesData = Cache.Get(CACHE_NAME) as List<GetEmployeeTree_Result>;

            // If it's not in the cache, we need to read it from the repository
            if (empTreesData == null)
            {
                // Get the repository data
                using (Bay01_Entities DataContext = new Bay01_Entities())
                {
                    empTreesData = DataContext.GetEmployeeTree().ToList<GetEmployeeTree_Result>();
                    foreach (GetEmployeeTree_Result empTree in empTreesData)
                    {
                        for (int i = 0; i < empTree.TREE_LEVEL; i++)
                        {
                            empTree.CATEGORY_DESC = SPACE_CHAR + empTree.CATEGORY_DESC;
                            empTree.CATEGORY_DESC_TH = SPACE_CHAR + empTree.CATEGORY_DESC_TH;
                        }
                    }

                    if (empTreesData != null)
                    {
                        // Put this data into the cache for 120 minutes
                        Cache.Set(CACHE_NAME, empTreesData, 120);
                    }
                }
            }

            return empTreesData;
        }

        public void ClearCache()
        {
            Cache.Invalidate(CACHE_NAME);
            foreach (string cacheName in cacheList)
            {
                Cache.Invalidate(cacheName);
                cacheList.Remove(cacheName);
            }
            //cacheList.Clear();
        }

        public List<GetEmployeeTree_Result> GetEmployeeTree(string rootEmpId)
        {
            // First, check the cache
            List<GetEmployeeTree_Result> subEmpTreesData = null;

            if (string.IsNullOrEmpty(rootEmpId) || rootEmpId.Equals("All"))
            {
                subEmpTreesData = GetEmployeeTree();
            }
            else
            {
                subEmpTreesData = Cache.Get(CACHE_NAME + rootEmpId) as List<GetEmployeeTree_Result>;
                // If it's not in the cache, we need to read it from the repository
                if (subEmpTreesData == null)
                {
                    // Get the repository data
                    List<GetEmployeeTree_Result> originalList = GetEmployeeTree().Where(r => r.TREE_LEVEL_EMP_ID.Contains(rootEmpId)).ToList();
                    int startLevel = originalList.FirstOrDefault().TREE_LEVEL.Value;

                    subEmpTreesData = new List<GetEmployeeTree_Result>(originalList.Count);
                    foreach (GetEmployeeTree_Result emp in originalList)
                    {
                        GetEmployeeTree_Result dupEmp = new GetEmployeeTree_Result();
                        dupEmp.CATEGORY_DEL_FLAG = emp.CATEGORY_DEL_FLAG;
                        dupEmp.CATEGORY_DESC = emp.CATEGORY_DESC.Substring(SPACE_CHAR.Length * startLevel);
                        dupEmp.CATEGORY_DESC_TH = emp.CATEGORY_DESC_TH.Substring(SPACE_CHAR.Length * startLevel);
                        dupEmp.CATEGORY_KEY = emp.CATEGORY_KEY;
                        dupEmp.CATEGORY_PRIORITY = emp.CATEGORY_PRIORITY;
                        dupEmp.CATEGORY_TYPE_DEL_FLAG = emp.CATEGORY_TYPE_DEL_FLAG;
                        dupEmp.CATEGORY_TYPE_DESC = emp.CATEGORY_TYPE_DESC;
                        dupEmp.CATEGORY_TYPE_DESC_TH = emp.CATEGORY_TYPE_DESC_TH;
                        dupEmp.CATEGORY_TYPE_KEY = emp.CATEGORY_TYPE_KEY;
                        dupEmp.CATEGORY_TYPE_PRIORITY = emp.CATEGORY_TYPE_PRIORITY;
                        dupEmp.CATEGORY_TYPE_VALUE = emp.CATEGORY_TYPE_VALUE;
                        dupEmp.CATEGORY_VALUE = emp.CATEGORY_VALUE;
                        dupEmp.ID = emp.ID;
                        dupEmp.PARENT_CATEGORY_KEY = emp.PARENT_CATEGORY_KEY;
                        dupEmp.RECURSIVE_DEL_FLAG = emp.RECURSIVE_DEL_FLAG;
                        dupEmp.TREE_LEVEL = emp.TREE_LEVEL;
                        dupEmp.TREE_LEVEL_CATE_KEY = emp.TREE_LEVEL_CATE_KEY;
                        dupEmp.TREE_LEVEL_EMP_ID = emp.TREE_LEVEL_EMP_ID;

                        subEmpTreesData.Add(dupEmp);
                    }

                    if (subEmpTreesData != null)
                    {
                        // Put this data into the cache for 30 minutes
                        Cache.Set(CACHE_NAME + rootEmpId, subEmpTreesData, 30);
                        cacheList.Add(CACHE_NAME + rootEmpId);
                    }
                }
            }

            return subEmpTreesData;
        }
    }
}