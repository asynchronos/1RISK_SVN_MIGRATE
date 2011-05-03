using System;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class CASHFLOW : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CASHFLOW_DetailsView_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
        {
            ((System.Web.UI.WebControls.DetailsView)sender).UpdateItem(false);
        }

        protected void CASHFLOW_DetailsView_ItemUpdating(object sender, System.Web.UI.WebControls.DetailsViewUpdateEventArgs e)
        {
            bool hasChanged = false;
            for (int i = 0; i < e.OldValues.Count; i++)
            {
                if (e.OldValues[i] == null && e.NewValues[i] == null)
                {
                    if (isDebugEnabled)
                    {
                        log.Debug(i + ":both null");
                    }
                    //do nothing
                }
                else if (e.OldValues[i] != null && e.NewValues[i] != null)
                {
                    if (isDebugEnabled)
                    {
                        log.Debug(i + ":both not null");
                    }

                    if (!e.OldValues[i].Equals(e.NewValues[i]))
                    {
                        hasChanged = true;
                        break;
                    }
                }
                else //null one value
                {
                    if (isDebugEnabled)
                    {
                        log.Debug(i + ":null one");
                    }

                    hasChanged = true;
                    break;
                }
            }

            if (isDebugEnabled)
            {
                log.Debug("hasChanged:" + hasChanged.ToString());
            }

            if (!hasChanged)
            {
                e.Cancel = true;
            }
        }
    }
}