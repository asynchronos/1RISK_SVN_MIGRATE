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
    public partial class ADDITIONAL_DRAWDOWN : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}