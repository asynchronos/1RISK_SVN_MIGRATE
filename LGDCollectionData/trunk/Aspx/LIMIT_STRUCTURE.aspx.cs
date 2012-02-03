using System;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class LIMIT_STRUCTURE : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected virtual void Default_Date_Label_PreRender(object sender, EventArgs e)
        {
            ((Label)sender).Text = getQueryString("Default_Date");
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UpdateUser"] = User.Identity.Name;
            e.NewValues["UpdateDate"] = DateTime.Now;
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if ( e.Row.RowType == DataControlRowType.Header ||  e.Row.RowType == DataControlRowType.DataRow) {
            //      e.Row.Cells[0].Style["position"] = "relative";  // edit
            //      e.Row.Cells[2].Style["position"] = "relative"; // cif
            //}
        }

        protected void SqlDataSourceLIMIT_STRUCTURE_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void SqlDataSourceLIMIT_STRUCTURE_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void SqlDataSourceLIMIT_STRUCTURE_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.DataBind();
        }

        protected void LIMIT_STRUCTURE_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gv = (GridView)sender;
            SqlDataSource ds = SqlDataSourceLIMIT_STRUCTURE;

            if (e.CommandName.Equals("EmptyDataTemplateInsert"))
            {
                // Retrieve row
                GridViewRow gvr = gv.Controls[0].Controls[0] as GridViewRow;

                //if (gvr == null) { return; }

                // Retrieve data from controls
                TextBox cifTextbox = (TextBox)gvr.FindControl("CIF_TextBox");
                Label defaultDateLabel = (Label)gvr.FindControl("Default_Date_Label");
                DropDownList appIdDropDownList = (DropDownList)gvr.FindControl("APP_ID_DropDownList");
                DropDownList limitTypADropDownList = (DropDownList)gvr.FindControl("LIMITTYP_A_DropDownList");
                TextBox limitNoTextBox = (TextBox)gvr.FindControl("LIMITNO_TextBox");
                TextBox limitD1TextBox = (TextBox)gvr.FindControl("Limit_D1_TextBox");
                TextBox oneLvUpLimitIDAtD1TextBox = (TextBox)gvr.FindControl("One_Level_Up_Limit_ID_D1_TextBox");
                DropDownList oneLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gvr.FindControl("One_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox oneLvUpLimitAmountAtD1TextBox = (TextBox)gvr.FindControl("One_Level_Up_Limit_Amount_D1_TextBox");
                TextBox twoLvUpLimitIDAtD1TextBox = (TextBox)gvr.FindControl("Two_Level_Up_Limit_ID_D1_TextBox");
                DropDownList twoLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gvr.FindControl("Two_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox twoLvUpLimitAmountAtD1TextBox = (TextBox)gvr.FindControl("Two_Level_Up_Limit_Amount_D1_TextBox");
                TextBox threeLvUpLimitIDAtD1TextBox = (TextBox)gvr.FindControl("Three_Level_Up_Limit_ID_D1_TextBox");
                DropDownList threeLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gvr.FindControl("Three_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox threeLvUpLimitAmountAtD1TextBox = (TextBox)gvr.FindControl("Three_Level_Up_Limit_Amount_D1_TextBox");
                TextBox fourLvUpLimitIDAtD1TextBox = (TextBox)gvr.FindControl("Four_Level_Up_Limit_ID_D1_TextBox");
                DropDownList fourLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gvr.FindControl("Four_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox fourLvUpLimitAmountAtD1TextBox = (TextBox)gvr.FindControl("Four_Level_Up_Limit_Amount_D1_TextBox");

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifTextbox.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["APP_ID"].DefaultValue = appIdDropDownList.SelectedValue;
                ds.InsertParameters["LIMITTYP_A"].DefaultValue = limitTypADropDownList.SelectedValue;
                ds.InsertParameters["LIMITNO"].DefaultValue = limitNoTextBox.Text;
                ds.InsertParameters["Limit_D1"].DefaultValue = limitD1TextBox.Text;

                ds.InsertParameters["One_Level_Up_Limit_ID_D1"].DefaultValue = oneLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["One_Level_Up_Limit_Currency_D1"].DefaultValue = oneLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["One_Level_Up_Limit_Amount_D1"].DefaultValue = oneLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Two_Level_Up_Limit_ID_D1"].DefaultValue = twoLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Two_Level_Up_Limit_Currency_D1"].DefaultValue = twoLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Two_Level_Up_Limit_Amount_D1"].DefaultValue = twoLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Three_Level_Up_Limit_ID_D1"].DefaultValue = threeLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Three_Level_Up_Limit_Currency_D1"].DefaultValue = threeLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Three_Level_Up_Limit_Amount_D1"].DefaultValue = threeLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Four_Level_Up_Limit_ID_D1"].DefaultValue = fourLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Four_Level_Up_Limit_Currency_D1"].DefaultValue = fourLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Four_Level_Up_Limit_Amount_D1"].DefaultValue = fourLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
            else if (e.CommandName.Equals("FooterInsert"))
            {
                // Retrieve data from controls
                TextBox cifTextbox = (TextBox)gv.FooterRow.FindControl("CIF_TextBox");
                Label defaultDateLabel = (Label)gv.FooterRow.FindControl("Default_Date_Label");
                DropDownList appIdDropDownList = (DropDownList)gv.FooterRow.FindControl("APP_ID_DropDownList");
                DropDownList limitTypADropDownList = (DropDownList)gv.FooterRow.FindControl("LIMITTYP_A_DropDownList");
                TextBox limitNoTextBox = (TextBox)gv.FooterRow.FindControl("LIMITNO_TextBox");
                TextBox limitD1TextBox = (TextBox)gv.FooterRow.FindControl("Limit_D1_TextBox");
                TextBox oneLvUpLimitIDAtD1TextBox = (TextBox)gv.FooterRow.FindControl("One_Level_Up_Limit_ID_D1_TextBox");
                DropDownList oneLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gv.FooterRow.FindControl("One_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox oneLvUpLimitAmountAtD1TextBox = (TextBox)gv.FooterRow.FindControl("One_Level_Up_Limit_Amount_D1_TextBox");
                TextBox twoLvUpLimitIDAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Two_Level_Up_Limit_ID_D1_TextBox");
                DropDownList twoLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gv.FooterRow.FindControl("Two_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox twoLvUpLimitAmountAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Two_Level_Up_Limit_Amount_D1_TextBox");
                TextBox threeLvUpLimitIDAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Three_Level_Up_Limit_ID_D1_TextBox");
                DropDownList threeLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gv.FooterRow.FindControl("Three_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox threeLvUpLimitAmountAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Three_Level_Up_Limit_Amount_D1_TextBox");
                TextBox fourLvUpLimitIDAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Four_Level_Up_Limit_ID_D1_TextBox");
                DropDownList fourLvUpLimitCurrencyAtD1DropDownList = (DropDownList)gv.FooterRow.FindControl("Four_Level_Up_Limit_Currency_D1_DropDownList");
                TextBox fourLvUpLimitAmountAtD1TextBox = (TextBox)gv.FooterRow.FindControl("Four_Level_Up_Limit_Amount_D1_TextBox");

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifTextbox.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["APP_ID"].DefaultValue = appIdDropDownList.SelectedValue;
                ds.InsertParameters["LIMITTYP_A"].DefaultValue = limitTypADropDownList.SelectedValue;
                ds.InsertParameters["LIMITNO"].DefaultValue = limitNoTextBox.Text;
                ds.InsertParameters["Limit_D1"].DefaultValue = limitD1TextBox.Text;

                ds.InsertParameters["One_Level_Up_Limit_ID_D1"].DefaultValue = oneLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["One_Level_Up_Limit_Currency_D1"].DefaultValue = oneLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["One_Level_Up_Limit_Amount_D1"].DefaultValue = oneLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Two_Level_Up_Limit_ID_D1"].DefaultValue = twoLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Two_Level_Up_Limit_Currency_D1"].DefaultValue = twoLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Two_Level_Up_Limit_Amount_D1"].DefaultValue = twoLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Three_Level_Up_Limit_ID_D1"].DefaultValue = threeLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Three_Level_Up_Limit_Currency_D1"].DefaultValue = threeLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Three_Level_Up_Limit_Amount_D1"].DefaultValue = threeLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["Four_Level_Up_Limit_ID_D1"].DefaultValue = fourLvUpLimitIDAtD1TextBox.Text;
                ds.InsertParameters["Four_Level_Up_Limit_Currency_D1"].DefaultValue = fourLvUpLimitCurrencyAtD1DropDownList.SelectedValue;
                ds.InsertParameters["Four_Level_Up_Limit_Amount_D1"].DefaultValue = fourLvUpLimitAmountAtD1TextBox.Text;

                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                SqlDataSourceLIMIT_STRUCTURE.FilterExpression = null;
                //CASHFLOW_DetailsView.DataBind();
            }
            else
            {
                SqlDataSourceLIMIT_STRUCTURE.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }
    }
}