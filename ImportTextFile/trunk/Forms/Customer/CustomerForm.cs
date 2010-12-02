using System;
using System.IO;
using System.Windows.Forms;
using ImportTextFile._Code.DataModel;
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
            int countLine = 0;
            int startIndex = 0;
            int length = 0;

            log.Info("This is test thai font:ทดสอบ");
            import_progressBar.Value = 1;
            DateTime startDate = DateTime.Now;
            log.Info("Start time:" + startDate.ToString("dd/MM/yyyy HH:mm:ss"));

            try
            {
                using (StreamReader reader = new StreamReader(filePath_textBox.Text,System.Text.Encoding.GetEncoding(874)))
                {
                    string firstLine = null;
                    DateTime? asof = null;

                    using (RISKEntities riskEnt = new RISKEntities())
                    {
                        while ((currentLineString = reader.ReadLine()) != null)
                        {
                            countLine++;
                            if (countLine == 1)
                            {
                                firstLine = currentLineString;
                                asof = Util.Str2Date(firstLine, "yyyyMMdd", new System.Globalization.CultureInfo("en-US"));
                            }
                            else
                            {
                                //data line
                                startIndex = 0;
                                CIMD110 record = new CIMD110();
                                record.CIF = Util.Str2Decimal(currentLineString.Substring(startIndex = 0, length = 9)).Value;
                                record.CUS_TITLE = currentLineString.Substring(startIndex = 9, length = 10);
                                record.CUS_FIRST = currentLineString.Substring(startIndex = 19, length = 30);
                                record.CUS_LAST = currentLineString.Substring(startIndex = 49, length = 30);
                                record.BUILD = currentLineString.Substring(startIndex = 79, length = 40);
                                record.ADDR = currentLineString.Substring(startIndex = 119, length = 15);
                                record.SOI = currentLineString.Substring(startIndex = 134, length = 25);
                                record.ROAD = currentLineString.Substring(startIndex = 159, length = 25);
                                record.GROUP_HOME = currentLineString.Substring(startIndex = 184, length = 2);
                                record.DISTICT = currentLineString.Substring(startIndex = 186, length = 20);
                                record.AMPHUR = currentLineString.Substring(startIndex = 206, length = 20);
                                record.PROV = currentLineString.Substring(startIndex = 226, length = 2);
                                record.TEL_HOME = currentLineString.Substring(startIndex = 228, length = 20);
                                record.TEL_OFF = currentLineString.Substring(startIndex = 248, length = 20);
                                record.TAX_NO = currentLineString.Substring(startIndex = 268, length = 10);
                                record.CUS_TYPE = currentLineString.Substring(startIndex = 278, length = 4);
                                record.BUSI_TYPE = currentLineString.Substring(startIndex = 282, length = 6);
                                record.DEBTOR_CLASS = currentLineString.Substring(startIndex = 288, length = 1);
                                record.CIF_DEP = currentLineString.Substring(startIndex = 289, length = 1);
                                record.MAIN_CUST = currentLineString.Substring(startIndex = 290, length = 9);
                                record.GROUP_CUST = currentLineString.Substring(startIndex = 299, length = 1);
                                record.UPD_DATE = Util.Str2Date(currentLineString.Substring(startIndex = 300, length = 14), "yyyyMMddHHmmss");
                                record.UPD_USER = currentLineString.Substring(startIndex = 314, length = 4);
                                record.BOTID = currentLineString.Substring(startIndex = 318, length = 7);
                                record.ID_CARD = currentLineString.Substring(startIndex = 325, length = 13);
                                record.OFFICR_ID = currentLineString.Substring(startIndex = 338, length = 10);
                                record.RESERVE = Util.Str2Decimal(currentLineString.Substring(startIndex = 348, length = 15));
                                record.RESV_CC = Util.Str2Decimal(currentLineString.Substring(startIndex = 363, length = 15));
                                record.COLL_BOT9 = Util.Str2Decimal(currentLineString.Substring(startIndex = 378, length = 15));
                                record.CLASS_PREV = currentLineString.Substring(startIndex = 393, length = 1);
                                record.SEPE_FLAG = currentLineString.Substring(startIndex = 394, length = 1);
                                record.RESVPERC = currentLineString.Substring(startIndex = 395, length = 13);
                                record.FLAG_COLL = currentLineString.Substring(startIndex = 408, length = 1);
                                record.BOT_TYPE = currentLineString.Substring(startIndex = 409, length = 1);
                                record.CIF_TYPE = currentLineString.Substring(startIndex = 410, length = 1);
                                record.DATE_FAS = Util.Str2Date(currentLineString.Substring(startIndex = 411, length = 8), "yyyyMMdd");
                                record.NET_FAS = Util.Str2Decimal(currentLineString.Substring(startIndex = 419, length = 17));
                                record.AUTHO_CAP = Util.Str2Decimal(currentLineString.Substring(startIndex = 436, length = 17));
                                record.PAID_UP = Util.Str2Decimal(currentLineString.Substring(startIndex = 453, length = 17));
                                record.LABOR = Util.Str2Decimal(currentLineString.Substring(startIndex = 470, length = 8));
                                record.OPER_STA = currentLineString.Substring(startIndex = 478, length = 1);
                                record.CODE_STA = currentLineString.Substring(startIndex = 479, length = 2);
                                record.GOVE_GUAR = currentLineString.Substring(startIndex = 481, length = 1);
                                record.BEING_CUST = Util.Str2Date(currentLineString.Substring(startIndex = 482, length = 8), "yyyyMMdd");
                                record.BTH_DATE = Util.Str2Date(currentLineString.Substring(startIndex = 490, length = 8), "yyyyMMdd");
                                record.BUILD_SHOP = currentLineString.Substring(startIndex = 498, length = 40);
                                record.ADDR_SHOP = currentLineString.Substring(startIndex = 538, length = 15);
                                record.SOI_SHOP = currentLineString.Substring(startIndex = 553, length = 25);
                                record.ROAD_SHOP = currentLineString.Substring(startIndex = 578, length = 25);
                                record.GROUP_SHOP = currentLineString.Substring(startIndex = 603, length = 2);
                                record.DISTRICT_S = currentLineString.Substring(startIndex = 605, length = 20);
                                record.AMPHUR_S = currentLineString.Substring(startIndex = 625, length = 20);
                                record.PROV_SHOP = currentLineString.Substring(startIndex = 645, length = 2);
                                record.ZIP_SHOP = currentLineString.Substring(startIndex = 647, length = 5);
                                record.CIF_0 = Util.Str2Decimal(currentLineString.Substring(startIndex = 652, length = 9));
                                record.CIF_1 = Util.Str2Decimal(currentLineString.Substring(startIndex = 661, length = 9));
                                record.CIF_2 = Util.Str2Decimal(currentLineString.Substring(startIndex = 670, length = 9));
                                record.CIF_3 = Util.Str2Decimal(currentLineString.Substring(startIndex = 679, length = 9));
                                record.ZIP_CODE = currentLineString.Substring(startIndex = 688, length = 5);
                                record.DEPT_FLAG = Util.Str2Decimal(currentLineString.Substring(startIndex = 693, length = 1));
                                record.DEPT_TRAN = currentLineString.Substring(startIndex = 694, length = 5);
                                record.CARD_TYPE = currentLineString.Substring(startIndex = 699, length = 2);
                                record.CARD_NO = currentLineString.Substring(startIndex = 701, length = 13);
                                record.SEX = currentLineString.Substring(startIndex = 714, length = 1);
                                record.MARITAL_STA = currentLineString.Substring(startIndex = 715, length = 1);
                                record.CITIZEN = currentLineString.Substring(startIndex = 716, length = 3);
                                record.GROUP_CIF = Util.Str2Decimal(currentLineString.Substring(startIndex = 719, length = 9));
                                record.DEPT_FLAG_T = Util.Str2Decimal(currentLineString.Substring(startIndex = 728, length = 1));
                                record.DEPT_TRAN_T = currentLineString.Substring(startIndex = 729, length = 5);
                                record.CTITLENEW = currentLineString.Substring(startIndex = 734, length = 15);
                                record.BAY_DATE = Util.Str2Date(currentLineString.Substring(startIndex = 749, length = 8), "yyyyMMdd");
                                record.BAY_RATING = currentLineString.Substring(startIndex = 757, length = 2);
                                record.COUNTRY = currentLineString.Substring(startIndex = 759, length = 3);
                                record.COUNTRY_SHOP = currentLineString.Substring(startIndex = 762, length = 3);
                                record.MINOR_BUSI = currentLineString.Substring(startIndex = 765, length = 6);
                                record.CUS_TITLE_E = currentLineString.Substring(startIndex = 771, length = 15);
                                record.CUS_FIRST_E = currentLineString.Substring(startIndex = 786, length = 40);
                                record.CUS_LAST_E = currentLineString.Substring(startIndex = 826, length = 40);
                                record.COMM_NAME_THA = currentLineString.Substring(startIndex = 866, length = 80);
                                record.COMM_NAME_ENG = currentLineString.Substring(startIndex = 946, length = 80);
                                record.LAND_VALUE = Util.Str2Decimal(currentLineString.Substring(startIndex = 1026, length = 15));
                                record.SELL_PER_YEAR = Util.Str2Decimal(currentLineString.Substring(startIndex = 1041, length = 15));
                                record.SMEBOT_FLAG = currentLineString.Substring(startIndex = 1056, length = 1);
                                record.CIF_4 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1057, length = 9));
                                record.CIF_5 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1066, length = 9));
                                record.CIF_6 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1075, length = 9));
                                record.CIF_7 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1084, length = 9));
                                record.CIF_8 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1093, length = 9));
                                record.CIF_9 = Util.Str2Decimal(currentLineString.Substring(startIndex = 1102, length = 9));
                                record.FIRST_NPL = Util.Str2Date(currentLineString.Substring(startIndex = 1111, length = 8), "yyyyMMdd");
                                record.TYP_RATE = currentLineString.Substring(startIndex = 1119, length = 1);
                                record.OCCUPATION_CODE = currentLineString.Substring(startIndex = 1120, length = 3);
                                record.MOBILE_PHONE = currentLineString.Substring(startIndex = 1123, length = 10);
                                record.BUSI_RISK = currentLineString.Substring(startIndex = 1133, length = 9);
                                //record.WEALTH = currentLineString.Substring(startIndex = 1142, length = 1);
                                record.CTRL_SIZE = currentLineString.Substring(startIndex = 1142, length = 2);
                                record.D_CTRL_SIZE = currentLineString.Substring(startIndex = 1144, length = 30);
                                //record.RISK_GRADE = currentLineString.Substring(startIndex = 1175, length = 2);

                                //try
                                //{
                                //    record.D_CTRL_SIZE = currentLineString.Substring(startIndex = 1145, length = 30);
                                //    record.RISK_GRADE = currentLineString.Substring(startIndex = 1175, length = 2);
                                //}
                                //catch (Exception inEx)
                                //{
                                //    log.Debug("-----------------------------------------------------------------");
                                //    log.Debug("Error Line:" + countLine + ":" + currentLineString);
                                //    log.Debug("Count Char:" + currentLineString.Length);
                                //    log.Debug("-----------------------------------------------------------------");
                                //}

                                riskEnt.AddToCIMD110(record);

                                import_progressBar.Value += 1;
                                if (import_progressBar.Value == 100)
                                {
                                    import_progressBar.Value = 1;
                                }

                                if (countLine % 100000 == 0)
                                {
                                    riskEnt.SaveChanges();
                                }
                            }
                        }
                    }
                }

                DateTime endDate = DateTime.Now;
                log.Info("End time:" + endDate.ToString("dd/MM/yyyy HH:mm:ss"));
                log.Info("Diff(in Milliseconds):" + endDate.Subtract(startDate).TotalMilliseconds.ToString());
                log.Info("Diff(in Minutes):" + endDate.Subtract(startDate).TotalMinutes.ToString());
                log.Info("Diff(in Hours):" + endDate.Subtract(startDate).TotalHours.ToString());

                import_progressBar.Value = 100;
            }
            catch (FileNotFoundException fnfEx)
            {
                log.Error("File not found:" + filePath_textBox.Text, fnfEx);
            }
            catch (Exception ex)
            {
                log.Error("Read file error:" + filePath_textBox.Text, ex);
                log.Error("Error Line:" + countLine + ":" + currentLineString);
                log.Error("Count Char:" + currentLineString.Length);
                log.Error("Error String:" + currentLineString.Substring(startIndex, length));
            }
        }
    }
}