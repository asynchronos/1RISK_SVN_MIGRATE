using System;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class TRANSACTION_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                TRANSACTION_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }

        protected override void DetailsView_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
        {
            if (DDLValidate.SelectedValue == "-1")
            {
                TRANSACTION_INFORMATION_SqlDataSource.FilterExpression = null;
                TRANSACTION_INFORMATION_DetailsView.DataBind();
            }
            else
            {
                TRANSACTION_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                TRANSACTION_INFORMATION_DetailsView.DataBind();
            }
        }
    }
}