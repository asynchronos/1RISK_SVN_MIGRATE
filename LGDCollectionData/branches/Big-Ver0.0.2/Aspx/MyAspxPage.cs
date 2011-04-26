using System;
using System.Web;
using System.Web.Security;
using log4net;

namespace LGDCollectionData.Aspx
{
    public class MyAspxPage : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
               System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

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
    }
}