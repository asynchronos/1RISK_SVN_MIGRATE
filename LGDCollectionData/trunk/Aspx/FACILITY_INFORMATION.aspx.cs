using System;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class FACILITY_INFORMATION : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected virtual void CIF_TextBox_PreRender(object sender, EventArgs e)
        {
            ((TextBox)sender).Text = getQueryString("CIF");
        }

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {
            //if (getQueryString("CIF") != null)
            //{
            //    if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            //    {
            //        System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //        System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //        if (userId != null)
            //            userId.Text = User.Identity.Name.ToString();
            //        if (dateLabel != null)
            //            dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //    }
            //    if (DetailsView1.CurrentMode == DetailsViewMode.Insert )
            //    {
            //        System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //        System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //        if (userId != null)
            //            userId.Text = User.Identity.Name.ToString();
            //        if (dateLabel != null)
            //            dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //    }
            //}
        }

        protected void BtnLinkToLimitStructure_Click(object sender, EventArgs e)
        {
            Response.Redirect("LIMIT_STRUCTURE.aspx?" + BtnLinkToLimitStructure.ToolTip);
        }

        protected void DetailsView_OnPreRender(object sender, EventArgs e)
        {
            if (((DetailsView)sender).FindControl("Empty_TextBox") != null)
            {
                GridView1.Visible = false;
                BtnLinkToLimitStructure.Visible = false;
                // ((DetailsView)sender).ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                GridView1.Visible = true;
                BtnLinkToLimitStructure.Visible = true;

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
                    GridView1.Visible = false;
                }
            }

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

        protected void SqlDataSourceFacility_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MessageBox.Show(e.AffectedRows.ToString());
            //if (e.AffectedRows.ToString() == "-1")
            //{
            //    //MessageBox.Show("aaa1");
            //    // Perform any additional processing, such as sending an e-mail notification.
            //    //Label1.Text = Request.LogonUserIdentity.Name + " changed user information sucessfully!";

            //    string Message = "Insert Successed";
            //    string sb = "<script language='javascript'>" +
            //                         "popupAlert('" + Message + "');" +
            //                         "</script>";

            //    //MessageBox.Show(sb.ToString());
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            //    Response.Redirect("FACILITY_INFORMATION.aspx?CIF=" + Request.QueryString["CIF"]);

            //}
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void SqlDataSourceFacility_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void SqlDataSourceFacility_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UpdateUser"] = User.Identity.Name;
            e.NewValues["UpdateDate"] = DateTime.Now;
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                SqlDataSourceFacility.FilterExpression = null;
                //DetailsView1.DataBind();
            }
            else
            {
                SqlDataSourceFacility.FilterExpression = "HILIGHT_FLAG = 1";
                //DetailsView1.DataBind();
            }
        }

        protected override void DetailsView_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
        {
            if (DDLValidate.SelectedValue == "-1")
            {
                SqlDataSourceFacility.FilterExpression = null;
                DetailsView1.DataBind();
                GridView1.DataBind();
            }
            else
            {
                SqlDataSourceFacility.FilterExpression = "HILIGHT_FLAG = 1";
                DetailsView1.DataBind();
                GridView1.DataBind();
            }
        }
    }
}