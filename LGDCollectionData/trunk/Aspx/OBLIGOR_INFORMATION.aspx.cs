using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class OBLIGOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ComboBox cb = (ComboBox)OBLIGOR_INFORMATION_DetailsView.FindControl("Nature_of_Emergence_ComboBox");

            //if (cb != null)
            //{
            //    cb.SelectedIndexChanged += new EventHandler(Nature_of_Emergence_ComboBox_SelectedIndexChanged);
            //}
            if (Page.IsPostBack)
            {
                if (DDLValidate.SelectedValue == "-1")
                {
                    OBLIGOR_INFORMATION_SqlDataSource.FilterExpression = null;
                    OBLIGOR_INFORMATION_DetailsView.DataBind();
                }
                else
                {
                    OBLIGOR_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                    OBLIGOR_INFORMATION_DetailsView.DataBind();
                }
            }
        }

        protected void Nature_of_Emergence_ComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((ComboBox)sender).SelectedIndex == 1)
            {
                ((TextBox)((ComboBox)sender).Parent.FindControl("Emergence_Date_TextBox")).Text = ((TextBox)((ComboBox)sender).Parent.FindControl("Upgrade_Date_TextBox")).Text;
            }
            else
            {
                ((TextBox)((ComboBox)sender).Parent.FindControl("Emergence_Date_TextBox")).Text = String.Empty;
            }
        }

        protected void Last_Review_Date_TextBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ITextControl t = (((CustomValidator)source).Parent.FindControl("Default_Date_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_TextBox");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Last_Review_Date_TextBox_CalendarExtender"));

            CultureInfo cul = new CultureInfo("en-US");
            DateTime inputDate = DateTime.ParseExact(args.Value, cal.Format, cul);
            DateTime compareDate = DateTime.ParseExact(t.Text, cal.Format, cul);

            DateTime notAvailableDate = DateTime.ParseExact("1 January 9999", cal.Format, cul);
            if (inputDate.Equals(notAvailableDate) || compareDate.Equals(notAvailableDate))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = (inputDate.CompareTo(compareDate) == -1) ? true : false;
            }
        }

        protected void Rating_Date_TextBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ITextControl t = (((CustomValidator)source).Parent.FindControl("Default_Date_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_TextBox");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Rating_Date_TextBox_CalendarExtender"));

            CultureInfo cul = new CultureInfo("en-US");
            DateTime inputDate = DateTime.ParseExact(args.Value, cal.Format, cul);
            DateTime compareDate = DateTime.ParseExact(t.Text, cal.Format, cul);

            DateTime notAvailableDate = DateTime.ParseExact("1 January 9999", cal.Format, cul);
            if (inputDate.Equals(notAvailableDate) || compareDate.Equals(notAvailableDate))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = (inputDate.CompareTo(compareDate) == -1) ? true : false;
            }
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                OBLIGOR_INFORMATION_SqlDataSource.FilterExpression = null;
                //CASHFLOW_DetailsView.DataBind();
            }
            else
            {
                OBLIGOR_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }
    }
}