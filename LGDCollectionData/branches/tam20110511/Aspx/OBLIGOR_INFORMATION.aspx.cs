using System;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class OBLIGOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void OBLIGOR_INFORMATION_DetailsView_PreRender(object sender, EventArgs e)
        {
            //DetailsView dv = (DetailsView)sender;

            //if (dv.CurrentMode == DetailsViewMode.Edit)
            //{
            //    if (dv.FindControl("Data_Inputter_TextBox") != null)
            //    {
            //        if (User.Identity.Name.Equals(String.Empty))
            //        {
            //            throw new Exception("Session Time out:Please login again.");
            //        }
            //        else
            //        {
            //            ((TextBox)dv.FindControl("Data_Inputter_TextBox")).Text = User.Identity.Name;
            //        }
            //    }

            //    if (dv.FindControl("Date_of_Input_TextBox") != null)
            //    {
            //        ((TextBox)dv.FindControl("Date_of_Input_TextBox")).Text = DateTime.Now.ToString("d/M/yyyy");
            //    }
            //}
        }
    }
}