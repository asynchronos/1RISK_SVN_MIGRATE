using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.IO;
using System.Windows.Forms;
using ImportTextFile.DataModel;
using ImportTextFile.Utility;

namespace ImportTextFile.Forms.Customer
{
    public partial class CustomerForm : Form
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public CustomerForm()
        {
            InitializeComponent();
        }

        private void Browse_button_Click(object sender, System.EventArgs e)
        {
            if (filePath_openFileDialog.ShowDialog() == DialogResult.OK)
            {
                filePath_textBox.Text = filePath_openFileDialog.FileName;
                if (filePath_textBox.Text.Length > 1)
                {
                    start_button.Enabled = true;
                }
            }
        }

        private void start_button_Click(object sender, System.EventArgs e)
        {
            string currentLineString = null;
            string operationString = null;
            int countLine = 0;
            int SAVE_LIMIT = 10000;
            int DEBUG_LINE = 1;

            bool isError = false;
            bool isTruncate = true;

            start_button.Enabled = false;
            log.Info("This is test thai font:ทดสอบ");
            import_progressBar.Value = 1;
            DateTime startDate = DateTime.Now;
            log.Info("Start time:" + startDate.ToString("dd/MM/yyyy HH:mm:ss"));

            try
            {
                using (StreamReader reader = new StreamReader(filePath_textBox.Text, System.Text.Encoding.GetEncoding(874)))
                {
                    DateTime? asof = null;
                    List<CIMD110_TEMP> cimds = null;

                    while ((currentLineString = reader.ReadLine()) != null)
                    {
                        operationString = currentLineString;
                        countLine++;

                        if (countLine == 1)
                        {
                            asof = Util.Str2Date(operationString, "yyyyMMdd", new System.Globalization.CultureInfo("en-US"));
                            cimds = new List<CIMD110_TEMP>();
                        }
                        else
                        {
                            if (countLine <= DEBUG_LINE)
                            {
                                continue;
                            }

                            CIMD110_TEMP cusObject = new CIMD110_TEMP();

                            cusObject.CIF = Util.Str2Decimal(operationString.Substring(0, 9), 0).Value;
                            operationString = operationString.Remove(0, 9);

                            cusObject.CUS_TITLE = operationString.Substring(0, 10);
                            operationString = operationString.Remove(0, 10);

                            cusObject.CUS_FIRST = operationString.Substring(0, 30);
                            operationString = operationString.Remove(0, 30);

                            cusObject.CUS_LAST = operationString.Substring(0, 30);
                            operationString = operationString.Remove(0, 30);

                            cusObject.BUILD = operationString.Substring(0, 40);
                            operationString = operationString.Remove(0, 40);

                            cusObject.ADDR = operationString.Substring(0, 15);
                            operationString = operationString.Remove(0, 15);

                            cusObject.SOI = operationString.Substring(0, 25);
                            operationString = operationString.Remove(0, 25);

                            cusObject.ROAD = operationString.Substring(0, 25);
                            operationString = operationString.Remove(0, 25);

                            cusObject.GROUP_HOME = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.DISTICT = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.AMPHUR = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.PROV = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.TEL_HOME = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.TEL_OFF = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.TAX_NO = operationString.Substring(0, 10);
                            operationString = operationString.Remove(0, 10);

                            cusObject.CUS_TYPE = operationString.Substring(0, 4);
                            operationString = operationString.Remove(0, 4);

                            cusObject.BUSI_TYPE = operationString.Substring(0, 6);
                            operationString = operationString.Remove(0, 6);

                            cusObject.DEBTOR_CLASS = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CIF_DEP = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.MAIN_CUST = operationString.Substring(0, 9);
                            operationString = operationString.Remove(0, 9);

                            cusObject.GROUP_CUST = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.UPD_DATE = Util.Str2Date(operationString.Substring(0, 14), "yyyyMMddHHmmss");
                            operationString = operationString.Remove(0, 14);

                            cusObject.UPD_USER = operationString.Substring(0, 4);
                            operationString = operationString.Remove(0, 4);

                            cusObject.BOTID = operationString.Substring(0, 7);
                            operationString = operationString.Remove(0, 7);

                            cusObject.ID_CARD = operationString.Substring(0, 13);
                            operationString = operationString.Remove(0, 13);

                            cusObject.OFFICR_ID = operationString.Substring(0, 10);
                            operationString = operationString.Remove(0, 10);

                            cusObject.RESERVE = Util.Str2Decimal(operationString.Substring(0, 15), 2);
                            operationString = operationString.Remove(0, 15);

                            cusObject.RESV_CC = Util.Str2Decimal(operationString.Substring(0, 15), 2);
                            operationString = operationString.Remove(0, 15);

                            cusObject.COLL_BOT9 = Util.Str2Decimal(operationString.Substring(0, 15), 2);
                            operationString = operationString.Remove(0, 15);

                            cusObject.CLASS_PREV = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.SEPE_FLAG = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.RESVPERC = operationString.Substring(0, 13);
                            operationString = operationString.Remove(0, 13);

                            cusObject.FLAG_COLL = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.BOT_TYPE = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CIF_TYPE = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.DATE_FAS = Util.Str2Date(operationString.Substring(0, 8), "yyyyMMdd");
                            operationString = operationString.Remove(0, 8);

                            cusObject.NET_FAS = Util.Str2Decimal(operationString.Substring(0, 17), 2);
                            operationString = operationString.Remove(0, 17);

                            cusObject.AUTHO_CAP = Util.Str2Decimal(operationString.Substring(0, 17), 2);
                            operationString = operationString.Remove(0, 17);

                            cusObject.PAID_UP = Util.Str2Decimal(operationString.Substring(0, 17), 2);
                            operationString = operationString.Remove(0, 17);

                            cusObject.LABOR = Util.Str2Decimal(operationString.Substring(0, 8), 2);
                            operationString = operationString.Remove(0, 8);

                            cusObject.OPER_STA = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CODE_STA = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.GOVE_GUAR = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.BEING_CUST = Util.Str2Date(operationString.Substring(0, 8), "yyyyMMdd");
                            operationString = operationString.Remove(0, 8);

                            cusObject.BTH_DATE = Util.Str2Date(operationString.Substring(0, 8), "yyyyMMdd");
                            operationString = operationString.Remove(0, 8);

                            cusObject.BUILD_SHOP = operationString.Substring(0, 40);
                            operationString = operationString.Remove(0, 40);

                            cusObject.ADDR_SHOP = operationString.Substring(0, 15);
                            operationString = operationString.Remove(0, 15);

                            cusObject.SOI_SHOP = operationString.Substring(0, 25);
                            operationString = operationString.Remove(0, 25);

                            cusObject.ROAD_SHOP = operationString.Substring(0, 25);
                            operationString = operationString.Remove(0, 25);

                            cusObject.GROUP_SHOP = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.DISTRICT_S = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.AMPHUR_S = operationString.Substring(0, 20);
                            operationString = operationString.Remove(0, 20);

                            cusObject.PROV_SHOP = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.ZIP_SHOP = operationString.Substring(0, 5);
                            operationString = operationString.Remove(0, 5);

                            cusObject.CIF_0 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_1 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_2 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_3 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.ZIP_CODE = operationString.Substring(0, 5);
                            operationString = operationString.Remove(0, 5);

                            cusObject.DEPT_FLAG = Util.Str2Decimal(operationString.Substring(0, 1), 0);
                            operationString = operationString.Remove(0, 1);

                            cusObject.DEPT_TRAN = operationString.Substring(0, 5);
                            operationString = operationString.Remove(0, 5);

                            cusObject.CARD_TYPE = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.CARD_NO = operationString.Substring(0, 13);
                            operationString = operationString.Remove(0, 13);

                            cusObject.SEX = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.MARITAL_STA = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CITIZEN = operationString.Substring(0, 3);
                            operationString = operationString.Remove(0, 3);

                            cusObject.GROUP_CIF = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.DEPT_FLAG_T = Util.Str2Decimal(operationString.Substring(0, 1), 0);
                            operationString = operationString.Remove(0, 1);

                            cusObject.DEPT_TRAN_T = operationString.Substring(0, 5);
                            operationString = operationString.Remove(0, 5);

                            cusObject.CTITLENEW = operationString.Substring(0, 15);
                            operationString = operationString.Remove(0, 15);

                            cusObject.BAY_DATE = Util.Str2Date(operationString.Substring(0, 8), "yyyyMMdd");
                            operationString = operationString.Remove(0, 8);

                            cusObject.BAY_RATING = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.COUNTRY = operationString.Substring(0, 3);
                            operationString = operationString.Remove(0, 3);

                            cusObject.COUNTRY_SHOP = operationString.Substring(0, 3);
                            operationString = operationString.Remove(0, 3);

                            cusObject.MINOR_BUSI = operationString.Substring(0, 6);
                            operationString = operationString.Remove(0, 6);

                            cusObject.CUS_TITLE_E = operationString.Substring(0, 15);
                            operationString = operationString.Remove(0, 15);

                            cusObject.CUS_FIRST_E = operationString.Substring(0, 40);
                            operationString = operationString.Remove(0, 40);

                            cusObject.CUS_LAST_E = operationString.Substring(0, 40);
                            operationString = operationString.Remove(0, 40);

                            cusObject.COMM_NAME_THA = operationString.Substring(0, 80);
                            operationString = operationString.Remove(0, 80);

                            cusObject.COMM_NAME_ENG = operationString.Substring(0, 80);
                            operationString = operationString.Remove(0, 80);

                            cusObject.LAND_VALUE = Util.Str2Decimal(operationString.Substring(0, 15), 2);
                            operationString = operationString.Remove(0, 15);

                            cusObject.SELL_PER_YEAR = Util.Str2Decimal(operationString.Substring(0, 15), 2);
                            operationString = operationString.Remove(0, 15);

                            cusObject.SMEBOT_FLAG = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CIF_4 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_5 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_6 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_7 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_8 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.CIF_9 = Util.Str2Decimal(operationString.Substring(0, 9), 0);
                            operationString = operationString.Remove(0, 9);

                            cusObject.FIRST_NPL = Util.Str2Date(operationString.Substring(0, 8), "yyyyMMdd");
                            operationString = operationString.Remove(0, 8);

                            cusObject.TYP_RATE = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.OCCUPATION_CODE = operationString.Substring(0, 3);
                            operationString = operationString.Remove(0, 3);

                            cusObject.MOBILE_PHONE = operationString.Substring(0, 10);
                            operationString = operationString.Remove(0, 10);

                            cusObject.BUSI_RISK = operationString.Substring(0, 9);
                            operationString = operationString.Remove(0, 9);

                            cusObject.WEALTH = operationString.Substring(0, 1);
                            operationString = operationString.Remove(0, 1);

                            cusObject.CTRL_SIZE = operationString.Substring(0, 2);
                            operationString = operationString.Remove(0, 2);

                            cusObject.D_CTRL_SIZE = operationString.Substring(0, 30);

                            cusObject.ETL_ASOFDATE = asof;
                            cusObject.ETL_STATUS = "I";

                            //add to list
                            cimds.Add(cusObject);

                            //add to database
                            if (cimds.Count == SAVE_LIMIT)
                            {
                                using (RISKEntities riskEnt = new RISKEntities())
                                {
                                    riskEnt.ContextOptions.LazyLoadingEnabled = true;
                                    //clear table once
                                    if (isTruncate)
                                    {
                                        //clear table
                                        riskEnt.ExecuteStoreCommand("TRUNCATE TABLE CUSTOMER.CIMD110_TEMP");
                                        isTruncate = false;
                                    }

                                    foreach (CIMD110_TEMP cimd in cimds)
                                    {
                                        riskEnt.AddToCIMD110_TEMP(cimd);

                                        if (isDebugEnabled)
                                        {
                                            cimd.Debug(log);
                                        }
                                    }

                                    riskEnt.SaveChanges();
                                    riskEnt.Dispose();
                                }

                                //upadte progress
                                import_progressBar.Value = import_progressBar.Value + 1;
                                if (import_progressBar.Value == import_progressBar.Maximum)
                                {
                                    import_progressBar.Value = 1;
                                }
                                start_button.Text = "Saved " + countLine.ToString() + " cusObjects.";

                                //clear list
                                cimds.Clear();
                            }
                        }
                    }
                }

                DateTime endDate = DateTime.Now;
                log.Info("End time:" + endDate.ToString("dd/MM/yyyy HH:mm:ss"));
                log.Info("Total line:" + countLine);
                log.Info("Diff(in Milliseconds):" + endDate.Subtract(startDate).TotalMilliseconds.ToString());
                log.Info("Diff(in Minutes):" + endDate.Subtract(startDate).TotalMinutes.ToString());
                log.Info("Diff(in Hours):" + endDate.Subtract(startDate).TotalHours.ToString());

                start_button.Enabled = true;
                import_progressBar.Value = 100;
            }

            catch (FileNotFoundException fnfEx)
            {
                isError = true;
                log.Error("File not found:" + filePath_textBox.Text, fnfEx);
            }
            catch (SqlTypeException sqlTypeEx)
            {
                isError = true;
                log.Error("Sql type error.", sqlTypeEx);
            }
            catch (Exception ex)
            {
                isError = true;
                log.Error("Read file error:" + filePath_textBox.Text, ex);
                log.Error("Error Line:" + countLine + ":" + currentLineString);
                log.Error("Count Char:" + currentLineString.Length);
            }
            finally
            {
                string displayText = "Import Success.";
                if (isError)
                {
                    displayText = "Error,please see error log.";
                }

                start_button.Text = displayText;
            }
        }
    }
}