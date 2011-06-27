using System;
using System.Windows.Forms;

namespace ImportTextFile.Forms.RepCust
{
    public partial class RepCustForm : Form
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        //private static string fileName = "C:\\Documents and Settings\\249888\\Desktop\\N_SEE_BEE\\221397731.txt";
        //private static string fileName = "D:\\workspaces\\NCBApplication\\NCBApplication\\Data\\TestData.txt";

        public RepCustForm()
        {
            InitializeComponent();
        }

        //private void button1_Click(object sender, EventArgs e)
        //{
        //TUEFSubjectModel subject = null;
        //subject = ncb.utility.TUEFUtil.readTUEFFile(fileName);

        //TB_HEADER_SEGMENT obj = subject.convert2DbModel();
        //log.Info(obj.ENQUIRY_CONTROL_NUMBER);
        //log.Info(obj.TB_NAME_SEGMENTs.Count);
        //log.Info(obj.TB_ID_SEGMENTs.Count);
        //log.Info(obj.TB_ADDRESS_SEGMENTs.Count);
        //log.Info(obj.TB_ACCOUNT_SEGMENTs.Count);
        //log.Info(obj.TB_HISTORY_SEGMENTs.Count);
        //log.Info(obj.TB_ENQUIRY_SEGMENTs.Count);

        //    try
        //    {
        //        CreditLinqOperation.insertSubject(subject);
        //    }
        //    catch (Exception ex)
        //    {
        //        log.Error(ex.Message, ex);
        //    }

        //    Console.WriteLine("finish");
        //}

        private void fileRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (txtRadioButton.Checked)
            {
                browseLabel.Text = "Text Path : ";
            }
            else if (dbfRadioButton.Checked)
            {
                browseLabel.Text = "DBF Path : ";
            }

            browseTextBox.Text = string.Empty;
        }

        private void browseButton_Click(object sender, EventArgs e)
        {
            if (txtRadioButton.Checked)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    browseTextBox.Text = openFileDialog1.FileName;
                }
            }
            else if (dbfRadioButton.Checked)
            {
                if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
                {
                    browseTextBox.Text = folderBrowserDialog1.SelectedPath;
                }
            }
        }

        private bool validateBrowseTextBox()
        {
            bool result = true;

            if (String.Empty == browseTextBox.Text)
            {
                browseErrorProvider.SetError(browseTextBox, "Please specified path.");
                result = false;
            }
            else
            {
                browseErrorProvider.SetError(browseTextBox, String.Empty);
            }

            return result;
        }

        private bool validateForm()
        {
            bool result = true;

            if (!validateBrowseTextBox())
            {
                MessageBox.Show(this, browseErrorProvider.GetError(browseTextBox), "Validate");
                result = false;
            }

            return result;
        }

        private void startImportButton_Click(object sender, EventArgs e)
        {
            if (validateForm())
            {
                Form selectForm = null;
                if (txtRadioButton.Checked)
                {
                    //selectForm = new StartFileImportForm();
                }
                else if (dbfRadioButton.Checked)
                {
                    //selectForm = new StartFolderImportForm();
                }
                else
                {
                    //selectForm = new ErrorForm();
                }

                selectForm.ShowDialog(this);
            }
        }

        public string getBrowsePath()
        {
            return browseTextBox.Text;
        }

        public bool isFile()
        {
            return txtRadioButton.Checked;
        }

        public bool isFolder()
        {
            return dbfRadioButton.Checked;
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            log.Info("Close");
            this.Close();
        }
    }
}