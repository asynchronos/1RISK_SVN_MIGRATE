using System.Collections.Generic;

namespace SME.DebtSummary.Core.DAL
{
    public interface ICustomerSmeRepository
    {
        List<Model.MISStatusViewModel> GetStatuses();
    }
}