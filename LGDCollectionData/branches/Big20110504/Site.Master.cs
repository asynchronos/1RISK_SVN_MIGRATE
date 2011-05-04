using System;
using System.Web.UI;

namespace LGDCollectionData
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddHeaderLinkAt(int index, string href)
        {
            HeadContent.Controls.AddAt(index, new LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"));
        }

        protected void AddHeaderScriptAt(int index, string src)
        {
            HeadContent.Controls.AddAt(index, new LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"));
        }
    }
}