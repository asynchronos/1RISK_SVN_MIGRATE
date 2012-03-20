using System;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace SME.DebtSummary.Report
{
    public partial class SMEDebtSummary : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RV_Summary.LocalReport.EnableHyperlinks = true;

                RV_Summary.LocalReport.SetParameters(new ReportParameter("RP_DomainPath", "http://" + Request.Url.Authority + "/"));
                if (hasQueryString("rootempid") && !string.IsNullOrWhiteSpace(getQueryString("rootempid")))
                {
                    RV_Summary.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", getQueryString("rootempid")));
                    DDL_EmpList.AppendDataBoundItems = false;
                }
                else
                {
                    DDL_EmpList.AppendDataBoundItems = true;
                }

                //if (hasQueryString("miscustsize") && !string.IsNullOrWhiteSpace(getQueryString("miscustsize")))
                //{
                //    RV_Summary.LocalReport.SetParameters(new ReportParameter("RP_MisCustSize", getQueryString("miscustsize")));
                //    DDL_EmpList.AppendDataBoundItems = false;
                //}
                //else
                //{
                //    DDL_EmpList.AppendDataBoundItems = true;
                //}
            }
        }

        protected void DDL_EmpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            RV_Summary.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", DDL_EmpList.SelectedValue));
            RV_Summary.LocalReport.Refresh();
        }

        protected void DDL_MisCustSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            RV_Summary.LocalReport.SetParameters(new ReportParameter("RP_MisCustSizeId", DDL_MisCustSize.SelectedValue));
            RV_Summary.LocalReport.Refresh();
        }

        protected void DDL_MisCustSize_DataBound(object sender, EventArgs e)
        {
            if (!((DropDownList)sender).Items[0].Text.Equals("All"))
            {
                ((DropDownList)sender).Items.Insert(0, "All");
            }
        }
    }
}