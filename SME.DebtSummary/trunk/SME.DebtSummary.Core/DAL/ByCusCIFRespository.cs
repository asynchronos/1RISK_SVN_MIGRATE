using System.Collections.Generic;
using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public class ByCusCIFRespository : IByCusCIFRespository
    {
        public readonly static string ALL_CONSTANT_STR = "All";

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

        public IQueryable<Model.CustomerDebtViewModel> GetByCusCIFSMEsProjected(string rootEmpId, string misCustSizeId, string customerClass)
        {
            Bay01_Entities bayDataContext = new Bay01_Entities();
            EmployeeTreeRepository dataContext = null;

            IQueryable<Model.CustomerDebtViewModel> customerDebtView = from s in bayDataContext.CUSTOMER_SME
                                                                       from emp in bayDataContext.TB_EMPLOYEE.Where(e => e.EMP_ID == s.CM_CODE).DefaultIfEmpty()
                                                                       select new Model.CustomerDebtViewModel
                                                                       {
                                                                           CIF = s.CIF,
                                                                           CM_EMP_ID = s.CM_CODE,
                                                                           CM_FIRSTNAME = emp.EMPNAME,
                                                                           CM_LASTNAME = emp.EMPSURNAME,
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
                                                                           MISCustSizeID = s.CUSTOMER.CUSTOMER_SME.CUSTOMER_SME_SIZE.SIZE_ID,
                                                                           MISCustSize = s.CUSTOMER.CUSTOMER_SME.CUSTOMER_SME_SIZE.SIZE_DETAIL,
                                                                           MISCustSizeOrdersPriority = s.CUSTOMER.CUSTOMER_SME.CUSTOMER_SME_SIZE.PRIORITY,
                                                                           BaySize = s.CUSTOMER.ByCus_CIF.BaySize,
                                                                           BranchMaxPrin = s.CUSTOMER.ByCus_CIF.BranchMaxPrin,
                                                                           TdrFlag = s.CUSTOMER.ByCus_CIF.TdrFlag,
                                                                           Principal = s.CUSTOMER.ByCus_CIF.Principal,
                                                                           Accru = s.CUSTOMER.ByCus_CIF.Accru,
                                                                           Susp = s.CUSTOMER.ByCus_CIF.Susp,
                                                                           UseValue = s.CUSTOMER.ByCus_CIF.UseValue,
                                                                           TotResv = s.CUSTOMER.ByCus_CIF.Totresv,
                                                                           CM_Dep = s.CUSTOMER.ByCus_CIF.CM_Dep,
                                                                           MISStatusID = s.CUSTOMER.CUSTOMER_SME.STATUS_ID,
                                                                           MISStatus = s.CUSTOMER.CUSTOMER_SME.CUSTOMER_STATUS.STATUS_DETAIL,
                                                                           MISStatusPriority = s.CUSTOMER.CUSTOMER_SME.CUSTOMER_STATUS.PRIORITY
                                                                       };

            if (!string.IsNullOrEmpty(rootEmpId) && !rootEmpId.Equals(ALL_CONSTANT_STR))
            {
                if (null == dataContext)
                {
                    dataContext = new EmployeeTreeRepository();
                }

                List<GetEmployeeTree_Result> empTree = dataContext.GetEmployeeTree(rootEmpId);
                string[] empList = new string[empTree.Count];
                int count = 0;
                foreach (GetEmployeeTree_Result r in empTree)
                {
                    empList[count] = r.CATEGORY_VALUE;
                    count++;
                }

                customerDebtView = customerDebtView.Where(c => empList.Contains(c.CM_EMP_ID));
            }

            if (!string.IsNullOrEmpty(misCustSizeId) && !misCustSizeId.Equals(ALL_CONSTANT_STR))
            {
                if (misCustSizeId.Equals(Model.MISCustSieViewModel.UNKNOWN_ID.ToString()))
                {
                    customerDebtView = customerDebtView.Where(c => c.MISCustSizeID.Value.Equals(null));
                }
                else
                {
                    System.Int32 sizeId = 0;
                    if (System.Int32.TryParse(misCustSizeId, out sizeId))
                    {
                        customerDebtView = customerDebtView.Where(c => c.MISCustSizeID.Value.Equals(sizeId));
                    }
                }
            }

            if (!string.IsNullOrEmpty(customerClass) && !customerClass.Equals(ALL_CONSTANT_STR))
            {
                customerDebtView = customerDebtView.Where(c => c.Class.Equals(customerClass));
            }

            return customerDebtView;
        }

        public IQueryable<Model.MISCustSieViewModel> GetMISCustSizeListFromData(string rootEmpId)
        {
            return (from z in GetByCusCIFSMEsProjected(rootEmpId, null, null)
                    select new Model.MISCustSieViewModel
                    {
                        MISCustSizeID = z.MISCustSizeID,
                        MISCustSize = z.MISCustSize,
                        MISCustSizeOrdersPriority = z.MISCustSizeOrdersPriority
                    }).Distinct().OrderBy(r => r.MISCustSizeOrdersPriority);
        }
    }
}