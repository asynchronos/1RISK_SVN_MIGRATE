using System;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using log4net;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;

namespace LGDCollectionData.Aspx
{
    public partial class PV_LOSS : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static readonly string cellMap = "ABCDEFG";

        protected void Page_Load(object sender, EventArgs e)
        {
            //RESTRUCTURE_INFORMATION_FileUpload.UploaderStyle = AjaxControlToolkit.AsyncFileUpload.UploaderStyleEnum.Modern;
            //RESTRUCTURE_INFORMATION_FileUpload.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(RESTRUCTURE_INFORMATION_FileUpload_UploadedComplete);
            //RESTRUCTURE_INFORMATION_FileUpload.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(RESTRUCTURE_INFORMATION_FileUpload_UploadedFileError);
            if (Page.IsPostBack)
            {
                if (DDLValidate.SelectedValue == "-1")
                {
                    PV_LOSS_SqlDataSource.FilterExpression = null;
                    PV_LOSS_DetailsView.DataBind();
                }
                else
                {
                    PV_LOSS_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                    PV_LOSS_DetailsView.DataBind();
                }

                if (DDLValidate2.SelectedValue == "-1")
                {
                    RESTRUCTURE_INFORMATION_SqlDataSource.FilterExpression = null;
                    RESTRUCTURE_INFORMATION_GridView.DataBind();
                }
                else
                {
                    RESTRUCTURE_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                    RESTRUCTURE_INFORMATION_GridView.DataBind();
                }
            }
        }

        protected object GetCellValue()
        {
            return null;
        }

        protected void RESTRUCTURE_INFORMATION_FileUpload_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Uploaded size: " + RESTRUCTURE_INFORMATION_FileUpload.FileBytes.Length.ToString() + "';", true);

            string cif = null;
            DateTime? defaultDate = null;
            DateTime? dateOfRestructure = null;

            HSSFWorkbook wb = null;
            HSSFSheet sh = null;

            Row r = null;
            Cell c = null;

            Entities.LGDEntities en = null;
            Entities.RESTRUCTURE_INFORMATION ri = null;

