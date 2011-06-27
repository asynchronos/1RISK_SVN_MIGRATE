using System;

namespace UserSystem.WebPages.Error
{
    public partial class DefaultError : MyWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Error_Label.Text = "Error : Please contact administrator.<br />"
                + "Page : " + getQueryString("page") + "<br />"
                + "Message : " + getQueryString("msg") + "<br />";
        }
    }
}