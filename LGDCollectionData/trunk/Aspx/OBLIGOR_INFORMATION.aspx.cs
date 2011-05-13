using System;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class OBLIGOR_INFORMATION : MyAspxPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}