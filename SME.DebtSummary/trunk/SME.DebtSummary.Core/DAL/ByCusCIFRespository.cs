using System.Collections.Generic;
using System.Linq;
using SME.DebtSummary.Core.Model;

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

        public IQueryable<CustomerDebtViewModel> GetByCusCIFSMEsProjected(string rootEmpId, string misCustSizeId, string misStatusId, string customerClass)
        {
            IQueryable<CustomerDebtViewModel> customerDebtView = null;
            Bay01_Entities bayDataContext = new Bay01_Entities();

            EmployeeTreeRepository dataContext = null;

            customerDebtView = (from s in bayDataContext.CUSTOMER_SME
                                from emp in bayDataContext.TB_EMPLOYEE.Where(e => e.EMP_ID == s.CM_CODE).DefaultIfEmpty()
                                select new CustomerDebtViewModel
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
                                });

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

                customerDebtView = (from c in customerDebtView
                                    select c).Where(c => empList.Contains(c.CM_EMP_ID));
                //customerDebtView.Where(c => empList.Contains(c.CM_EMP_ID));
            }

            if (!string.IsNullOrEmpty(misCustSizeId) && !misCustSizeId.Equals(ALL_CONSTANT_STR))
            {
                if (misCustSizeId.Equals(MISCustSieViewModel.UNKNOWN_ID.ToString()))
                {
                    customerDebtView = (from c in customerDebtView
                                        select c).Where(c => c.MISCustSizeID.Value.Equals(null));
                }
                else
                {
                    System.Int32 sizeId = 0;
                    if (System.Int32.TryParse(misCustSizeId, out sizeId))
                    {
                        customerDebtView = (from c in customerDebtView
                                            select c).Where(c => sizeId.Equals(c.MISCustSizeID.Value));
                    }
                }
            }

            if (!string.IsNullOrEmpty(misStatusId) && !misStatusId.Equals(ALL_CONSTANT_STR))
            {
                if (misStatusId.Equals(MISStatusViewModel.UNKNOWN_ID.ToString()))
                {
                    customerDebtView = (from c in customerDebtView
                                        select c).Where(c => c.MISStatusID.Value.Equals(null));
                }
                else
                {
                    System.Int32 statusId = 0;
                    if (System.Int32.TryParse(misStatusId, out statusId))
                    {
                        customerDebtView = (from c in customerDebtView
                                            select c).Where(c => statusId.Equals(c.MISStatusID.Value));
                    }
                }
            }

            if (!string.IsNullOrEmpty(customerClass) && !customerClass.Equals(ALL_CONSTANT_STR))
            {
                customerDebtView = (from c in customerDebtView
                                    select c).Where(c => customerClass.Equals(c.Class));
            }

            return customerDebtView;
        }

        public IQueryable<MISCustSieViewModel> GetMISCustSizeListFromData(string rootEmpId)
        {
            return (from z in GetByCusCIFSMEsProjected(rootEmpId, null, null, null)
                    select new MISCustSieViewModel
                    {
                        MISCustSizeID = z.MISCustSizeID,
                        MISCustSize = z.MISCustSize,
                        MISCustSizeOrdersPriority = z.MISCustSizeOrdersPriority
                    }).Distinct().OrderBy(r => r.MISCustSizeOrdersPriority);
        }
    }
}