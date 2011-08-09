using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Globalization;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class NPA_RECORD_NEW : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView_OnPreRender(object sender, EventArgs e)
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
        }

        protected void Collateral_Sale_Date_TextBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ITextControl t = (((CustomValidator)source).Parent.FindControl("Default_Date_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("TextBoxDefault_Date_Insert");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Collateral_Sale_Date_TextBox_CalendarExtender"));

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
                args.IsValid = (inputDate.CompareTo(compareDate) == 1) ? true : false;
            }
        }

    }
}