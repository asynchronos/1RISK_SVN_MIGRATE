using System;

namespace LGDCollectionData.Aspx
{
    public partial class ADDITIONAL_DRAWDOWN : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (DDLValidate.SelectedValue == "-1")
                {
                    SqlDataSource1.FilterExpression = null;
                    DetailsView1.DataBind();
                }
                else
                {
                    SqlDataSource1.FilterExpression = "HILIGHT_FLAG = 1";
                    DetailsView1.DataBind();
                }
            }
        }

        //protected void updateRecord(object sender, SqlDataSourceCommandEventArgs e)
        //{
        //    MessageBox.Show(e.Command.Parameters.Count.ToString());
        //    String text = string.Empty;
        //    foreach (System.Data.Common.DbParameter p in e.Command.Parameters)
        //    {
        //        text = text + p.ParameterName + "\n";
        //    }
        //    MessageBox.Show(text);
        //}

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {
            //if (getQueryString("CIF")  != null ) {
            //    if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            //    {
            //        System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //        System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //        if (userId != null) {
            //             userId.Text = User.Identity.Name.ToString();
            //             dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //        }
            //    }
            //}
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                SqlDataSource1.FilterExpression = null;
                //DetailsView1.DataBind();
            }
            else
            {
                SqlDataSource1.FilterExpression = "HILIGHT_FLAG = 1";
                //DetailsView1.DataBind();
            }
        }
    }
}