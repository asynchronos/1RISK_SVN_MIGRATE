using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using AjaxControlToolkit;

namespace LGDCollectionData.Aspx
{
    public partial class LIMIT_STRUCTURE : MyAspxPage
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

            //if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            //{
            //    System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //    System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //    if (userId != null)
            //        userId.Text = User.Identity.Name.ToString();
            //    if (dateLabel != null)
            //        dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //} 
            //if (DetailsView1.CurrentMode == DetailsViewMode.Insert )
            //{
            //    System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //    System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //    if (userId != null)
            //        userId.Text = User.Identity.Name.ToString();
            //    if (dateLabel != null)
            //        dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //}
        }

        protected void BtnLinktoFacility_Click(object sender, EventArgs e)
        {
            Response.Redirect("FACILITY_INFORMATION.aspx?cif=" + Request.QueryString["cif"]);
        }

        protected void DetailsView_OnPreRender(object sender, EventArgs e)
        {
            if (((DetailsView)sender).FindControl("Empty_TextBox") != null)
            {
                //GridView1.Visible = false;
              //  ((DetailsView)sender).ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                //  GridView1.Visible = true;

                if (((DetailsView)sender).CurrentMode == DetailsViewMode.ReadOnly)
                {
                    ((DetailsView)sender).ChangeMode(DetailsViewMode.Edit);
                }
                else if (((DetailsView)sender).CurrentMode == DetailsViewMode.Edit)
                {
                    //do nothing
                }

                if (((DetailsView)sender).CurrentMode != DetailsViewMode.Insert)
                {
                    //set parameter to grid and bind

                    //SqlDataSourceFacility.SelectParameters["CIF"].DefaultValue = ((Label)DetailsView1.FindControl("CIF_Label")).Text;
                    // SqlDataSourceFacility.SelectParameters["Default_Date"].DefaultValue = ((Label)DetailsView1.FindControl("Default_Date_Label")).Text;
                    //   GridView1.DataBind();
                }
                else
                {
                    // GridView1.Visible = false;
                }
            }

        }

        protected virtual void CIF_TextBox_PreRender(object sender, EventArgs e)
        {
            ((TextBox)sender).Text = getQueryString("CIF");
        }

        protected virtual void DEFAULT_DATE_TextBox_PreRender(object sender, EventArgs e)
        {
            ((TextBox)sender).Text = getQueryString("Default_Date");
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["Update_User"] = User.Identity.Name;
            e.NewValues["Update_Date"] = DateTime.Now;
        }
       
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs  e )
        {
            //if ( e.Row.RowType == DataControlRowType.Header ||  e.Row.RowType == DataControlRowType.DataRow) {
            //      e.Row.Cells[0].Style["position"] = "relative";  // edit
            //      e.Row.Cells[2].Style["position"] = "relative"; // cif
            //}
   
        }

        protected void DetailsView_PageIndexChanged(Object sender, EventArgs e)
        {
            ((System.Web.UI.WebControls.DetailsView)sender).UpdateItem(false);
        }



    }
}