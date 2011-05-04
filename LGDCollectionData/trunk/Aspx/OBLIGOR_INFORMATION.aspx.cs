using System;
using System.Web.UI.WebControls;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class OBLIGOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void OBLIGOR_INFORMATION_DetailsView_PreRender(object sender, EventArgs e)
        {
            DetailsView dv = (DetailsView)sender;

            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                if (dv.FindControl("Data_Inputter_TextBox") != null)
                {
                    if (User.Identity.Name.Equals(String.Empty))
                    {
                        //throw new Exception("Session Time out:Please login again.");
                        ((TextBox)dv.FindControl("Data_Inputter_TextBox")).Text = User.Identity.Name;
                    }
                    else
                    {
                        ((TextBox)dv.FindControl("Data_Inputter_TextBox")).Text = User.Identity.Name;
                    }
                }

                if (dv.FindControl("Date_of_Input_TextBox") != null)
                {
                    ((TextBox)dv.FindControl("Date_of_Input_TextBox")).Text = "Today";
                }
            }
        }

        protected override void DetailsView_ItemUpdating(object sender, System.Web.UI.WebControls.DetailsViewUpdateEventArgs e)
        {
            if (!User.Identity.Name.Equals(String.Empty))
            {
                e.NewValues["Data_Inputter"] = User.Identity.Name;
                e.NewValues["Date_of_Input"] = DateTime.Now;
            }
            else
            {
                //throw new Exception("Session Time out:Please login again.");
                e.NewValues["Data_Inputter"] = User.Identity.Name;
                e.NewValues["Date_of_Input"] = DateTime.Now;
            }
        }
    }
}