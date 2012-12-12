using System;
using log4net;
using Util.Aspx;

namespace SME.DebtSummary
{
    public partial class _Default : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect(Page.ResolveUrl("~/Report/SMEDebtSummary.aspx?") + QS_KEY_ROOT_EMP_ID + "=" + User.Identity.Name);
        }
    }
}