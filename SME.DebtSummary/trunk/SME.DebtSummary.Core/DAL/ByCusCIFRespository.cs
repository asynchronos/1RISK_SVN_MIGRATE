using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public class ByCusCIFRespository : IByCusCIFRespository
    {
        public IQueryable<ByCus_CIF> GetByCusCIFs()
        {
            IQueryable<ByCus_CIF> byCusCIFs;
            using (Bay01_Entities dataContext = new Bay01_Entities())
            {
                byCusCIFs = from b in dataContext.ByCus_CIF
                            select b;
            }

            return byCusCIFs;
        }

        public IQueryable<ByCus_CIF> GetByCusCIFSMEs()
        {
            throw new System.NotImplementedException();
        }

        public IQueryable<CUSTOMER_SME> GetCustomerSMEs()
        {
            IQueryable<CUSTOMER_SME> customerSmes;
            using (Bay01_Entities dataContext = new Bay01_Entities())
            {
                customerSmes = from s in dataContext.CUSTOMER_SME
                               select s;
            }

            return customerSmes;
        }

        public IQueryable<CUSTOMER_SME> GetCustomerSMEs(string empId)
        {
            IQueryable<CUSTOMER_SME> customerSmes;
            using (Bay01_Entities dataContext = new Bay01_Entities())
            {
                customerSmes = from s in dataContext.CUSTOMER_SME
                               where s.CM_CODE == empId
                               select s;
            }

            return customerSmes;
        }

        public IQueryable<Model.CustomerDebtViewModel> GetByCusCIFSMEsProjected(string empId)
        {
            IQueryable<Model.CustomerDebtViewModel> v;

            using (Bay01_Entities dataContext = new Bay01_Entities())
            {
                IQueryable<CUSTOMER_SME> customerSmes;

                if (string.IsNullOrEmpty(empId))
                {
                    //customerSmes = from s in dataContext.CUSTOMER_SME
                    //               select s;
                    customerSmes = GetCustomerSMEs();
                }
                else
                {
                    //customerSmes = from s in dataContext.CUSTOMER_SME
                    //               where s.CM_CODE == empId
                    //               select s;
                    customerSmes = GetCustomerSMEs(empId);
                }

                v = from s in customerSmes
                    select new Model.CustomerDebtViewModel(s.CIF
                        , s.CUSTOMER.CTITLE_E, s.CUSTOMER.CFIRST_E, s.CUSTOMER.CLAST_E
                        , s.CUSTOMER.CUS_TITLE, s.CUSTOMER.CUS_FIRST, s.CUSTOMER.CUS_LAST);
            }
            return v;
        }
    }
}