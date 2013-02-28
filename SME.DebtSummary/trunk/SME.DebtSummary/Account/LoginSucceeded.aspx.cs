using System;
using log4net;
using SME.UserSystem.Core.Profile;

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
                log.Debug("Profile EMP_FULLNAME:" + ((UserProfileBase)Context.Profile).EMP_FULLNAME);
                log.Debug("Profile EMP_FULLNAME:" + Context.Profile.PropertyValues["EMP_FULLNAME"]);
                //log.Debug("Profile LastActivityDate:" + Context.Profile.LastActivityDate.ToString());
                log.Debug("Profile.Context:" + Context.Profile.Context);
                //log.Debug("Profile.Details:" + Context.Profile.GetProfileGroup("Details").GetPropertyValue("ProfileViewModel"));
                //log.Debug("MyProfile.Details.EMP_FULLNAME:" + ((SME.UserSystem.Core.Profile.MyProfile)Context.Profile).Details.EMP_FULLNAME);
            }

            //Response.Write("Profile<br/>");
            //Response.Write("UserName:" + Context.Profile.UserName);

            Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }
    }
}