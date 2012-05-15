using System;
using log4net;

namespace SME.DebtSummary.Account
{
    public partial class LoginSucceeded : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (isDebugEnabled)
            {
                log.Debug("Authenticate Finish.");
                log.Debug(User.Identity.Name + " login.");
                log.Debug("Iden:" + User.Identity.Name);
                log.Debug("AuthenticationType:" + User.Identity.AuthenticationType);
                log.Debug("IsAuthenticated:" + User.Identity.IsAuthenticated);
                log.Debug("IsInRole(admin):" + User.IsInRole("admin"));
            }

            //Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }
    }
}