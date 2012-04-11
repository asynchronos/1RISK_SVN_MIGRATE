using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using log4net;

namespace SME.DebtSummary.Report
{
    public class MyReportPage : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
               System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected readonly static string RP_KEY_DOMAIN_PATH = "RP_DomainPath";
        protected readonly static string RP_KEY_ROOT_EMP_ID = "RP_RootEmpId";
        protected readonly static string RP_KEY_MIS_CUSTSIZE_ID = "RP_MisCustSizeId";
        protected readonly static string RP_KEY_MIS_STATUS_ID = "RP_MisStatusId";

        protected readonly static string S_KEY_NAVIGATOR_URL = "NAVIGATOR_URL";

        private List<string> urlList;

        protected int? CountUrlList()
        {
            if (null != Session[S_KEY_NAVIGATOR_URL])
            {
                urlList = (List<string>)Session[S_KEY_NAVIGATOR_URL];
                return this.urlList.Count;
            }

            return null;
        }

        protected void SavePreviousUrl(string url)
        {
            if (null != Session[S_KEY_NAVIGATOR_URL])
            {
                urlList = (List<string>)Session[S_KEY_NAVIGATOR_URL];
            }
            else
            {
                urlList = new List<string>();
            }

            urlList.Add(url);
            Session[S_KEY_NAVIGATOR_URL] = urlList;

            log.Debug("save " + url);
        }

        protected void Back1Page()
        {
            if (null != Session[S_KEY_NAVIGATOR_URL])
            {
                urlList = (List<string>)Session[S_KEY_NAVIGATOR_URL];
            }

            if (urlList.Count > 0)
            {
                string url2go = urlList[urlList.Count - 1];
                urlList.Remove(url2go);
                log.Debug("remove " + url2go);

                if (urlList.Count > 0)
                {
                    Session[S_KEY_NAVIGATOR_URL] = urlList;
                }
                else
                {
                    Session.Remove(S_KEY_NAVIGATOR_URL);
                }

                log.Debug("redirecting to " + url2go);
                Response.Redirect(url2go);
            }
        }

        protected void ShowAllUrlList()
        {
            if (null != Session[S_KEY_NAVIGATOR_URL])
            {
                urlList = (List<string>)Session[S_KEY_NAVIGATOR_URL];

                log.Debug("NAVIGATOR_URL has " + urlList.Count + " items.");

                foreach (string url in urlList)
                {
                    log.Debug("URL :" + url);
                }
            }
            else
            {
                log.Debug("NAVIGATOR_URL is empty.");
            }
        }

        #region event

        protected virtual void IB_Back_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Back1Page();
        }

        protected virtual void IB_Back_Prerender(object sender, EventArgs e)
        {
            if (null != Session[S_KEY_NAVIGATOR_URL])
            {
                urlList = (List<string>)Session[S_KEY_NAVIGATOR_URL];
            }

            if (null != urlList && urlList.Count > 0)
            {
                ((ImageButton)sender).Visible = true;
            }
            else
            {
                ((ImageButton)sender).Visible = false;
            }
        }

        #endregion event
    }
}