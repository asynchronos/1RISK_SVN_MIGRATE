using System;
using System.Configuration;
using System.Diagnostics;
using System.Net;
using System.Web.DynamicData;
using System.Web.Routing;
using log4net;

namespace Classify
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static MetaModel s_defaultModel = new MetaModel();

        public static MetaModel DefaultModel
        {
            get
            {
                return s_defaultModel;
            }
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            //                    IMPORTANT: DATA MODEL REGISTRATION
            // Uncomment this line to register an ADO.NET Entity Framework model for ASP.NET Dynamic Data.
            // Set ScaffoldAllTables = true only if you are sure that you want all tables in the
            // data model to support a scaffold (i.e. templates) view. To control scaffolding for
            // individual tables, create a partial class for the table and apply the
            // [ScaffoldTable(true)] attribute to the partial class.
            // Note: Make sure that you change "YourDataContextType" to the name of the data context
            // class in your application.
            DefaultModel.RegisterContext(typeof(Classify.RISKEntities), new ContextConfiguration() { ScaffoldAllTables = true });

            // The following statement supports separate-page mode, where the List, Detail, Insert, and
            // Update tasks are performed by using separate pages. To enable this mode, uncomment the following
            // route definition, and comment out the route definitions in the combined-page mode section that follows.
            routes.Add(new DynamicDataRoute("{table}/{action}.aspx")
            {
                Constraints = new RouteValueDictionary(new { action = "List|Details|Edit|Insert" }),
                Model = DefaultModel
            });

            // The following statements support combined-page mode, where the List, Detail, Insert, and
            // Update tasks are performed by using the same page. To enable this mode, uncomment the
            // following routes and comment out the route definition in the separate-page mode section above.
            //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
            //    Action = PageAction.List,
            //    ViewName = "ListDetails",
            //    Model = DefaultModel
            //});

            //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
            //    Action = PageAction.Details,
            //    ViewName = "ListDetails",
            //    Model = DefaultModel
            //});
        }

        private void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);

            //load log4net config(start once only)
            //config in web.config
            //log4net.Config.XmlConfigurator.Configure();

            //config from file
            //log4net.Config.XmlConfigurator.ConfigureAndWatch(new System.IO.FileInfo(@"C:\log4netConfig.xml"));

            //load config from url
            WebRequest myWebRequest = WebRequest.Create(ConfigurationManager.AppSettings["LOG4NET_CONFIG"]);
            myWebRequest.Timeout = 5000;

            WebResponse myWebResponse = myWebRequest.GetResponse();
            log4net.Config.XmlConfigurator.Configure(myWebResponse.GetResponseStream());
        }

        private void Application_Error(object sender, EventArgs e)
        {
            Exception err = Server.GetLastError();

            //Creation of event log if it does not exist
            String eventLogName = ConfigurationManager.AppSettings["APPLICATION_NAME"];
            if (!EventLog.SourceExists(eventLogName))
            {
                EventLog.CreateEventSource(eventLogName, eventLogName);
            }

            //Inserting into event log
            EventLog eLog = new EventLog();
            eLog.Source = eventLogName;
            eLog.WriteEntry(err.ToString(), EventLogEntryType.Error);

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
                Response.Redirect("~/aspx/error/unauthorized.aspx?page=" + Server.UrlEncode(Request.RawUrl));
            }
            else
            {
                Response.Redirect("~/aspx/error/defaultError.aspx?page=" + Server.UrlEncode(Request.RawUrl)
                    + "&msg=" + err.InnerException.Message);
            }
        }
    }
}