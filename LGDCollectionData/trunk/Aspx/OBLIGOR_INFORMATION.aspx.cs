using System;
using log4net;
using AjaxControlToolkit;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class OBLIGOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ComboBox cb = (ComboBox)OBLIGOR_INFORMATION_DetailsView.FindControl("Nature_of_Emergence_ComboBox");
            
            //if (cb != null)
            //{
            //    cb.SelectedIndexChanged += new EventHandler(Nature_of_Emergence_ComboBox_SelectedIndexChanged);
            //}
            
        }

        protected void Nature_of_Emergence_ComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((ComboBox)sender).SelectedIndex == 1)
            {
                ((TextBox)((ComboBox)sender).Parent.FindControl("Emergence_Date_TextBox")).Text = ((TextBox)((ComboBox)sender).Parent.FindControl("Upgrade_Date_TextBox")).Text;
            }
            else
            {
                ((TextBox)((ComboBox)sender).Parent.FindControl("Emergence_Date_TextBox")).Text = String.Empty;
            }
        }

    }
}