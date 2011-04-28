using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LGDCollectionData.Aspx
{
    public partial class SELECT_FORM : MyAspxPage 
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonOpenForm_Click(object sender, EventArgs e)
        {  
            if (TextBoxCIF.Text != null)
            {
                Response.Redirect(DropDownListFormName.SelectedValue + "?CIF=" + TextBoxCIF.Text);
            }
        }
    }
}