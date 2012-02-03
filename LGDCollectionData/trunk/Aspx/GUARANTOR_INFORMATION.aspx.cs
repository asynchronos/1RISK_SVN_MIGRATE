using System;
using System.Web.UI.WebControls;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class GUARANTOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

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
            if (DetailsView2.CurrentMode == DetailsViewMode.Edit)
            {
                //System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView2.FindControl("LabelUserId");
                //System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView2.FindControl("LabelDate");
                //if (userId != null)
                //    userId.Text = User.Identity.Name.ToString();
                //if (dateLabel != null)
                //    dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            }
        }

        protected void SqlDataSourceGur_Info_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if ((e.Exception == null) && (e.AffectedRows > 0))
            {
                // Place your code here
                //DetailsView2.CurrentMode == DetailsViewMode.Insert;
            }
        }

        protected void DetailsView2_OnPreRender(object sender, EventArgs e)
        {
            DetailsView dv = (DetailsView)sender;
            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
                if (dv.Rows.Count > 0)
                {
                    dv.ChangeMode(DetailsViewMode.Edit);
                }
                else
                {
                    dv.ChangeMode(DetailsViewMode.Insert);
                    ((Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
                    ((Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
                    ((Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
                }
            }
            else if (dv.CurrentMode == DetailsViewMode.Insert)
            {
                dv.ChangeMode(DetailsViewMode.Insert);
                ((Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
                ((Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
                ((Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            }
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                SqlDataSourceGur_Info.FilterExpression = null;
                //CASHFLOW_DetailsView.DataBind();
            }
            else
            {
                SqlDataSourceGur_Info.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }
    }
}