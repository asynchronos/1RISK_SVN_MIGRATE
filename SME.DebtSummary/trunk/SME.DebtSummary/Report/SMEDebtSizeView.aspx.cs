using System;
using log4net;

namespace SME.DebtSummary.Report
{
    public partial class SMEDebtSizeView : MyReportPage
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

                RV_SMEDebtViewBySize.LocalReport.EnableHyperlinks = true;

                //RV_SMEDebtViewBySize.LocalReport.SetParameters(new ReportParameter(RP_KEY_DOMAIN_PATH, Request.Url.OriginalString.Replace(Request.AppRelativeCurrentExecutionFilePath.Substring(1) + Request.Url.Query, "/")));

                if (hasQueryString(QS_KEY_ROOT_EMP_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_ROOT_EMP_ID)))
                {
                    //RV_SMEDebtViewBySize.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", getQueryString("rootempid")));
                    DDL_EmpList.AppendDataBoundItems = false;
                }
                else
                {
                    DDL_EmpList.AppendDataBoundItems = true;
                }
            }

            if (hasQueryString(QS_KEY_MIS_CUSTSIZE_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_MIS_CUSTSIZE_ID)))
            {
                LabelMISCustSize.Text = getQueryString(QS_KEY_MIS_CUSTSIZE_ID);
            }
            else
            {
                LabelMISCustSize.Text = "All";
            }

            if (hasQueryString(QS_KEY_MIS_STATUS_ID) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_MIS_STATUS_ID)))
            {
                LabelMISStatus.Text = getQueryString(QS_KEY_MIS_STATUS_ID);
            }
            else
            {
                LabelMISStatus.Text = "All";
            }

            if (hasQueryString(QS_KEY_CUSTOMER_CLASS) && !string.IsNullOrWhiteSpace(getQueryString(QS_KEY_CUSTOMER_CLASS)))
            {
                LabelCustomerClass.Text = getQueryString(QS_KEY_CUSTOMER_CLASS);
            }
            else
            {
                LabelCustomerClass.Text = "All";
            }
        }

        protected void DDL_EmpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //RV_SMEDebtViewBySize.LocalReport.SetParameters(new ReportParameter("RP_RootEmpId", DDL_EmpList.SelectedValue));
            RV_SMEDebtViewBySize.LocalReport.Refresh();
        }

        protected override void IB_Back_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Back1Page();
        }
    }
}