using System;

namespace SME.DebtSummary.Error
{
    public partial class DefaultError : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string page = string.Empty;
            string msg = string.Empty;

            if (Session["PageError"] != null)
            {
                page = Session["PageError"].ToString();
            }

            if (Session["LastError"] != null)
            {
                msg = ((Exception)Session["LastError"]).Message;
            }

            Error_Label.Text = "Error : Please contact administrator.<br />"
                + "Page : " + page + "<br />"
                + "Message : " + msg + "<br />";
        }
    }
}