using System;

namespace SME.DebtSummary
{
    public partial class DebtSummaryByEMPID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.LocalReport.EnableHyperlinks = true;

                //ReportViewer1.LocalReport.SetParameters(new ReportParameter("RP_DomainPath", "http://" + Request.Url.Authority + "/"));
                //ReportViewer1.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", Request.QueryString.Get("rootempid")));
            }
        }

        protected void DDL_EmpFilterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ReportViewer1.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", DDL_EmpFilterList.SelectedValue));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}