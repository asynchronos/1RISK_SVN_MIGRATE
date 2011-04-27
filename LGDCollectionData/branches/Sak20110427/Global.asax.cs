using System;
using log4net;

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
                Response.Redirect("~/Aspx/Error/UnAuthorized.aspx?page=" + Server.UrlEncode(Request.RawUrl));
            }
            else
            {
                string url = "~/Aspx/Error/DefaultError.aspx?page=" + Server.UrlEncode(Request.RawUrl) + "&msg=";

                if (err.InnerException != null)
                {
                    url = url + err.InnerException.Message;
                }
                else
                {
                    url = url + err.Message;
                }

                Response.Redirect(url);
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