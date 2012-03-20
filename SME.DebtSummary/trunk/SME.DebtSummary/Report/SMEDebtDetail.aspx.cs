using System;
using Microsoft.Reporting.WebForms;

namespace SME.DebtSummary.Report
{
    public partial class SMEDebtDetail : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RV_Detail.LocalReport.EnableHyperlinks = true;

                RV_Detail.LocalReport.SetParameters(new ReportParameter("RP_DomainPath", "http://" + Request.Url.Authority + "/"));
                if (hasQueryString("rootempid") && !string.IsNullOrWhiteSpace(getQueryString("rootempid")) && !getQueryString("rootempid").Equals("All"))
                {
                    RV_Detail.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", getQueryString("rootempid")));
                    DDL_EmpList.AppendDataBoundItems = false;
                }
                else
                {
                    DDL_EmpList.AppendDataBoundItems = true;
                }
            }
        }

        protected void DDL_EmpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            RV_Detail.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", DDL_EmpList.SelectedValue));
            RV_Detail.LocalReport.Refresh();
        }
    }
}