using System.Linq;

namespace SME.DebtSummary.Core.DAL
{
    public interface ICustomerSmeRepository
    {
        IQueryable<Model.MISStatusViewModel> GetStatuses();
    }
}