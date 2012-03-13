using System.Collections.Generic;
using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public class ByCusCIFRespository : IByCusCIFRespository
    {
        public IQueryable<ByCus_CIF> GetByCusCIFs()
        {
            Bay01_Entities dataContext = new Bay01_Entities();
            IQueryable<ByCus_CIF> byCusCIFs = from b in dataContext.ByCus_CIF
                                              select b;

            return byCusCIFs;
        }

        public IQueryable<ByCus_CIF> GetByCusCIFSMEs()
        {
            throw new System.NotImplementedException();
        }

        public IQueryable<CUSTOMER_SME> GetCustomerSMEs()
        {
            Bay01_Entities dataContext = new Bay01_Entities();
            IQueryable<CUSTOMER_SME> customerSmes = from s in dataContext.CUSTOMER_SME
                                                    select s;

            return customerSmes;
        }

        public IQueryable<CUSTOMER_SME> GetCustomerSMEs(string rootEmpId)
        {
            EmployeeTreeRepository dataContext = new EmployeeTreeRepository();
            List<GetEmployeeTree_Result> empTree = dataContext.GetEmployeeTree(rootEmpId);
            string[] empList = new string[empTree.Count];
            int count = 0;
            foreach (GetEmployeeTree_Result r in empTree)
            {
                empList[count] = r.CATEGORY_VALUE;
                count++;
            }

            IQueryable<CUSTOMER_SME> cusSme = GetCustomerSMEs().Where(s => empList.Contains(s.CM_CODE));

            return cusSme;
        }

        public IQueryable<Model.CustomerDebtViewModel> GetByCusCIFSMEsProjected(string rootEmpId, string empIdFilter)
        {
            IQueryable<CUSTOMER_SME> customerSmes;

            if (string.IsNullOrEmpty(rootEmpId))
            {
                customerSmes = GetCustomerSMEs();
            }
            else
            {
                customerSmes = GetCustomerSMEs(rootEmpId);
            }

            IQueryable<Model.CustomerDebtViewModel> customerDebtView = from s in customerSmes
                                                                       select new Model.CustomerDebtViewModel
                                                                       {
                                                                           CIF = s.CIF,
                                                                           CM_EMP_ID = s.CM_CODE,
                                                                           CusTitle = s.CUSTOMER.CUS_TITLE,
                                                                           CusFirstName = s.CUSTOMER.CUS_FIRST,
                                                                           CusLastName = s.CUSTOMER.CUS_LAST,
                                                                           CusTitle2 = s.CUSTOMER.CUS1_TITLE,
                                                                           CusFirstName2 = s.CUSTOMER.CUS1_FIRST,
                                                                           CusLastName2 = s.CUSTOMER.CUS1_LAST,
                                                                           CusTitle3 = s.CUSTOMER.CUS2_TITLE,
                                                                           CusFirstName3 = s.CUSTOMER.CUS2_FIRST,
                                                                           CusLastName3 = s.CUSTOMER.CUS2_LAST,
                                                                           CusTitle4 = s.CUSTOMER.CUS3_TITLE,
                                                                           CusFirstName4 = s.CUSTOMER.CUS3_FIRST,
                                                                           CusLastName4 = s.CUSTOMER.CUS3_LAST,
                                                                           Rating = s.CUSTOMER.RATING,
                                                                           Class = s.CUSTOMER.CLASS,
                                                                           ClassE = s.CUSTOMER.ByCus_CIF.ClassE,
                                                                           BaySize = s.CUSTOMER.ByCus_CIF.BaySize,
                                                                           BranchMaxPrin = s.CUSTOMER.ByCus_CIF.BranchMaxPrin,
                                                                           TdrFlag = s.CUSTOMER.ByCus_CIF.TdrFlag,
                                                                           Principal = s.CUSTOMER.ByCus_CIF.Principal,
                                                                           Accru = s.CUSTOMER.ByCus_CIF.Accru,
                                                                           Susp = s.CUSTOMER.ByCus_CIF.Susp,
                                                                           UseValue = s.CUSTOMER.ByCus_CIF.UseValue,
                                                                           TotResv = s.CUSTOMER.ByCus_CIF.Totresv,
                                                                           CM_Dep = s.CUSTOMER.ByCus_CIF.CM_Dep
                                                                       };

            if (!string.IsNullOrEmpty(empIdFilter))
            {
                EmployeeTreeRepository dataContext = new EmployeeTreeRepository();
                List<GetEmployeeTree_Result> empTree = dataContext.GetEmployeeTree(empIdFilter);
                string[] empList = new string[empTree.Count];
                int count = 0;
                foreach (GetEmployeeTree_Result r in empTree)
                {
                    empList[count] = r.CATEGORY_VALUE;
                    count++;
                }

                customerDebtView = customerDebtView.Where(c => empList.Contains(c.CM_EMP_ID));
            }

            return customerDebtView;
        }
    }
}