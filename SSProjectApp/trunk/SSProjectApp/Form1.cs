using System;
using System.Windows.Forms;

namespace SSProjectApp
{
    public partial class Form1 : Form
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            browseTextBox.Text = folderBrowserDialog1.SelectedPath;
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

        private void StartImportButton_Click(object sender, EventArgs e)
        {
            if (validateForm())
            {
                //Form selectForm = null;
                //selectForm = new StartFolderImportForm();

                //selectForm.ShowDialog(this);
            }
        }

        public string getBrowsePath()
        {
            return browseTextBox.Text;
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            log.Info("Close");
            this.Close();
        }
    }
}