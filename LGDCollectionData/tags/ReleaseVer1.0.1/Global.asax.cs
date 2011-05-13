using System;
using log4net;
using System.Web;

namespace LGDCollectionData
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private void Application_Start(object sender, EventArgs e)
        {
            log.Info("============================");
            log.Info("    Starting application");
            log.Info("============================");
        }

        private void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        private void Application_Error(object sender, EventArgs e)
        {
            Exception err = Server.GetLastError();

            if (err.InnerException != null)
            {
                err = err.InnerException;
                HttpContext.Current.Session.Add("LastError",err);
            }

            if (HttpContext.Current.Session != null)
                HttpContext.Current.Session.Add("PageError", HttpContext.Current.Request.Url.ToString());

            if (HttpContext.Current.User != null)
            {
                MDC.Set("user", HttpContext.Current.User.Identity.Name);
            }
            MDC.Set("url", HttpContext.Current.Request.Url.ToString());
            //Insert log by log4net
            log.Error(err.Message, err);

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
                Response.Redirect("~/Aspx/Error/UnAuthorized.aspx");
            }
            else if (err.GetType().Equals(typeof(NotImplementedException)))
            {
                Response.Redirect("~/Aspx/Error/NotImplemented.aspx");
            }
            else
            {
                Response.Redirect("~/Aspx/Error/DefaultError.aspx");
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