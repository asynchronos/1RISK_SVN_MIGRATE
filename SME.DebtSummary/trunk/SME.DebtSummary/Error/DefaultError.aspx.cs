using System;
using Util.Aspx;

namespace SME.DebtSummary.Error
{
    public partial class DefaultError : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string page = string.Empty;
            string msg = string.Empty;

            if (Application["PageError"] != null)
            {
                page = Application["PageError"].ToString();
            }

            if (Application["LastError"] != null)
            {
                msg = ((Exception)Application["LastError"]).Message;
            }

            Error_Label.Text = "Error : Please contact administrator.<br />"
                + "Page : " + page + "<br />"
                + "Message : " + msg + "<br />";
        }
    }
}