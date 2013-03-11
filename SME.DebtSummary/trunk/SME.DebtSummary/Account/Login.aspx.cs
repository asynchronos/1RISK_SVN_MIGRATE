using System;
using log4net;

namespace SME.DebtSummary.Account
{
    public partial class Login : Util.Aspx.MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void Label_Error_PreRender(object sender, EventArgs e)
        {
            if (hasQueryString("msg"))
            {
                Label_Error.Text = Label_Error.Text + "Message : "
                    + getQueryString("msg") + "<br/>";
            }

            if (hasQueryString("pages"))
            {
                Label_Error.Text = Label_Error.Text + "Page : "
                    + getQueryString("pages") + "<br/>";
            }

            if (hasQueryString("ReturnUrl"))
            {
                Label_Error.Text = LoginUser.FailureText
                    + "<br/>" + "Your account not have permission to use this section."
                    + "<br/>" + "Please login with eligible account."
                    + "<br/>";
            }
        }
    }
}