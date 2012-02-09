using System;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace LGDCollectionData.Aspx
{
    public partial class FINANCIAL_SUMMARY : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["CIF"] == string.Empty)
            //{
            //    FormView1.DefaultMode = FormViewMode.Insert;
            //}
            //else
            //{
            //    FormView1.DefaultMode = FormViewMode.Edit;
            //}
        }

        protected void InsertRecord(object sender, SqlDataSourceCommandEventArgs e)
        {
            MessageBox.Show(e.Command.Parameters.Count.ToString());
            String text = string.Empty;
            foreach (System.Data.Common.DbParameter p in e.Command.Parameters)
            {
                text = text + p.ParameterName + "\n";
            }
            MessageBox.Show(text);
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //MessageBox.Show((e.Command.Parameters["@Default_Date"] != null).ToString());
            //if ((e.Command.Parameters["@Default_Date"] != null) && (e.Command.Parameters["@Default_Date"].Value != null))
            // MessageBox.Show(e.Command.Parameters["@Default_Date"].Value.ToString());
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MessageBox.Show(e.AffectedRows.ToString());
            //if (e.AffectedRows.ToString() == "-1")
            //{
            //    //MessageBox.Show("aaa1");
            //    // Perform any additional processing, such as sending an e-mail notification.
            //    //Label1.Text = Request.LogonUserIdentity.Name + " changed user information sucessfully!";

            //    string Message = "Update Successed";
            //    string sb = "<script language='javascript'>" +
            //                         "popupAlert('" + Message + "');" +
            //                         "</script>";

            //    //MessageBox.Show(sb.ToString());
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);

            //}
            //else
            //{
            //    //Label1.Text = "No data updated!";
            //    string Message = "Update Failed";
            //    string sb = "<script language='javascript'>" +
            //                         "popupAlert('" + Message + "');" +
            //                         "</script>";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            //}
        }

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {
            //if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            //{
            //    System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
            //    System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
            //    //userId.Text = User.Identity.Name.ToString();
            //    //dateLabel.Text = Convert.ToString(DateTime.Now);
            //    if (userId != null)
            //        userId.Text = User.Identity.Name.ToString();
            //    if (dateLabel != null)
            //        dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            //}
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Financial_Summary_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }

        protected override void DetailsView_PageIndexChanging(object sender, System.Web.UI.WebControls.DetailsViewPageEventArgs e)
        {
            if (DDLValidate.SelectedValue == "-1")
            {
                Financial_Summary_SqlDataSource.FilterExpression = null;
                Financial_Summary_DetailsView.DataBind();
            }
            else
            {
                Financial_Summary_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                Financial_Summary_DetailsView.DataBind();
            }
        }
    }
}