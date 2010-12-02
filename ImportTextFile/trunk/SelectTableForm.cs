using System.Windows.Forms;
using ImportTextFile.Forms.Customer;

namespace ImportTextFile
{
    public partial class SelectTableForm : Form
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public SelectTableForm()
        {
            InitializeComponent();
        }

        private void customer_button_Click(object sender, System.EventArgs e)
        {
            Form selectedForm = new CustomerForm();
            selectedForm.ShowDialog(this);
        }
    }
}