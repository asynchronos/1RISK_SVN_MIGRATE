using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LGDCollectionData.Aspx
{
    public partial class PLEDGE_INFORMATION : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DetailsView_Databound(Object sender, EventArgs e)
        {
            
            //TextBox Name = (TextBox)sender.FindControl("nameBox");
            //MessageBox.Show(DetailsView1.Rows.Count.ToString());
            //MessageBox.Show(DetailsView1.Rows.Count.ToString());
            String text = string.Empty;
            

            //MessageBox.Show(text);

            if (DetailsView1.CurrentMode == DetailsViewMode.Edit) {
                if (DetailsView1.Rows.Count > 0)
                {
                    HiddenFieldAPPS_ID.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[2].ToString();
                    HiddenFieldPLED_ID.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[3].ToString();
                    HiddenFieldPLED_SEQ.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[4].ToString();
                } //end if

                System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
                System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
                if (userId != null)
                    userId.Text = User.Identity.Name.ToString();
                if (dateLabel != null)
                    dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            }
        }

        protected void DetailsView_Prerender(Object sender, EventArgs e)
        {
            //MessageBox.Show("DetailsView_Prerender:" + HiddenFieldAPPS_ID.Value.ToString());
            DetailsView dv = (DetailsView)sender;
            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
                if (dv.Rows.Count > 0)
                {
                    if (HiddenFieldPLED_ID.Value == "" || HiddenFieldPLED_SEQ.Value == "" || HiddenFieldAPPS_ID.Value == "")
                    {

                    }
                    else
                    {
                        DataSet DS_COLL = GET_COLLATERAL_INFORMATION(HiddenFieldPLED_ID.Value.ToString(), Convert.ToInt32(HiddenFieldPLED_SEQ.Value), HiddenFieldAPPS_ID.Value.ToString());
                        //Cache("COLLATERAL") = DS_COLL.Tables[0].DefaultView;
                        GridView1.DataSource = DS_COLL.Tables[0];
                        GridView1.DataBind();
                    }
                }
                else
                {
                    dv.ChangeMode(DetailsViewMode.Insert);
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
                }
            }

            //if (HiddenFieldPLED_ID.Value=="" || HiddenFieldPLED_SEQ.Value=="" ||HiddenFieldAPPS_ID.Value == "")
            //{ 

            //}else {
            //DataSet DS_COLL = GET_COLLATERAL_INFORMATION(HiddenFieldPLED_ID.Value.ToString(),Convert.ToInt32(HiddenFieldPLED_SEQ.Value) , HiddenFieldAPPS_ID.Value.ToString());
            ////Cache("COLLATERAL") = DS_COLL.Tables[0].DefaultView;
            //GridView1.DataSource = DS_COLL.Tables[0];
            //GridView1.DataBind();
            //}
        }

        protected void DetailsView_PageIndexChanged(Object sender, EventArgs e)
        { 

        }

        protected void SqlDataSourceCOLLATERAL_INFO_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    MessageBox.Show(e.Command.Parameters[1].Value.ToString());
            //    MessageBox.Show("Selecting:" + e.Command.Parameters[0].Value.ToString());
            //}
        }

        public static DataSet GET_COLLATERAL_INFORMATION(string PLED_ID, int PLED_SEQ,string APPS_ID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LGDConnectionString1"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("COLLATERAL_INFORMATION_SELECT", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = 60;
                    command.Parameters.Add(new SqlParameter("@PLED_ID", PLED_ID));
                    command.Parameters.Add(new SqlParameter("@PLED_SEQ", PLED_SEQ));
                    command.Parameters.Add(new SqlParameter("@APPS_ID", APPS_ID));
                    connection.Open();
                    SqlDataAdapter list = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    list.Fill(ds);
                    connection.Close();  
                    return ds;
                } 
            }

        }

        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                // กำหนดให้ fix column
                e.Row.Cells[0].Style["position"] = "relative";
                e.Row.Cells[1].Style["position"] = "relative";
                e.Row.Cells[2].Style["position"] = "relative";
            }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MessageBox.Show(e.AffectedRows.ToString());
            if (e.AffectedRows.ToString() == "-1")
            {
                string Message = "Update Successed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            }
            else
            {
                string Message = "Update Failed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            }
        }

        //protected void DetailsView_OnPreRender(object sender, EventArgs e)
        //{
        //    DetailsView dv = (DetailsView)sender;
        //    if (dv.CurrentMode == DetailsViewMode.Edit)
        //    {
        //        //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
        //        if (dv.Rows.Count > 0)
        //        {
        //            dv.ChangeMode(DetailsViewMode.Edit);
        //        }
        //        else
        //        {
        //            dv.ChangeMode(DetailsViewMode.Insert);
        //            ((Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
        //            ((Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
        //            ((Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
        //        }
        //    }
        //}


    }
}