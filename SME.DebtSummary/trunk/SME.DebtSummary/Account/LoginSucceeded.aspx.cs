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
                log.Debug("Profile.Context:" + Context.Profile.Context);
            }

            Response.Write("Authenticate Finish.");
            Response.Write("<br/>");
            Response.Write(User.Identity.Name + " login.");
            Response.Write("<br/>");
            Response.Write("Iden:" + User.Identity.Name);
            Response.Write("<br/>");
            Response.Write("AuthenticationType:" + User.Identity.AuthenticationType);
            Response.Write("<br/>");
            Response.Write("IsAuthenticated:" + User.Identity.IsAuthenticated);
            Response.Write("<br/>");
            Response.Write("IsInRole(admin):" + User.IsInRole("admin"));
            Response.Write("<br/>");
            Response.Write("IsInRole(1100):" + User.IsInRole("1100"));
            Response.Write("<br/>");
            Response.Write("IsInRole(1165):" + User.IsInRole("1165"));
            Response.Write("<br/>");

            Response.Write("----- Profile Section -----");
            Response.Write("<br/>");
            Response.Write("Profile EMP_FULLNAME:" + ((UserProfileBase)Context.Profile).EMP_FULLNAME);
            Response.Write("<br/>");

            //Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }
    }
}