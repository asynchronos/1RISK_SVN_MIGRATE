using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace LGDCollectionData.Aspx
{
    public partial class FINANCIAL_SUMMARY : System.Web.UI.Page
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
        protected void CheckDate(object sender, GridViewSelectEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


    }
}