            try
            {
                if (RESTRUCTURE_INFORMATION_FileUpload.FileContent != null)
                {
                    en = new Entities.LGDEntities();
                    wb = new HSSFWorkbook(RESTRUCTURE_INFORMATION_FileUpload.FileContent, true);

                    for (var i = 0; i < wb.NumberOfSheets; i++)
                    {
                        sh = (HSSFSheet)wb.GetSheetAt(i);
                        r = sh.GetRow(sh.FirstRowNum);

                        if (r != null)
                        {
                            c = r.GetCell(r.FirstCellNum);
                            if (c != null && sh.FirstRowNum == 1 && r.FirstCellNum == 1)
                            {
                                //the last check text before read
                                if (c.StringCellValue.Equals("CIF"))
                                {
                                    c = sh.GetRow(2 - 1).GetCell(cellMap.IndexOf('C'));

                                    if (c.CellType == CellType.NUMERIC)
                                    {
                                        cif = c.NumericCellValue.ToString();

                                        c = (r = sh.GetRow(3 - 1)).GetCell(cellMap.IndexOf('C'));
                                        if (c.CellType == CellType.NUMERIC)
                                        {
                                            defaultDate = new DateTime?(c.DateCellValue);
                                        }
                                        else
                                        {
                                            throw new Exception(wb.GetSheetName(i) + " C3 is not numeric.");
                                        }

                                        c = (r = sh.GetRow(4 - 1)).GetCell(cellMap.IndexOf('C'));
                                        if (c.CellType == CellType.NUMERIC)
                                        {
                                            dateOfRestructure = new DateTime?(c.DateCellValue);
                                        }
                                        else
                                        {
                                            throw new Exception(wb.GetSheetName(i) + " C4 is not numeric.");
                                        }

                                        int rowIndex = 7;

                                        while (true)
                                        {
                                            if (isDebugEnabled)
                                                log.Debug("rowIndex:" + rowIndex);

                                            r = sh.GetRow(rowIndex - 1);
                                            if (r == null) break;
                                            else if (isDebugEnabled)
                                                log.Debug("row null");

                                            c = r.GetCell(cellMap.IndexOf('B'));
                                            if (c.CellType == CellType.BLANK) break;
                                            else if (isDebugEnabled)
                                                log.Debug("row blank");

                                            ri = new Entities.RESTRUCTURE_INFORMATION();
                                            ri.CIF = cif;
                                            ri.Default_Date = defaultDate.Value;
                                            ri.Date_of_Restructure = dateOfRestructure.Value;

                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.Date_of_Repayment = c.DateCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception(wb.GetSheetName(i) + " B" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('C'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.Discount_Rate = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception(wb.GetSheetName(i) + " C" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('D'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.TDR_Cash_Flow = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception(wb.GetSheetName(i) + " D" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('E'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.Present_Value_of_Repayment = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception(wb.GetSheetName(i) + " E" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('F'));
                                            if (c.CellType == CellType.STRING)
                                            {
                                                ri.Cash_Flow_Currency = c.StringCellValue.Substring(c.StringCellValue.IndexOf(':') + 1, 3);
                                            }
                                            else
                                            {
                                                throw new Exception(wb.GetSheetName(i) + " F" + rowIndex + " is not string.");
                                            }

                                            ri.UPDATE_USER = User.Identity.Name;
                                            ri.UPDATE_DATE = DateTime.Now;

                                            //check if there is an existing record for user and id
                                            var record = en.RESTRUCTURE_INFORMATION.FirstOrDefault(
                                                restructure => restructure.CIF == ri.CIF
                                                    && restructure.Default_Date == ri.Default_Date
                                                    && restructure.Date_of_Restructure == ri.Date_of_Restructure
                                                    && restructure.Date_of_Repayment == ri.Date_of_Repayment);

                                            //if record exists, update with new rating
                                            if (record != null)
                                            {
                                                en.AttachTo("RESTRUCTURE_INFORMATION", record);
                                                record.Discount_Rate = ri.Discount_Rate;
                                                record.TDR_Cash_Flow = ri.TDR_Cash_Flow;
                                                record.Present_Value_of_Repayment = ri.Present_Value_of_Repayment;
                                                record.Cash_Flow_Currency = ri.Cash_Flow_Currency;
                                                record.UPDATE_USER = ri.UPDATE_USER;
                                                record.UPDATE_DATE = ri.UPDATE_DATE;
                                            }
                                            else //if it does not exist, add record
                                            {
                                                en.AddToRESTRUCTURE_INFORMATION(ri);
                                            }

                                            rowIndex = rowIndex + 1;
                                        }
                                    }
                                    else
                                    {
                                        throw new Exception(wb.GetSheetName(i) + " C2 is not numeric.");
                                    }
                                }
                                else
                                {
                                    throw new Exception("Value in " + wb.GetSheetName(i) + " cell B2 is not CIF.");
                                }
                            }
                            else
                            {
                                throw new Exception("First Cell in excel " + wb.GetSheetName(i) + " is not B2.");
                            }
                        }
                        else
                        {
                            log.Info("Can not find first row in " + wb.GetSheetName(i) + ".");
                        }
                        //save every sheet
                        en.SaveChanges();
                    }
                }
                else
                {
                    throw new Exception("Can not find file content in RESTRUCTURE_INFORMATION_FileUpload.");
                }
            }
            catch (Exception ex)
            {
                // ASP.NET must have the necessary permissions to write to the file system.
                log.Info("Write Unsuccess Excel.[" + Path.GetFileName(e.filename) + "]");
                string savePath = MapPath("~/Excel/RestructureInformation/Uploads/" + Path.GetFileName(e.filename));
                RESTRUCTURE_INFORMATION_FileUpload.SaveAs(savePath);

                string msg = ex.Message;
                if (ex.InnerException != null)
                {
                    //ex = ex.InnerException;
                    if (ex.InnerException.GetType().Equals(typeof(SqlException)))
                    {
                        msg = ((SqlException)ex.InnerException).Message.Replace("\'", "&quot;").Replace("\r", "").Replace("\n", "<br/>");
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "error", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = top.$get(\"" + uploadResult.ClientID + "\").innerHTML + '<br/><span style=\"color:red;\">Error: " + msg + "</span>';", true);
                log.Error(ex.Message, ex);
            }
            finally
            {
                try
                {
                    en.Connection.Close();
                }
                catch (Exception clsEx)
                {
                    //ignore
                }
                en = null;
                ri = null;
                c = null;
                r = null;
                sh = null;
                wb = null;
            }

            //UpdatePanel1.Update();
            //RESTRUCTURE_INFORMATION_SqlDataSource.DataBind();
            RESTRUCTURE_INFORMATION_GridView.DataBind();
        }

        protected void RESTRUCTURE_INFORMATION_FileUpload_UploadedFileError(object sender, AsyncFileUploadEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "error", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Error: " + e.statusMessage + "';", true);
        }

        protected virtual void CIF_TextBox_PreRender(object sender, EventArgs e)
        {
            ((TextBox)sender).Text = getQueryString("cif");
        }

        protected virtual void DetailsView_PreRender(object sender, EventArgs e)
        {
            if (((DetailsView)sender).FindControl("Empty_TextBox") != null)
            {
                RESTRUCTURE_INFORMATION_GridView.Visible = false;
                ((DetailsView)sender).ChangeMode(DetailsViewMode.Insert);
            }
            else
            {
                RESTRUCTURE_INFORMATION_GridView.Visible = true;
                if (((DetailsView)sender).CurrentMode == DetailsViewMode.ReadOnly)
                {
                    ((DetailsView)sender).ChangeMode(DetailsViewMode.Edit);
                }
                else if (((DetailsView)sender).CurrentMode == DetailsViewMode.Edit)
                {
                    //do nothing
                }

                if (((DetailsView)sender).CurrentMode != DetailsViewMode.Insert)
                {
                    //set parameter to grid and bind
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["CIF"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("CIF_Label")).Text;
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["Default_Date"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("Default_Date_Label")).Text;
                    RESTRUCTURE_INFORMATION_SqlDataSource.SelectParameters["Date_of_Restructure"].DefaultValue = ((Label)PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label")).Text;

                    RESTRUCTURE_INFORMATION_GridView.DataBind();
                }
                else
                {
                    RESTRUCTURE_INFORMATION_GridView.Visible = false;
                }
            }
        }

        protected void CIF_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("CIF_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("CIF_Label")).Text;
            }
        }

        protected void Default_Date_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("Default_Date_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("Default_Date_Label")).Text;
            }
        }

        protected void Date_of_Restructure_Label_PreRender(object sender, EventArgs e)
        {
            if (PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label") != null)
            {
                ((Label)sender).Text = ((Label)PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label")).Text;
            }
        }

        protected void RESTRUCTURE_INFORMATION_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridView gv = (GridView)sender;
            SqlDataSource ds = RESTRUCTURE_INFORMATION_SqlDataSource;

            if (e.CommandName.Equals("EmptyDataTemplateInsert"))
            {
                // Retrieve row
                GridViewRow gvr = gv.Controls[0].Controls[0] as GridViewRow;

                //if (gvr == null) { return; }

                // Retrieve data from controls
                Label cifLabel = (Label)gvr.FindControl("CIF_Label");
                Label defaultDateLabel = (Label)gvr.FindControl("Default_Date_Label");
                Label dateOfRestructureLabel = (Label)gvr.FindControl("Date_of_Restructure_Label");
                TextBox dateOfRepaymentTextBox = (TextBox)gvr.FindControl("Date_of_Repayment_TextBox");
                TextBox discountRateTextBox = (TextBox)gvr.FindControl("Discount_Rate_TextBox");
                TextBox tdrCashFlowTextBox = (TextBox)gvr.FindControl("TDR_Cash_Flow_TextBox");
                TextBox presentValueOfRepaymentTextBox = (TextBox)gvr.FindControl("Present_Value_of_Repayment_TextBox");
                DropDownList cashFlowCurrencyDropDownList = (DropDownList)gvr.FindControl("Cash_Flow_Currency_DropDownList");

                //if (cifLabel == null) { return; }
                //if (dateOfRepaymentTextBox == null) { return; }
                //if (User.Identity == null) { return; }

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifLabel.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["Date_of_Restructure"].DefaultValue = dateOfRestructureLabel.Text;
                ds.InsertParameters["Date_of_Repayment"].DefaultValue = dateOfRepaymentTextBox.Text;
                ds.InsertParameters["Discount_Rate"].DefaultValue = discountRateTextBox.Text;
                ds.InsertParameters["TDR_Cash_Flow"].DefaultValue = tdrCashFlowTextBox.Text;
                ds.InsertParameters["Present_Value_of_Repayment"].DefaultValue = presentValueOfRepaymentTextBox.Text;
                ds.InsertParameters["Cash_Flow_Currency"].DefaultValue = cashFlowCurrencyDropDownList.SelectedValue;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
            else if (e.CommandName.Equals("FooterInsert"))
            {
                // Retrieve data from controls
                Label cifLabel = (Label)gv.FooterRow.FindControl("CIF_Label");
                Label defaultDateLabel = (Label)gv.FooterRow.FindControl("Default_Date_Label");
                Label dateOfRestructureLabel = (Label)gv.FooterRow.FindControl("Date_of_Restructure_Label");
                TextBox dateOfRepaymentTextBox = (TextBox)gv.FooterRow.FindControl("Date_of_Repayment_TextBox");
                TextBox discountRateTextBox = (TextBox)gv.FooterRow.FindControl("Discount_Rate_TextBox");
                TextBox tdrCashFlowTextBox = (TextBox)gv.FooterRow.FindControl("TDR_Cash_Flow_TextBox");
                TextBox presentValueOfRepaymentTextBox = (TextBox)gv.FooterRow.FindControl("Present_Value_of_Repayment_TextBox");
                DropDownList cashFlowCurrencyDropDownList = (DropDownList)gv.FooterRow.FindControl("Cash_Flow_Currency_DropDownList");

                //if (cifLabel == null) { return; }
                //if (dateOfRepaymentTextBox == null) { return; }
                //if (User.Identity == null) { return; }

                // Set parameters
                ds.InsertParameters["CIF"].DefaultValue = cifLabel.Text;
                ds.InsertParameters["Default_Date"].DefaultValue = defaultDateLabel.Text;
                ds.InsertParameters["Date_of_Restructure"].DefaultValue = dateOfRestructureLabel.Text;
                ds.InsertParameters["Date_of_Repayment"].DefaultValue = dateOfRepaymentTextBox.Text;
                ds.InsertParameters["Discount_Rate"].DefaultValue = discountRateTextBox.Text;
                ds.InsertParameters["TDR_Cash_Flow"].DefaultValue = tdrCashFlowTextBox.Text;
                ds.InsertParameters["Present_Value_of_Repayment"].DefaultValue = presentValueOfRepaymentTextBox.Text;
                ds.InsertParameters["Cash_Flow_Currency"].DefaultValue = cashFlowCurrencyDropDownList.SelectedValue;
                ds.InsertParameters["UpdateUser"].DefaultValue = User.Identity.Name;
                ds.InsertParameters["UpdateDate"].DefaultValue = DateTime.Now.ToString("d MMMM yyyy HH:mm:ss.fff");

                // Perform insert
                ds.Insert();
            }
        }

        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UpdateUser"] = User.Identity.Name;
            e.NewValues["UpdateDate"] = DateTime.Now;
        }

        protected void Delete_All_Button_Click(object sender, ImageClickEventArgs e)
        {
            string cif = "", defaultDateText = "", restructureDateText = "";
            if (PV_LOSS_DetailsView.FindControl("CIF_Label") != null)
            {
                cif = ((Label)PV_LOSS_DetailsView.FindControl("CIF_Label")).Text;
            }
            if (PV_LOSS_DetailsView.FindControl("Default_Date_Label") != null)
            {
                defaultDateText = ((Label)PV_LOSS_DetailsView.FindControl("Default_Date_Label")).Text;
            }
            if (PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label") != null)
            {
                restructureDateText = ((Label)PV_LOSS_DetailsView.FindControl("Date_of_Restructure_Label")).Text;
            }

            DateTime? defaultDate = DateTime.ParseExact(defaultDateText, "d MMMM yyyy", new CultureInfo("en-US"));
            DateTime? restructureDate = DateTime.ParseExact(restructureDateText, "d MMMM yyyy", new CultureInfo("en-US"));

            using (Entities.LGDEntities en = new Entities.LGDEntities())
            {
                System.Data.Objects.ObjectQuery<Entities.RESTRUCTURE_INFORMATION> ri = en.RESTRUCTURE_INFORMATION;

                var queryRecord = from r in ri
                                  where r.CIF == cif
                                  && r.Default_Date == defaultDate.Value
                                  && r.Date_of_Restructure == restructureDate.Value
                                  select r;

                foreach (Entities.RESTRUCTURE_INFORMATION r in queryRecord)
                {
                    en.DeleteObject(r);
                }
                en.SaveChanges();
            }
        }

        protected void DDLValidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                PV_LOSS_SqlDataSource.FilterExpression = null;
                //CASHFLOW_DetailsView.DataBind();
            }
            else
            {
                PV_LOSS_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }

        protected void DDLValidate2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((System.Web.UI.WebControls.DropDownList)sender).SelectedValue == "-1")
            {
                RESTRUCTURE_INFORMATION_SqlDataSource.FilterExpression = null;
                //CASHFLOW_DetailsView.DataBind();
            }
            else
            {
                RESTRUCTURE_INFORMATION_SqlDataSource.FilterExpression = "HILIGHT_FLAG = 1";
                //CASHFLOW_DetailsView.DataBind();
            }
        }
    }
}