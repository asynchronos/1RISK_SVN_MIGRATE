using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LGDCollectionData.UserControls
{
    public partial class SelectFormWebUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoTo_Button_Click(object sender, EventArgs e)
        {
            int cif = 0;
            //int.TryParse(CIF_ComboBox.Text, out cif);
            int.TryParse(Session["CIF"].ToString(), out cif);

            if (!cif.Equals(0))
            {
                if (Form_DropDownList.SelectedIndex != 0)
                {
                    Response.Redirect("~/Aspx/" + Form_DropDownList.SelectedValue + "?CIF=" + cif.ToString());
                }
                else
                {
                    //do nothing
                }
            }
        }
    }
}