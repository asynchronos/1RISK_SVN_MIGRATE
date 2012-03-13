using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public interface IByCusCIFRespository
    {
        IQueryable<ByCus_CIF> GetByCusCIFs();

        IQueryable<ByCus_CIF> GetByCusCIFSMEs();

        IQueryable<CUSTOMER_SME> GetCustomerSMEs();

        IQueryable<CUSTOMER_SME> GetCustomerSMEs(string rootEmpId);

        IQueryable<Model.CustomerDebtViewModel> GetByCusCIFSMEsProjected(string rootEmpId, string empIdFilter);
    }
}