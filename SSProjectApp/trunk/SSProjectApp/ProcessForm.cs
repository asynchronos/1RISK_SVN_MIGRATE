using System;
using System.IO;
using System.Windows.Forms;
using NPOI.HSSF.UserModel;

namespace SSProjectApp
{
    public partial class ProcessForm : Form
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static readonly string cellMap = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        private int CharacterCellMap(string str)
        {
            int len = str.Length;
            return (cellMap.Length * (len - 1)) + cellMap.IndexOf(str.Substring(len - 1, 1));
        }

        public ProcessForm()
        {
            InitializeComponent();
        }

        private void ProcessForm_Shown(object sender, EventArgs e)
        {
            this.Enabled = false;

            string filename = string.Empty;

            Form1 importForm = (Form1)this.Owner;
            try
            {
                DirectoryInfo dir = new DirectoryInfo(importForm.getBrowsePath());

                FileInfo[] files = dir.GetFiles("*.txt");
                int totalFile = files.Length;
                initProcessBar(totalFile);

                for (int i = 0; i < totalFile; i++)
                {
                    if (files[i].FullName.Contains("_NoIdentify"))
                    {
                        continue;
                    }

                    HSSFWorkbook wb = new HSSFWorkbook(new FileStream(files[i].FullName, FileMode.Open, FileAccess.Read), true);

                    for (var shRuning = 0; shRuning < wb.NumberOfSheets; i++)
                    {
                    }

                    progressLabel.Text = (i + 1).ToString() + "/" + totalFile.ToString();
                    progressLabel.Refresh();
                    progressBar1.PerformStep();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, ex.StackTrace, "Error : " + ex.Message);
                log.Error(ex.Message, ex);
            }
            finally
            {
                this.Enabled = true;
            }
        }

        private void initProcessBar(int count)
        {
            progressBar1.Step = progressBar1.Maximum / count;
            progressBar1.Minimum = progressBar1.Maximum - (progressBar1.Step * count);
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}