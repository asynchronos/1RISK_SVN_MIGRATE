using System;
using log4net;
using Microsoft.Reporting.WebForms;

namespace SME.DebtSummary.Report
{
    public partial class SMEDebtDetail : MyReportPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (null != Request.UrlReferrer && null != Request.UrlReferrer.OriginalString)
                {
                    SavePreviousUrl(this.Request.UrlReferrer.OriginalString);
                    ShowAllUrlList();
                }

                RV_Detail.LocalReport.EnableHyperlinks = true;

                RV_Detail.LocalReport.SetParameters(new ReportParameter(RP_KEY_DOMAIN_PATH, Request.Url.OriginalString.Replace(Request.AppRelativeCurrentExecutionFilePath.Substring(1) + Request.Url.Query, "/")));
                if (hasQueryString(QS_KEY_ROOT_EMP_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_ROOT_EMP_ID)) && !getQueryString(QS_KEY_ROOT_EMP_ID).Equals("All"))
                {
                    RV_Detail.LocalReport.SetParameters(new ReportParameter(RP_KEY_ROOT_EMP_ID, getQueryString(QS_KEY_ROOT_EMP_ID)));
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
            RV_Detail.LocalReport.SetParameters(new ReportParameter(RP_KEY_ROOT_EMP_ID, DDL_EmpList.SelectedValue));
            RV_Detail.LocalReport.Refresh();
        }
    }
}