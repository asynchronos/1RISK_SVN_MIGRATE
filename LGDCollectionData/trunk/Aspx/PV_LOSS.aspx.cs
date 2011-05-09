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
                ((DetailsView)sender).ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                if (((DetailsView)sender).CurrentMode == DetailsViewMode.ReadOnly)
                {
                    ((DetailsView)sender).ChangeMode(DetailsViewMode.Edit);
                }
                else if (((DetailsView)sender).CurrentMode == DetailsViewMode.Edit)
                {
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

        protected void CIF_HiddenField_PreRender(object sender, EventArgs e)
        {

        }

        protected void Default_Date_HiddenField_PreRender(object sender, EventArgs e)
        {

        }

        protected void Date_of_Restructure_HiddenField_PreRender(object sender, EventArgs e)
        {

        }

        protected void RESTRUCTURE_INFORMATION_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gv = (GridView)sender;
            SqlDataSource ds = RESTRUCTURE_INFORMATION_SqlDataSource;

            //if (e.CommandName.Equals("EmptyDataTemplateInsert"))
            //{
            //    // Retrieve row
            //    GridViewRow gvr = gv.Controls[0].Controls[1] as GridViewRow;

            //    if (gvr == null) { return; }

            //    // Retrieve controls
            //    TextBox txtCompanyName = gvr.FindControl("txtCompanyName") as TextBox;
            //    TextBox txtPhone = gvr.FindControl("txtPhone") as TextBox;

            //    if (txtCompanyName == null) { return; }
            //    if (txtPhone == null) { return; }

            //    // Set parameters
            //    ds.InsertParameters["CompanyName"].DefaultValue = txtCompanyName.Text;
            //    ds.InsertParameters["Phone"].DefaultValue = txtPhone.Text;

            //    // Perform insert
            //    ds.Insert();
            //}
            //else if (e.CommandName.Equals("FooterInsert"))
            //{
            //    // Retrieve controls
            //    TextBox txtCompanyName = gvSuppliers.FooterRow.FindControl("txtCompanyName") as TextBox;
            //    TextBox txtPhone = gvSuppliers.FooterRow.FindControl("txtPhone") as TextBox;

            //    if (txtCompanyName == null) { return; }
            //    if (txtPhone == null) { return; }

            //    // Set parameters
            //    sdsSuppliers.InsertParameters["CompanyName"].DefaultValue = txtCompanyName.Text;
            //    sdsSuppliers.InsertParameters["Phone"].DefaultValue = txtPhone.Text;

            //    // Perform insert
            //    sdsSuppliers.Insert();
            //}
        }
    }
}