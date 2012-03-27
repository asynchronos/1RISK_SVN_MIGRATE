using System;
using System.Web;
using log4net;

namespace SME.DebtSummary
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private void Application_Start(object sender, EventArgs e)
        {
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

            if (HttpContext.Current.User != null)
            {
                MDC.Set("user", HttpContext.Current.User.Identity.Name);
            }
            MDC.Set("url", HttpContext.Current.Request.Url.ToString());

            //Insert full stack log by log4net
            log.Error(err.Message, err);

            //manage error to show on web
            if (err.InnerException != null)
            {
                //err = err.InnerException;
            }

            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session.Add("LastError", err);
                HttpContext.Current.Session.Add("PageError", HttpContext.Current.Request.Url.ToString());
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
            if (err.GetType().Equals(typeof(System.Security.SecurityException)))
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
    }
}