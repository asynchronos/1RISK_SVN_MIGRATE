using System;
using System.Web.Security;
using log4net;
using Util.Aspx;

namespace SME.DebtSummary.Account
{
    public partial class Logout : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = User.Identity.Name;

            if (null != username)
            {
                FormsAuthentication.SignOut();
                Session.RemoveAll();
                Session.Clear();
                Session.Abandon();
                Context.Request.Cookies.Clear();
            }

            Response.Redirect(FormsAuthentication.LoginUrl);
        }
    }
}