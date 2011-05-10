using System;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class PV_LOSS : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected virtual void CIF_TextBox_PreRender(object sender, EventArgs e)
        {
            ((TextBox)sender).Text = getQueryString("cif");
        }

        protected virtual void DetailsView_PreRender(object sender, EventArgs e)
        {
            if (((DetailsView)sender).FindControl("Empty_TextBox") != null)
            {
                RESTRUCTURE_INFORMATION_GridView.Visible = false;
                ((DetailsView)sender).ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                RESTRUCTURE_INFORMATION_GridView.Visible = true;
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
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["CIF"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("CIF_Label")).Text;
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["Default_Date"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("Default_Date_Label")).Text;
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["Date_of_Restructure"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label")).Text;

                    RESTRUCTURE_INFORMATION_GridView.DataBind();
                }
                else
                {
                    RESTRUCTURE_INFORMATION_GridView.Visible = false;
                }
            }
        }

        protected void CIF_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("CIF_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("CIF_Label")).Text;
            }
        }

        protected void Default_Date_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("Default_Date_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("Default_Date_Label")).Text;
            }
        }

        protected void Date_of_Restructure_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label")).Text;
            }
        }

        protected void RESTRUCTURE_INFORMATION_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gv = (GridView)sender;
            SqlDataSource ds = RESTRUCTURE_INFORMATION_SqlDataSource;

            if (e.CommandName.Equals("EmptyDataTemplateInsert"))
            {
                // Retrieve row
                GridViewRow gvr = gv.Controls[0].Controls[0] as GridViewRow;

                //if (gvr == null) { return; }

                // Retrieve data from controls
                Label cifLabel = (Label)gvr.FindControl("CIF_Label");
                Label defaultDateLabel = (Label)gvr.FindControl("Default_Date_Label");
                Label dateOfRestructureLabel = (Label)gvr.FindControl("Date_of_Restructure_Label");
                TextBox dateOfRepaymentTextBox = (TextBox)gvr.FindControl("Date_of_Repayment_TextBox");
                TextBox discountRateTextBox = (TextBox)gvr.FindControl("Discount_Rate_TextBox");
                TextBox tdrCashFlowTextBox = (TextBox)gvr.FindControl("TDR_Cash_Flow_TextBox");
                TextBox presentValueOfRepaymentTextBox = (TextBox)gvr.FindControl("Present_Value_of_Repayment_TextBox");
                DropDownList cashFlowCurrencyDropDownList = (DropDownList)gvr.FindControl("Cash_Flow_Currency_DropDownList");

                //if (cifLabel == null) { return; }
                //if (dateOfRepaymentTextBox == null) { return; }
                //if (User.Identity == null) { return; }

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifLabel.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["Date_of_Restructure"].DefaultValue = dateOfRestructureLabel.Text;
                ds.InsertParameters["Date_of_Repayment"].DefaultValue = dateOfRepaymentTextBox.Text;
                ds.InsertParameters["Discount_Rate"].DefaultValue = discountRateTextBox.Text;
                ds.InsertParameters["TDR_Cash_Flow"].DefaultValue = tdrCashFlowTextBox.Text;
                ds.InsertParameters["Present_Value_of_Repayment"].DefaultValue = presentValueOfRepaymentTextBox.Text;
                ds.InsertParameters["Cash_Flow_Currency"].DefaultValue = cashFlowCurrencyDropDownList.SelectedValue;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
            else if (e.CommandName.Equals("FooterInsert"))
            {
                // Retrieve data from controls
                Label cifLabel = (Label)gv.FooterRow.FindControl("CIF_Label");
                Label defaultDateLabel = (Label)gv.FooterRow.FindControl("Default_Date_Label");
                Label dateOfRestructureLabel = (Label)gv.FooterRow.FindControl("Date_of_Restructure_Label");
                TextBox dateOfRepaymentTextBox = (TextBox)gv.FooterRow.FindControl("Date_of_Repayment_TextBox");
                TextBox discountRateTextBox = (TextBox)gv.FooterRow.FindControl("Discount_Rate_TextBox");
                TextBox tdrCashFlowTextBox = (TextBox)gv.FooterRow.FindControl("TDR_Cash_Flow_TextBox");
                TextBox presentValueOfRepaymentTextBox = (TextBox)gv.FooterRow.FindControl("Present_Value_of_Repayment_TextBox");
                DropDownList cashFlowCurrencyDropDownList = (DropDownList)gv.FooterRow.FindControl("Cash_Flow_Currency_DropDownList");

                //if (cifLabel == null) { return; }
                //if (dateOfRepaymentTextBox == null) { return; }
                //if (User.Identity == null) { return; }

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifLabel.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["Date_of_Restructure"].DefaultValue = dateOfRestructureLabel.Text;
                ds.InsertParameters["Date_of_Repayment"].DefaultValue = dateOfRepaymentTextBox.Text;
                ds.InsertParameters["Discount_Rate"].DefaultValue = discountRateTextBox.Text;
                ds.InsertParameters["TDR_Cash_Flow"].DefaultValue = tdrCashFlowTextBox.Text;
                ds.InsertParameters["Present_Value_of_Repayment"].DefaultValue = presentValueOfRepaymentTextBox.Text;
                ds.InsertParameters["Cash_Flow_Currency"].DefaultValue = cashFlowCurrencyDropDownList.SelectedValue;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UpdateUser"] = User.Identity.Name;
            e.NewValues["UpdateDate"] = DateTime.Now;
        }
    }
}