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

                log.Debug("---------------Profile---------------");
                log.Debug("UserName:" + Context.Profile.UserName);
                log.Debug("Profile:" + Context.Profile);
                log.Debug("Profile.Context:" + Context.Profile.Context);
                log.Debug("Profile.Details:" + Context.Profile.GetProfileGroup("Details").GetPropertyValue("ProfileViewModel"));
                //log.Debug("MyProfile.Details.EMP_FULLNAME:" + ((MyProfile)Context.Profile).Details.EMP_FULLNAME);
            }

            //Response.Write("Profile<br/>");
            //Response.Write("UserName:" + Context.Profile.UserName);

            Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }
    }
}