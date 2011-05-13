using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class NPA_RECORD_NEW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MessageBox.Show(e.AffectedRows.ToString());
            if (e.AffectedRows.ToString() == "-1")
            {
                //MessageBox.Show("aaa1");
                // Perform any additional processing, such as sending an e-mail notification.
                //Label1.Text = Request.LogonUserIdentity.Name + " changed user information sucessfully!";

                string Message = "Update Successed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";

                //MessageBox.Show(sb.ToString());
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);

            }
            else
            {
                //Label1.Text = "No data updated!";
                string Message = "Update Failed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            }
        }

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {

            if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            {
                System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
                System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
                if (userId != null)
                    userId.Text = User.Identity.Name.ToString();
                if (dateLabel != null)
                    dateLabel.Text = Convert.ToString(DateTime.Now);
            }
        }


    }
}