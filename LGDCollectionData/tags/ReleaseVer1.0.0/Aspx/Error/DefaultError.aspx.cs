using System;

namespace LGDCollectionData.Aspx.Error
{
    public partial class DefaultError : MyAspxPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Error_Label.Text = "Error : Please contact administrator.<br />"
                + "Page : " + getQueryString("page") + "<br />"
                + "Message : " + getQueryString("msg") + "<br />";
        }
    }
}