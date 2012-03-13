using System;

namespace SME.DebtSummary
{
    public partial class DebtSummaryByEMPID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DDL_EmpFilterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.Refresh();
        }
    }
}