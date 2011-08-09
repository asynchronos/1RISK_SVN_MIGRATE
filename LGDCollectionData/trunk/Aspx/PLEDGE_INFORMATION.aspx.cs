using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using log4net;
using AjaxControlToolkit;
using System.Globalization;

namespace LGDCollectionData.Aspx
{

    public partial class PLEDGE_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {

            //TextBox Name = (TextBox)sender.FindControl("nameBox");
            //MessageBox.Show(DetailsView1.Rows.Count.ToString());
            //MessageBox.Show(DetailsView1.Rows.Count.ToString());
            String text = string.Empty;


            //MessageBox.Show(text);

            if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            {
                if (DetailsView1.Rows.Count > 0)
                {
                    HiddenFieldAPPS_ID.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[2].ToString();
                    HiddenFieldPLED_ID.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[3].ToString();
                    HiddenFieldPLED_SEQ.Value = ((DataRowView)DetailsView1.DataItem).Row.ItemArray[4].ToString();
                } //end if

                //System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
                //System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
                //if (userId != null)
                //    userId.Text = User.Identity.Name.ToString();
                //if (dateLabel != null)
                //    dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            }
        }

        protected void DetailsView_Prerender(Object sender, EventArgs e)
        {
            //MessageBox.Show("DetailsView_Prerender:" + HiddenFieldAPPS_ID.Value.ToString());
            DetailsView dv = (DetailsView)sender;
            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
                if (dv.Rows.Count > 0)
                {
                    //if (HiddenFieldPLED_ID.Value == "" || HiddenFieldPLED_SEQ.Value == "" || HiddenFieldAPPS_ID.Value == "")
                    //{

                    //}
                    //else
                    //{
                        //set parameter to grid and bind
                        SqlDataSourceCOLL_INFO.SelectParameters["PLED_ID"].DefaultValue = ((Label)DetailsView1.FindControl("LabelPLED_ID")).Text;
                        SqlDataSourceCOLL_INFO.SelectParameters["PLED_SEQ"].DefaultValue = ((Label)DetailsView1.FindControl("LabelPLED_SEQ")).Text;
                        SqlDataSourceCOLL_INFO.SelectParameters["APPS_ID"].DefaultValue = ((Label)DetailsView1.FindControl("LabelAPPS_ID")).Text;

                        GridView_COLL_INFO.DataBind();
                    //}
                }
                else
                {
                    dv.ChangeMode(DetailsViewMode.Insert);
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name;
                    ((System.Web.UI.WebControls.Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);

                }
            }

            //if (HiddenFieldPLED_ID.Value=="" || HiddenFieldPLED_SEQ.Value=="" ||HiddenFieldAPPS_ID.Value == "")
            //{ 

            //}else {
            //DataSet DS_COLL = GET_COLLATERAL_INFORMATION(HiddenFieldPLED_ID.Value.ToString(),Convert.ToInt32(HiddenFieldPLED_SEQ.Value) , HiddenFieldAPPS_ID.Value.ToString());
            ////Cache("COLLATERAL") = DS_COLL.Tables[0].DefaultView;
            //GridView1.DataSource = DS_COLL.Tables[0];
            //GridView1.DataBind();
            //}
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UpdateUser"] = User.Identity.Name;
            e.NewValues["UpdateDate"] = DateTime.Now;
        }

        protected void SqlDataSourceCOLLATERAL_INFO_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    MessageBox.Show(e.Command.Parameters[1].Value.ToString());
            //    MessageBox.Show("Selecting:" + e.Command.Parameters[0].Value.ToString());
            //}
        }

