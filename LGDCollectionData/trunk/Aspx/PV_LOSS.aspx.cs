using System;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.IO;
using System.Web.UI;
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
                                            throw new Exception("C3 is not numeric.");
                                        }

                                        c = (r = sh.GetRow(4 - 1)).GetCell(cellMap.IndexOf('C'));
                                        if (c.CellType == CellType.NUMERIC)
                                        {
                                            dateOfRestructure = new DateTime?(c.DateCellValue);
                                        }
                                        else
                                        {
                                            throw new Exception("C4 is not numeric.");
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
                                                throw new Exception("B" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('C'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.Discount_Rate = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception("C" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('D'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.TDR_Cash_Flow = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception("D" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('E'));
                                            if (c.CellType == CellType.NUMERIC)
                                            {
                                                ri.Present_Value_of_Repayment = c.NumericCellValue;
                                            }
                                            else
                                            {
                                                throw new Exception("E" + rowIndex + " is not numeric.");
                                            }

                                            c = r.GetCell(cellMap.IndexOf('F'));
                                            if (c.CellType == CellType.STRING)
                                            {
                                                ri.Cash_Flow_Currency = c.StringCellValue.Substring(c.StringCellValue.IndexOf(':')+1, 3);
                                            }
                                            else
                                            {
                                                throw new Exception("F" + rowIndex + " is not string.");
                                            }

                                            ri.UPDATE_USER = User.Identity.Name;
                                            ri.UPDATE_DATE = DateTime.Now;
                                            en.AddToRESTRUCTURE_INFORMATION(ri);

                                            rowIndex = rowIndex + 1;
                                        }
                                    }
                                    else
                                    {
                                        throw new Exception("C2 is not numeric.");
                                    }
                                }
                                else
                                {
                                    throw new Exception("Value in cell B2 is not CIF.");
                                }
                            }
                            else
                            {
                                throw new Exception("First Cell in excel is not B2.");
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
                throw ex;
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
    }
}