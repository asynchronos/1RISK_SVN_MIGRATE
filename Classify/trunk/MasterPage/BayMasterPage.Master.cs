using System;
using System.Web.UI;
using log4net;

namespace Classify.MasterPage
{
    public partial class BayMasterPage : System.Web.UI.MasterPage
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Init(object sender, EventArgs e)
        {
            addHeaderLinkAt(0, "~/control/webMenu/chrometheme/chromestyle2.css");
            addHeaderScriptAt(1, "~/control/webMenu/chromejs/chrome.js");
            addHeaderScriptAt(2, "~/js/common.js");
        }

        protected void addHeaderLinkAt(int index, String href)
        {
            HeadPlaceHolder.Controls.AddAt(index, new LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"));
        }

        protected void addHeaderScriptAt(int index, String src)
        {
            HeadPlaceHolder.Controls.AddAt(index, new LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"));
        }
    }
}