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

        protected void BtnLinkToLimitStructure_Click(object sender, EventArgs e)
        {
            Response.Redirect("LIMIT_STRUCTURE.aspx?" + BtnLinkToLimitStructure.ToolTip);
        }

        protected void DetailsView_OnPreRender(object sender, EventArgs e)
        {
            DetailsView dv = (DetailsView)sender;
            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
                if (dv.Rows.Count > 0)
                {
                    BtnLinkToLimitStructure.ToolTip = "CIF=" + Request.QueryString["CIF"] + "&Default_Date=" + ((Label)dv.FindControl("LabelDefaultDate")).Text;
                }
            }
        }

    }
}