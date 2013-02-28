using System.Configuration;
using System.Data.Linq;
using System.IO;
using log4net;
using SME.UserSystem.Core.Model;

namespace SME.UserSystem.Core.Context
{
    partial class ProfileDataContext : DataContext
    {
        private static readonly ILog log4net = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log4net.IsDebugEnabled;

        private StreamWriter _log;

        partial void OnCreated()
        {
            //LoadOptions
            DataLoadOptions options = new DataLoadOptions();
            options.LoadWith<ProfileViewModel>(p => p.EMP_ID);
            this.LoadOptions = options;
            /*
        	        * It is always a good idea to keep an eye on what SQL statements
   	        * are emitted by LINQ engine
        	        * this could be a good practice during development phase
   	        * so that appropriate database optimization
        	        * measures are taken (indexes, query optimization, etc...).
            */
            _log = new StreamWriter(ConfigurationManager.AppSettings.Get("ProfileDataContextPath")
                    , false
                    , System.Text.Encoding.ASCII);
            _log.AutoFlush = true;
            this.Log = _log;
        }

        protected override void Dispose(bool disposing)
        {
            _log.Close();
            _log.Dispose();
            base.Dispose(disposing);
        }
    }
}