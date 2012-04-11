using System;
using System.Web.UI.WebControls;
using log4net;
using Microsoft.Reporting.WebForms;

namespace SME.DebtSummary.Report
{
    public partial class SMEDebtSummary : MyReportPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            RV_SMEDebtSummary.LocalReport.EnableHyperlinks = true;
            if (!IsPostBack)
            {
                //SavePreviousUrl(this.Request.UrlReferrer.OriginalString);
                ShowAllUrlList();

                RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_KEY_DOMAIN_PATH, Request.Url.OriginalString.Replace(Request.AppRelativeCurrentExecutionFilePath.Substring(1) + Request.Url.Query, "/")));
                if (hasQueryString(QS_KEY_ROOT_EMP_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_ROOT_EMP_ID)))
                {
                    RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_KEY_ROOT_EMP_ID, getQueryString(QS_KEY_ROOT_EMP_ID)));
                    DDL_EmpList.AppendDataBoundItems = false;
                }
                else
                {
                    DDL_EmpList.AppendDataBoundItems = true;
                }

                //if (hasQueryString(QS_KEY_MIS_CUSTSIZE_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_MIS_CUSTSIZE_ID)))
                //{
                //    RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_MIS_CUSTSIZE_ID, getQueryString(QS_KEY_MIS_CUSTSIZE_ID)));
                //    DDL_EmpList.AppendDataBoundItems = false;
                //}
                //else
                //{
                //    DDL_EmpList.AppendDataBoundItems = true;
                //}

                //if (hasQueryString(QS_KEY_MIS_STATUS_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_MIS_STATUS_ID)))
                //{
                //    RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_MIS_STATUS_ID, getQueryString(QS_KEY_MIS_STATUS_ID)));
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
            RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_KEY_ROOT_EMP_ID, DDL_EmpList.SelectedValue));
            RV_SMEDebtSummary.LocalReport.Refresh();
        }

        protected void DDL_MisCustSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_KEY_MIS_CUSTSIZE_ID, DDL_MisCustSize.SelectedValue));
            RV_SMEDebtSummary.LocalReport.Refresh();
        }

        protected void DDL_MisStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            RV_SMEDebtSummary.LocalReport.SetParameters(new ReportParameter(RP_KEY_MIS_STATUS_ID, DDL_MisStatus.SelectedValue));
            RV_SMEDebtSummary.LocalReport.Refresh();
        }

        protected void DDL_MisCustSize_DataBound(object sender, EventArgs e)
        {
            if (0.Equals(((DropDownList)sender).Items.Count) || !((DropDownList)sender).Items[0].Text.Equals("All"))
            {
                ((DropDownList)sender).Items.Insert(0, "All");
            }
        }

        //protected void DDL_MisStatus_DataBound(object sender, EventArgs e)
        //{
        //    if (!((DropDownList)sender).Items[0].Text.Equals("All"))
        //    {
        //        ((DropDownList)sender).Items.Insert(0, "All");
        //    }
        //}
    }
}