using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.IO;
using System.Windows.Forms;
using ImportTextFile.DataModel;
using ImportTextFile.Utility;
using ImportTextFile.DataModel.Customer;

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
                    List<CIMD110_TEMP_SUB> cimds = null;

                    while ((currentLineString = reader.ReadLine()) != null)
                    {
                        operationString = currentLineString;
                        countLine++;

                        if (countLine == 1)
                        {
                            asof = Util.Str2Date(operationString, "yyyyMMdd", new System.Globalization.CultureInfo("en-US"));
                            cimds = new List<CIMD110_TEMP_SUB>();
                        }
                        else
                        {
                            if (countLine <= DEBUG_LINE)
                            {
                                continue;
                            }

                            CIMD110_TEMP_SUB cusObject = new CIMD110_TEMP_SUB();

                            cusObject.CIF = Util.Str2Decimal(operationString.Substring(0, 9), 0).Value;
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CUS_TITLE = operationString.Substring(9, 10);
                            //operationString = operationString.Remove(0, 10);

                            cusObject.CUS_FIRST = operationString.Substring(19, 30);
                            //operationString = operationString.Remove(0, 30);

                            cusObject.CUS_LAST = operationString.Substring(49, 30);
                            //operationString = operationString.Remove(0, 30);

                            cusObject.BUILD = operationString.Substring(79, 40);
                            //operationString = operationString.Remove(0, 40);

                            cusObject.ADDR = operationString.Substring(119, 15);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.SOI = operationString.Substring(134, 25);
                            //operationString = operationString.Remove(0, 25);

                            cusObject.ROAD = operationString.Substring(159, 25);
                            //operationString = operationString.Remove(0, 25);

                            cusObject.GROUP_HOME = operationString.Substring(184, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.DISTICT = operationString.Substring(186, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.AMPHUR = operationString.Substring(206, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.PROV = operationString.Substring(226, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.TEL_HOME = operationString.Substring(228, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.TEL_OFF = operationString.Substring(248, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.TAX_NO = operationString.Substring(268, 10);
                            //operationString = operationString.Remove(0, 10);

                            cusObject.CUS_TYPE = operationString.Substring(278, 4);
                            //operationString = operationString.Remove(0, 4);

                            cusObject.BUSI_TYPE = operationString.Substring(282, 6);
                            //operationString = operationString.Remove(0, 6);

                            cusObject.DEBTOR_CLASS = operationString.Substring(288, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CIF_DEP = operationString.Substring(289, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.MAIN_CUST = operationString.Substring(290, 9);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.GROUP_CUST = operationString.Substring(299, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.UPD_DATE = Util.Str2Date(operationString.Substring(300, 14), "yyyyMMddHHmmss");
                            //operationString = operationString.Remove(0, 14);

                            cusObject.UPD_USER = operationString.Substring(314, 4);
                            //operationString = operationString.Remove(0, 4);

                            cusObject.BOTID = operationString.Substring(318, 7);
                            //operationString = operationString.Remove(0, 7);

                            cusObject.ID_CARD = operationString.Substring(325, 13);
                            //operationString = operationString.Remove(0, 13);

                            cusObject.OFFICR_ID = operationString.Substring(338, 10);
                            //operationString = operationString.Remove(0, 10);

                            cusObject.RESERVE = Util.Str2Decimal(operationString.Substring(348, 15), 2);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.RESV_CC = Util.Str2Decimal(operationString.Substring(363, 15), 2);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.COLL_BOT9 = Util.Str2Decimal(operationString.Substring(378, 15), 2);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.CLASS_PREV = operationString.Substring(393, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.SEPE_FLAG = operationString.Substring(394, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.RESVPERC = operationString.Substring(395, 13);
                            //operationString = operationString.Remove(0, 13);

                            cusObject.FLAG_COLL = operationString.Substring(408, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.BOT_TYPE = operationString.Substring(409, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CIF_TYPE = operationString.Substring(410, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.DATE_FAS = Util.Str2Date(operationString.Substring(411, 8), "yyyyMMdd");
                            //operationString = operationString.Remove(0, 8);

                            cusObject.NET_FAS = Util.Str2Decimal(operationString.Substring(419, 17), 2);
                            //operationString = operationString.Remove(0, 17);

                            cusObject.AUTHO_CAP = Util.Str2Decimal(operationString.Substring(436, 17), 2);
                            //operationString = operationString.Remove(0, 17);

                            cusObject.PAID_UP = Util.Str2Decimal(operationString.Substring(453, 17), 2);
                            //operationString = operationString.Remove(0, 17);

                            cusObject.LABOR = Util.Str2Decimal(operationString.Substring(470, 8), 2);
                            //operationString = operationString.Remove(0, 8);

                            cusObject.OPER_STA = operationString.Substring(478, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CODE_STA = operationString.Substring(479, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.GOVE_GUAR = operationString.Substring(481, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.BEING_CUST = Util.Str2Date(operationString.Substring(482, 8), "yyyyMMdd");
                            //operationString = operationString.Remove(0, 8);

                            cusObject.BTH_DATE = Util.Str2Date(operationString.Substring(490, 8), "yyyyMMdd");
                            //operationString = operationString.Remove(0, 8);

                            cusObject.BUILD_SHOP = operationString.Substring(498, 40);
                            //operationString = operationString.Remove(0, 40);

                            cusObject.ADDR_SHOP = operationString.Substring(538, 15);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.SOI_SHOP = operationString.Substring(553, 25);
                            //operationString = operationString.Remove(0, 25);

                            cusObject.ROAD_SHOP = operationString.Substring(578, 25);
                            //operationString = operationString.Remove(0, 25);

                            cusObject.GROUP_SHOP = operationString.Substring(603, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.DISTRICT_S = operationString.Substring(605, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.AMPHUR_S = operationString.Substring(625, 20);
                            //operationString = operationString.Remove(0, 20);

                            cusObject.PROV_SHOP = operationString.Substring(645, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.ZIP_SHOP = operationString.Substring(647, 5);
                            //operationString = operationString.Remove(0, 5);

                            cusObject.CIF_0 = Util.Str2Decimal(operationString.Substring(652, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_1 = Util.Str2Decimal(operationString.Substring(661, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_2 = Util.Str2Decimal(operationString.Substring(670, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_3 = Util.Str2Decimal(operationString.Substring(679, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.ZIP_CODE = operationString.Substring(688, 5);
                            //operationString = operationString.Remove(0, 5);

                            cusObject.DEPT_FLAG = Util.Str2Decimal(operationString.Substring(693, 1), 0);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.DEPT_TRAN = operationString.Substring(694, 5);
                            //operationString = operationString.Remove(0, 5);

                            cusObject.CARD_TYPE = operationString.Substring(699, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.CARD_NO = operationString.Substring(701, 13);
                            //operationString = operationString.Remove(0, 13);

                            cusObject.SEX = operationString.Substring(714, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.MARITAL_STA = operationString.Substring(715, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CITIZEN = operationString.Substring(716, 3);
                            //operationString = operationString.Remove(0, 3);

                            cusObject.GROUP_CIF = Util.Str2Decimal(operationString.Substring(719, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.DEPT_FLAG_T = Util.Str2Decimal(operationString.Substring(728, 1), 0);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.DEPT_TRAN_T = operationString.Substring(729, 5);
                            //operationString = operationString.Remove(0, 5);

                            cusObject.CTITLENEW = operationString.Substring(734, 15);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.BAY_DATE = Util.Str2Date(operationString.Substring(749, 8), "yyyyMMdd");
                            //operationString = operationString.Remove(0, 8);

                            cusObject.BAY_RATING = operationString.Substring(757, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.COUNTRY = operationString.Substring(759, 3);
                            //operationString = operationString.Remove(0, 3);

                            cusObject.COUNTRY_SHOP = operationString.Substring(762, 3);
                            //operationString = operationString.Remove(0, 3);

                            cusObject.MINOR_BUSI = operationString.Substring(765, 6);
                            //operationString = operationString.Remove(0, 6);

                            cusObject.CUS_TITLE_E = operationString.Substring(771, 15);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.CUS_FIRST_E = operationString.Substring(786, 40);
                            //operationString = operationString.Remove(0, 40);

                            cusObject.CUS_LAST_E = operationString.Substring(826, 40);
                            //operationString = operationString.Remove(0, 40);

                            cusObject.COMM_NAME_THA = operationString.Substring(866, 80);
                            //operationString = operationString.Remove(0, 80);

                            cusObject.COMM_NAME_ENG = operationString.Substring(946, 80);
                            //operationString = operationString.Remove(0, 80);

                            cusObject.LAND_VALUE = Util.Str2Decimal(operationString.Substring(1026, 15), 2);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.SELL_PER_YEAR = Util.Str2Decimal(operationString.Substring(1041, 15), 2);
                            //operationString = operationString.Remove(0, 15);

                            cusObject.SMEBOT_FLAG = operationString.Substring(1056, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CIF_4 = Util.Str2Decimal(operationString.Substring(1057, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_5 = Util.Str2Decimal(operationString.Substring(1066, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_6 = Util.Str2Decimal(operationString.Substring(1075, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_7 = Util.Str2Decimal(operationString.Substring(1084, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_8 = Util.Str2Decimal(operationString.Substring(1093, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.CIF_9 = Util.Str2Decimal(operationString.Substring(1102, 9), 0);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.FIRST_NPL = Util.Str2Date(operationString.Substring(1111, 8), "yyyyMMdd");
                            //operationString = operationString.Remove(0, 8);

                            cusObject.TYP_RATE = operationString.Substring(1119, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.OCCUPATION_CODE = operationString.Substring(1120, 3);
                            //operationString = operationString.Remove(0, 3);

                            cusObject.MOBILE_PHONE = operationString.Substring(1123, 10);
                            //operationString = operationString.Remove(0, 10);

                            cusObject.BUSI_RISK = operationString.Substring(1133, 9);
                            //operationString = operationString.Remove(0, 9);

                            cusObject.WEALTH = operationString.Substring(1142, 1);
                            //operationString = operationString.Remove(0, 1);

                            cusObject.CTRL_SIZE = operationString.Substring(1143, 2);
                            //operationString = operationString.Remove(0, 2);

                            cusObject.D_CTRL_SIZE = operationString.Substring(1145, 30);

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

                                    foreach (CIMD110_TEMP_SUB cimd in cimds)
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