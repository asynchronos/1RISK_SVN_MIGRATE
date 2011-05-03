using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LGDCollectionData.Aspx
{
    public partial class NPA_RECORD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //MessageBox.Show(Request.QueryString["CIF"]);

            if (Request.QueryString["CIF"] == string.Empty)
            {
                FormView1.DefaultMode = FormViewMode.Insert;
            }
            else
            {
                FormView1.DefaultMode = FormViewMode.Edit;
            }

        }

        protected void FormView_PreRender(object sender, EventArgs e)
        {
            if (((FormView)sender).FindControl("CIF_HiddenField") != null)
            {
                ((FormView)sender).ChangeMode(FormViewMode.Insert);
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void InsertRecord(object sender, SqlDataSourceCommandEventArgs e) {
            //MessageBox.Show(e.Command.Parameters.Count.ToString());
            //String text = string.Empty;
            //foreach (System.Data.Common.DbParameter p in e.Command.Parameters)
            //{
            //    text = text + p.ParameterName + "\n";
            //}
            //MessageBox.Show(text);
        }

        //protected void UpdateCancelButton_Click(object sender, EventArgs e)
        //{
        //    FormView1.DefaultMode = FormViewMode.ReadOnly;
        //}

        //protected void InsertButton_Click(object sender, EventArgs e)
        //{
        //    FormView1.DefaultMode = FormViewMode.Insert;
        //}
    }
}