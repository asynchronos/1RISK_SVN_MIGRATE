using System;
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
            using (LGDEntities en = new LGDEntities())
            {
                //var queryUser = (from user in en.lis
                //                 where user.EMP_ID == username
                //                 && user.EXPIRE_DATE >= DateTime.Now
                //                 && user.DEL_FLAG == false
                //                 select user);

                //if (!(queryUser.FirstOrDefault() == null))
                //{
                //    if (queryUser.FirstOrDefault().PASSWD.Equals(password))
                //    {
                //        result = true;
                //    }
                //}
            }
            return default(string[]);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonOpenForm_Click(object sender, EventArgs e)
        {
            if (TextBoxCIF.Text != null)
            {
                Response.Redirect(DropDownListFormName.SelectedValue + "?CIF=" + TextBoxCIF.Text);
            }
        }
    }
}