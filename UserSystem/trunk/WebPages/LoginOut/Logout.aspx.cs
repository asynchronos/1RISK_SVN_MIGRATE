using System;
using System.Web.Security;
using log4net;

namespace UserSystem.WebPages.LoginOut
{
    public partial class Logout : MyWebPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = string.Empty;
            FormsAuthenticationTicket authTicket = this.getAuthTicket();

            if (null != authTicket)
            {
                username = authTicket.Name;

                FormsAuthentication.SignOut();

                Session.Remove("MM");
                Session.Remove("MS");
                Session.RemoveAll();
                Session.Abandon();
                Context.Request.Cookies.Clear();

                log.Info(username + " logout.");
            }

            Response.Redirect(FormsAuthentication.LoginUrl);
        }
    }
}