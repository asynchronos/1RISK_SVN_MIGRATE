using System;
using System.Web;
using System.Web.Security;
using log4net;

namespace Util.Aspx
{
    public class MyAspxPage : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
               System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected readonly static string QS_KEY_ROOT_EMP_ID = "rootempid";
        protected readonly static string QS_KEY_MIS_CUSTSIZE_ID = "miscustsizeid";
        protected readonly static string QS_KEY_MIS_STATUS_ID = "misstatusid";
        protected readonly static string QS_KEY_CUSTOMER_CLASS = "customerclass";

        protected bool hasQueryString(String name)
        {
            bool result = false;

            if (null != Request.QueryString[name])
            {
                result = true;
            }

            return result;
        }

        protected String getQueryString(String name)
        {
            String result = null;

            if (this.hasQueryString(name))
            {
                result = Request.QueryString[name];
            }

            return result;
        }

        protected FormsAuthenticationTicket getAuthTicket()
        {
            FormsAuthenticationTicket authTicket = null;
            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (null != authCookie)
            {
                try
                {
                    authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                }
                catch (ArgumentException argEx)
                {
                    log.Error(argEx.Message, argEx);
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                }
            }

            return authTicket;
        }

        //protected override void InitializeCulture()
        //{
        //    const string enCulture = "en-US";

        //    UICulture = enCulture;
        //    Culture = enCulture;

        //    base.InitializeCulture();
        //}
    }
}