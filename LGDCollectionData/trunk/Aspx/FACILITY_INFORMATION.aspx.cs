using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class FACILITY_INFORMATION : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DetailsView_Databound(Object sender, EventArgs e)
        {
            if (getQueryString("CIF") != null)
            {
                if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
                    System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
                    if (userId != null) { 
                         userId.Text = User.Identity.Name.ToString();
                         dateLabel.Text = Convert.ToString(DateTime.Now);
                    }
                
                }
            }

        }
    }
}