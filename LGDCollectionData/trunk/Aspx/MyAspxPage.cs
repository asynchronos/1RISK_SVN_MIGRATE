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

        protected override void InitializeCulture()
        {
            const string enCulture = "en-US";

            UICulture = enCulture;
            Culture = enCulture;

            base.InitializeCulture();
        }

        protected virtual void DetailsView_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
        {
            //((System.Web.UI.WebControls.DetailsView)sender).UpdateItem(false);
        }

        protected virtual void DetailsView_ItemUpdating(object sender, System.Web.UI.WebControls.DetailsViewUpdateEventArgs e)
        {
            //bool hasChanged = false;
            //for (int i = 0; i < e.OldValues.Count; i++)
            //{
            //    if (isDebugEnabled)
            //    {
            //        log.Debug(e.OldValues[i] + ":" + e.NewValues[i]);
            //    }

            //    if (e.OldValues[i] == null && e.NewValues[i] == null)
            //    {
            //        if (isDebugEnabled)
            //        {
            //            log.Debug("Parameter[" + i + "]:both null");
            //        }
            //        //do nothing
            //    }
            //    else if (e.OldValues[i] != null && e.NewValues[i] != null)
            //    {
            //        if (isDebugEnabled)
            //        {
            //            log.Debug("Parameter[" + i + "]:both not null");
            //        }

            //        if (!e.OldValues[i].Equals(e.NewValues[i]))
            //        {
            //            log.Debug("   OldValues:" + e.OldValues[i].ToString());
            //            log.Debug("   NewValues:" + e.NewValues[i].ToString());
            //            hasChanged = true;
            //            break;
            //        }
            //    }
            //    else //null one value
            //    {
            //        if (isDebugEnabled)
            //        {
            //            log.Debug("Parameter[" + i + "]:null one");
            //        }

            //        hasChanged = true;
            //        break;
            //    }
            //}

            //if (isDebugEnabled)
            //{
            //    log.Debug("hasChanged:" + hasChanged.ToString());
            //}

            //if (!hasChanged)
            //{
            //    e.Cancel = true;
            //}
            //else
            //{
                e.NewValues["UpdateUser"] = User.Identity.Name;
                e.NewValues["UpdateDate"] = DateTime.Now;
            //}
        }

        protected virtual void DetailsView_ItemUpdated(object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
        {
            string msg = string.Empty;
            // Use the Exception property to determine whether
            // an exception occurred during the update operation.
            if (e.Exception == null)
            {
                msg = "Record updated successfully.";
                // Use the AffectedRows property to determine whether the record was updated.
                // Sometimes an error might occur but does not raise an exception,
                // yet prevents the update operation from completing.
                if (e.AffectedRows == 1)
                {
                    //msg = "Record updated successfully.";
                }
                else
                {
                    //msg = "An error occurred during the update operation.";
                    // Use the KeepInEditMode property to remain in edit mode
                    // when an error occurs during the update operation.
                    //e.KeepInEditMode = true;
                }
            }
            else
            {
                // Update the code to handle the exception.
                msg = e.Exception.Message;

                // Use the ExceptionHandled property to indicate
                // that the exception has already been handled.
                e.ExceptionHandled = true;
            }

            ClientScript.RegisterStartupScript(this.GetType(), "updatedInformation",    "<script language='javascript'>" +
                                                                                            "alert('" + msg + "');" +
                                                                                        "</script>", false);
        }
    }
}