        public static DataSet GET_COLLATERAL_INFORMATION(string PLED_ID, int PLED_SEQ, string APPS_ID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LGDConnectionString1"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("COLLATERAL_INFORMATION_SELECT", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = 60;
                    command.Parameters.Add(new SqlParameter("@PLED_ID", PLED_ID));
                    command.Parameters.Add(new SqlParameter("@PLED_SEQ", PLED_SEQ));
                    command.Parameters.Add(new SqlParameter("@APPS_ID", APPS_ID));
                    connection.Open();
                    SqlDataAdapter list = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    list.Fill(ds);
                    connection.Close();
                    return ds;
                }
            }

        }

        //protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //    if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // กำหนดให้ fix column
        //        e.Row.Cells[0].Style["position"] = "relative";
        //        e.Row.Cells[1].Style["position"] = "relative";
        //        e.Row.Cells[2].Style["position"] = "relative";

        //    }

        //}

        //protected void ButtonEdit_Click(object sender, EventArgs e)
        //{

        //    System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;
        //    string[] CommandArgument = btn.CommandArgument.Split(',');
        //    string CommandArgument1 = CommandArgument[0];
        //    string CommandArgument2 = CommandArgument[1];
        //    string CommandArgument3 = CommandArgument[2];
        //    string CommandArgument4 = CommandArgument[3];

        //    DataSet DS_COLL2 = GET_COLLATERAL_INFORMATION_EDIT(CommandArgument1, CommandArgument2, Convert.ToInt32(CommandArgument3), CommandArgument4);
        //    if (DS_COLL2.Tables[0].Rows.Count > 0)
        //    {

        //        //DetailsView2.DataSource = DS_COLL2;
        //        //DetailsView2.DataBind();

        //        //DetailsView2.ChangeMode(DetailsViewMode.Edit);
        //    }
        //    else {
        //        //DetailsView2.ChangeMode(DetailsViewMode.Insert );
        //    }


        //    //MessageBox.Show(CommandArgument1);
        //    //MessageBox.Show(CommandArgument2);
        //    //MessageBox.Show(CommandArgument3);
        //    //MessageBox.Show(CommandArgument4);

        //}

        //protected void DetailsView2_Databound(Object sender, EventArgs e)
        //{
        //    String text = string.Empty;
        //    if (DetailsView2.CurrentMode == DetailsViewMode.Edit)
        //    {
        //        System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView2.FindControl("LabelUserId2");
        //        System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView2.FindControl("LabelDate2");
        //        if (userId != null)
        //            userId.Text = User.Identity.Name.ToString();
        //        if (dateLabel != null)
        //            dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
        //    }
        //}

        public static DataSet GET_COLLATERAL_INFORMATION_EDIT(string COLL_ID, string PLED_ID, int PLED_SEQ, string APPS_ID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LGDConnectionString1"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("COLLATERAL_INFORMATION_SELECT_2", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = 60;

                    command.Parameters.Add(new SqlParameter("@COLL_ID", COLL_ID));
                    command.Parameters.Add(new SqlParameter("@PLED_ID", PLED_ID));
                    command.Parameters.Add(new SqlParameter("@PLED_SEQ", PLED_SEQ));
                    command.Parameters.Add(new SqlParameter("@APPS_ID", APPS_ID));
                    connection.Open();
                    SqlDataAdapter list = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    list.Fill(ds);
                    connection.Close();
                    return ds;
                }
            }

        }

        //protected void DetailsView_OnPreRender(object sender, EventArgs e)
        //{
        //    DetailsView dv = (DetailsView)sender;
        //    if (dv.CurrentMode == DetailsViewMode.Edit)
        //    {
        //        //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
        //        if (dv.Rows.Count > 0)
        //        {
        //            dv.ChangeMode(DetailsViewMode.Edit);
        //        }
        //        else
        //        {
        //            dv.ChangeMode(DetailsViewMode.Insert);
        //            ((Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
        //            ((Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
        //            ((Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
        //        }
        //    }
        //}


        protected void LabelCOLL_ID_PreRender(object sender, EventArgs e)
        {
            if (DetailsView1.FindControl("LabelCOLL_ID") != null)
            {
                ((Label)sender).Text = ((Label)DetailsView1.FindControl("LabelCOLL_ID")).Text;
            }
        }

        protected void LabelPLED_ID_PreRender(object sender, EventArgs e)
        {
            if (DetailsView1.FindControl("LabelPLED_ID") != null)
            {
                ((Label)sender).Text = ((Label)DetailsView1.FindControl("LabelPLED_ID")).Text;
            }
        }

        protected void LabelAPPS_ID_PreRender(object sender, EventArgs e)
        {
            if (DetailsView1.FindControl("LabelAPPS_ID") != null)
            {
                ((Label)sender).Text = ((Label)DetailsView1.FindControl("LabelAPPS_ID")).Text;
            }
        }

        protected void LabelPLED_SEQ_PreRender(object sender, EventArgs e)
        {
            if (DetailsView1.FindControl("LabelPLED_SEQ") != null)
            {
                ((Label)sender).Text = ((Label)DetailsView1.FindControl("LabelPLED_SEQ")).Text;
            }
        }


        protected void GridView_COLL_INFO_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gv = (GridView)sender;
            SqlDataSource ds = SqlDataSourceCOLL_INFO;
            if (e.CommandName.Equals("EmptyDataTemplateInsert"))
            {
                // Retrieve row
                GridViewRow gvr = gv.Controls[0].Controls[0] as GridViewRow;

                //if (gvr == null) { return; }

                // Retrieve data from controls
                TextBox TextBoxCOLL_ID = (TextBox)gvr.FindControl("TextBoxCOLL_ID");
                Label LabelPLED_ID = (Label)gvr.FindControl("LabelPLED_ID");
                Label LabelPLED_SEQ = (Label)gvr.FindControl("LabelPLED_SEQ");
                Label LabelAPPS_ID = (Label)gvr.FindControl("LabelAPPS_ID");
                TextBox TextBoxAPPS_DATE = (TextBox)gvr.FindControl("TextBoxAPPS_DATE");
                DropDownList DropDownListCollateral_Type = (DropDownList)gvr.FindControl("DropDownListCollateral_Type");
                DropDownList DropDownListProperty_Type = (DropDownList)gvr.FindControl("DropDownListProperty_Type");
                TextBox TextBoxCollateral_Description = (TextBox)gvr.FindControl("TextBoxCollateral_Description");
                TextBox TextBoxDistrict_of_Property = (TextBox)gvr.FindControl("TextBoxDistrict_of_Property");
                TextBox TextBoxAmphur_of_Property = (TextBox)gvr.FindControl("TextBoxAmphur_of_Property");
                DropDownList DropDownListProvince = (DropDownList)gvr.FindControl("DropDownListProvince");
                TextBox TextBoxLocated_Country_of_Property = (TextBox)gvr.FindControl("TextBoxLocated_Country_of_Property");
                TextBox TextBoxCollateral_Provider = (TextBox)gvr.FindControl("TextBoxCollateral_Provider");
                CheckBox Property_Under_Construction_CheckBox = (CheckBox)gvr.FindControl("Property_Under_Construction_CheckBox");
                TextBox TextBoxLeasehold_Period = (TextBox)gvr.FindControl("TextBoxLeasehold_Period");
                TextBox TextBoxLeasehold_Start_Date = (TextBox)gvr.FindControl("TextBoxLeasehold_Start_Date");

                //string chk = string.Empty;
                //if (Property_Under_Construction_CheckBox.Checked == true)
                //{
                //    chk = "1";
                //}
                //else
                //{
                //    chk = "0";
                //}

                //Boolean chk = false;
                //if (Property_Under_Construction_CheckBox.Checked == true)
                //{
                //    chk = true;
                //}
                //else
                //{
                //    chk = false;
                //}

                // Set parameters
                ds.InsertParameters["COLL_ID"].DefaultValue = TextBoxCOLL_ID.Text;
                ds.InsertParameters["PLED_ID"].DefaultValue = LabelPLED_ID.Text;
                ds.InsertParameters["PLED_SEQ"].DefaultValue = LabelPLED_SEQ.Text;
                ds.InsertParameters["APPS_ID"].DefaultValue = LabelAPPS_ID.Text;
                ds.InsertParameters["APPS_DATE"].DefaultValue = TextBoxAPPS_DATE.Text;
                ds.InsertParameters["Collateral_Type"].DefaultValue = DropDownListCollateral_Type.SelectedValue;
                ds.InsertParameters["Property_Type"].DefaultValue = DropDownListProperty_Type.SelectedValue;
                ds.InsertParameters["Collateral_Description"].DefaultValue = TextBoxCollateral_Description.Text;
                ds.InsertParameters["District_of_Property"].DefaultValue = TextBoxDistrict_of_Property.Text;
                ds.InsertParameters["Amphur_of_Property"].DefaultValue = TextBoxAmphur_of_Property.Text;
                ds.InsertParameters["Province_of_Property"].DefaultValue = DropDownListProvince.SelectedValue;
                ds.InsertParameters["Located_Country_of_Property"].DefaultValue = TextBoxLocated_Country_of_Property.Text;
                ds.InsertParameters["Collateral_Provider"].DefaultValue = TextBoxCollateral_Provider.Text;
                ds.InsertParameters["Property_Under_Construction"].DefaultValue = Property_Under_Construction_CheckBox.Checked == true ? "true" : "false";
                ds.InsertParameters["Leasehold_Period"].DefaultValue = TextBoxLeasehold_Period.Text;
                ds.InsertParameters["Leasehold_Start_Date"].DefaultValue = TextBoxLeasehold_Start_Date.Text;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert

                log.Debug(ds.InsertParameters["Property_Under_Construction"].DefaultValue);
                ds.Insert();
            }
            else if (e.CommandName.Equals("FooterInsert"))
            {
                // Retrieve data from controls
                TextBox LabelCOLL_ID_Footer = (TextBox)gv.FooterRow.FindControl("LabelCOLL_ID_Footer");
                Label LabelPLED_ID_Footer = (Label)gv.FooterRow.FindControl("LabelPLED_ID_Footer");
                Label LabelPLED_SEQ_Footer = (Label)gv.FooterRow.FindControl("LabelPLED_SEQ_Footer");
                Label LabelAPPS_ID_Footer = (Label)gv.FooterRow.FindControl("LabelAPPS_ID_Footer");
                TextBox TextBoxAPPS_DATE_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxAPPS_DATE_Footer");
                DropDownList DropDownListCollateral_Type_Footer = (DropDownList)gv.FooterRow.FindControl("DropDownListCollateral_Type");
                DropDownList DropDownListProperty_Type_Footer = (DropDownList)gv.FooterRow.FindControl("DropDownListProperty_Type");
                TextBox TextBoxCollateral_Description_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxCollateral_Description_Footer");
                TextBox TextBoxDistrict_of_Property_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxDistrict_of_Property_Footer");
                TextBox TextBoxAmphur_of_Property_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxAmphur_of_Property_Footer");
                DropDownList DropDownListProvince_Footer = (DropDownList)gv.FooterRow.FindControl("DropDownListProvince_Footer");
                TextBox TextBoxLocated_Country_of_Property_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxLocated_Country_of_Property_Footer");
                TextBox TextBoxCollateral_Provider_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxCollateral_Provider_Footer");
                CheckBox Property_Under_Construction_CheckBox_Footer = (CheckBox)gv.FooterRow.FindControl("CheckBoxProperty_Under_Construction_Footer");
                TextBox TextBoxLeasehold_Period_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxLeasehold_Period_Footer");
                TextBox TextBoxLeasehold_Start_Date_Footer = (TextBox)gv.FooterRow.FindControl("TextBoxLeasehold_Start_Date_Footer");

                // Set parameters
                //ds.InsertParameters["CIF"].DefaultValue = cifLabel.Text;
                //ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                //ds.InsertParameters["Date_of_Restructure"].DefaultValue = dateOfRestructureLabel.Text;
                //ds.InsertParameters["Date_of_Repayment"].DefaultValue = dateOfRepaymentTextBox.Text;
                //ds.InsertParameters["Discount_Rate"].DefaultValue = discountRateTextBox.Text;
                //ds.InsertParameters["TDR_Cash_Flow"].DefaultValue = tdrCashFlowTextBox.Text;
                //ds.InsertParameters["Present_Value_of_Repayment"].DefaultValue = presentValueOfRepaymentTextBox.Text;
                //ds.InsertParameters["Cash_Flow_Currency"].DefaultValue = cashFlowCurrencyDropDownList.SelectedValue;
                //ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                //ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                //string chk=string.Empty;
                //if (Property_Under_Construction_CheckBox_Footer.Checked == true)
                //{
                //    chk = "1";
                //}
                //else
                //{
                //    chk = "0";
                //}
                ds.InsertParameters["COLL_ID"].DefaultValue = LabelCOLL_ID_Footer.Text;
                ds.InsertParameters["PLED_ID"].DefaultValue = LabelPLED_ID_Footer.Text;
                ds.InsertParameters["PLED_SEQ"].DefaultValue = LabelPLED_SEQ_Footer.Text;
                ds.InsertParameters["APPS_ID"].DefaultValue = LabelAPPS_ID_Footer.Text;
                ds.InsertParameters["APPS_DATE"].DefaultValue = TextBoxAPPS_DATE_Footer.Text;
                ds.InsertParameters["Collateral_Type"].DefaultValue = DropDownListCollateral_Type_Footer.SelectedValue;
                ds.InsertParameters["Property_Type"].DefaultValue = DropDownListProperty_Type_Footer.SelectedValue;
                ds.InsertParameters["Collateral_Description"].DefaultValue = TextBoxCollateral_Description_Footer.Text;
                ds.InsertParameters["District_of_Property"].DefaultValue = TextBoxDistrict_of_Property_Footer.Text;
                ds.InsertParameters["Amphur_of_Property"].DefaultValue = TextBoxAmphur_of_Property_Footer.Text;
                ds.InsertParameters["Province_of_Property"].DefaultValue = DropDownListProvince_Footer.SelectedValue;
                ds.InsertParameters["Located_Country_of_Property"].DefaultValue = TextBoxLocated_Country_of_Property_Footer.Text;
                ds.InsertParameters["Collateral_Provider"].DefaultValue = TextBoxCollateral_Provider_Footer.Text;
                ds.InsertParameters["Property_Under_Construction"].DefaultValue = Property_Under_Construction_CheckBox_Footer.Checked == true ? "true" : "false";
                ds.InsertParameters["Leasehold_Period"].DefaultValue = TextBoxLeasehold_Period_Footer.Text;
                ds.InsertParameters["Leasehold_Start_Date"].DefaultValue = TextBoxLeasehold_Start_Date_Footer.Text;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
        }

        protected void Valuation_Date_D_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //args.IsValid = true;
            ITextControl t = (((CustomValidator)source).Parent.FindControl("Default_Date_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("TextBoxDefault_Date_Insert");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Valuation_Date_D_CalendarExtender"));

            CultureInfo cul = new CultureInfo("en-US");
            DateTime inputDate;// = DateTime.ParseExact(args.Value, cal.Format, cul);
            DateTime compareDate;// = DateTime.ParseExact(t.Text, cal.Format, cul);
            

            if (DateTime.TryParseExact(args.Value, cal.Format, cul, DateTimeStyles.None, out inputDate)
                && DateTime.TryParseExact(t.Text, cal.Format, cul, DateTimeStyles.None, out compareDate))
            {
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
            else
            {
                args.IsValid = true;
            }
        }

        protected void Valuation_Date_D1_TextBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;

            ITextControl t = (((CustomValidator)source).Parent.FindControl("Valuation_Date_D_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Valuation_Date_D_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("Valuation_Date_D_TextBox");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Valuation_Date_D1_TextBox_CalendarExtender"));

            CultureInfo cul = new CultureInfo("en-US");
            DateTime inputDate;// = DateTime.ParseExact(args.Value, cal.Format, cul);
            DateTime compareDate;// = DateTime.ParseExact(t.Text, cal.Format, cul);

            if(DateTime.TryParseExact(args.Value, cal.Format, cul, DateTimeStyles.None, out inputDate)
                && DateTime.TryParseExact(t.Text, cal.Format, cul, DateTimeStyles.None, out compareDate))
            {
                DateTime notAvailableDate = DateTime.ParseExact("1 January 9999", cal.Format, cul);
                if (inputDate.Equals(notAvailableDate) || compareDate.Equals(notAvailableDate))
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = (inputDate.CompareTo(compareDate) <= 0) ? true : false;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}