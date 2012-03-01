using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public interface IByCusCIFRespository
    {
        IQueryable<ByCus_CIF> GetByCusCIFs();

        IQueryable<ByCus_CIF> GetByCusCIFSMEs();

        IQueryable<CUSTOMER_SME> GetCustomerSMEs();

        IQueryable<CUSTOMER_SME> GetCustomerSMEs(string empId);

        IQueryable<Model.CustomerDebtViewModel> GetByCusCIFSMEsProjected(string empId);
    }
}