using System;
using System.Linq;
using LGDCollectionData.Entities;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class SELECT_FORM : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            string[] result = null;
            using (LGDEntities en = new LGDEntities())
            {
                result = en.List_of_Default.Where(n => n.CIF.StartsWith(prefixText)).OrderBy(n => n.CIF).Select(n => n.CIF).Take(count).ToArray();
            }
            return result;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonOpenForm_Click(object sender, EventArgs e)
        {
            if (ComboBox1.Text != null)
            {
                Response.Redirect(DropDownListFormName.SelectedValue + "?CIF=" + ComboBox1.Text);
            }
        }
    }
}