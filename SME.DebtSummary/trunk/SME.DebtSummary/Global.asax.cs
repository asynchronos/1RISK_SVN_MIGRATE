using System;
using System.Security;
using System.Web;
using System.Web.Security;
using log4net;
using SME.UserSystem.Core.Exceptions;
using Util.Log4net;

namespace SME.DebtSummary
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private void Application_Start(object sender, EventArgs e)
        {
            log4net.GlobalContext.Properties["user"] = new HttpContextUserNameProvider();
            log4net.GlobalContext.Properties["url"] = new HttpContextURLProvider();

            // Code that runs on application startup
            log.Info("============================");
            log.Info("    Starting application");
            log.Info("============================");
            log.Info("IsDebugEnabled : " + isDebugEnabled);
        }

        private void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        private void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception err = Server.GetLastError();

            //if (HttpContext.Current.User != null)
            //{
            //    MDC.Set("user", HttpContext.Current.User.Identity.Name);
            //}
            //MDC.Set("url", HttpContext.Current.Request.Url.ToString());

            //Insert full stack log by log4net
            log.Error(err.Message, err);

            //manage error to show on web
            if (err.InnerException != null)
            {
                err = err.InnerException;
            }

            Exception lastError = err;
            String pageError = HttpContext.Current.Request.Url.ToString()
                                .Substring(0
                                    , HttpContext.Current.Request.Url.ToString().IndexOf("?") < 0
                                        ? HttpContext.Current.Request.Url.ToString().Length
                                        : HttpContext.Current.Request.Url.ToString().IndexOf("?"));

            //Application["LastError"] = err; //store the error for later
            //Application["PageError"] = HttpContext.Current.Request.Url.ToString();
            Server.ClearError(); //clear the error so we can continue onwards

            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session.Add("LastError", lastError);
                HttpContext.Current.Session.Add("PageError", pageError);
            }

            //send mail
            //System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
            //String ErrorMessage = "The error description is as follows : " + ErrorDescription;
            //mail.To = "mail@domail.com";
            //mail.Subject = "Error in the " + EventLogName + "site";
            //mail.Priority = System.Web.Mail.MailPriority.High;
            //mail.BodyFormat = System.Web.Mail.MailFormat.Text;
            //mail.Body = ErrorMessage;
            //System.Web.Mail.SmtpMail.Send(mail);

            //redirect to error page
            if (err.GetType().Equals(typeof(LDAPInfoException))
                || err.GetType().Equals(typeof(UserInfoException))
                || err.GetType().Equals(typeof(AsynchronosProviderException)))
            {
                Response.Redirect(FormsAuthentication.LoginUrl
                              + "?pages=" + pageError.ToString()
                              + "&msg=" + ((Exception)lastError).Message.ToString().Replace("&#13;", "<br/>").TrimStart().TrimEnd());
            }
            else if (err.GetType().Equals(typeof(SecurityException)))
            {
                Response.Redirect("~/Error/UnAuthorized.aspx");
            }
            else if (err.GetType().Equals(typeof(NotImplementedException)))
            {
                Response.Redirect("~/Error/NotImplemented.aspx");
            }
            else
            {
                Response.Redirect("~/Error/DefaultError.aspx");
            }
        }

        private void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        private void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.
        }

        private void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            //string cookieName = FormsAuthentication.FormsCookieName;
            //HttpCookie authCookie = Context.Request.Cookies[cookieName];

            //if (null == authCookie)
            //{
            //    //There is no authentication cookie.
            //    //throw new Exception("There is no authentication cookie.");
            //    //log.Error("There is no authentication cookie.");
            //    return;
            //}
            //FormsAuthenticationTicket authTicket = null;
            //try
            //{
            //    authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            //}
            //catch (Exception ex)
            //{
            //    //Write the exception to the Event Log.
            //    log.Error(ex.Message);
            //    return;
            //}
            //if (null == authTicket)
            //{
            //    //Cookie failed to decrypt.
            //    log.Error("Cookie failed to decrypt.");
            //    return;
            //}
            ////When the ticket was created, the UserData property was assigned a
            ////pipe-delimited string of group names.
            //string[] groups = authTicket.UserData.Split(new char[] { '|' });
            ////Create an Identity.
            //GenericIdentity id = new GenericIdentity(authTicket.Name, "LdapAuthentication");
            ////This principal flows throughout the request.
            //GenericPrincipal principal = new GenericPrincipal(id, groups);
            //Context.User = principal;
        }
    }
}