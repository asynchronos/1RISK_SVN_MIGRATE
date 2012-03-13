using System.Collections.Generic;

namespace SME.DebtSummary.Core.DAL
{
    interface IEmployeeTreeRepository
    {
        List<SME.DebtSummary.Core.GetEmployeeTree_Result> GetEmployeeTree();

        List<SME.DebtSummary.Core.GetEmployeeTree_Result> GetEmployeeTree(string rootEmpId);
    }
}