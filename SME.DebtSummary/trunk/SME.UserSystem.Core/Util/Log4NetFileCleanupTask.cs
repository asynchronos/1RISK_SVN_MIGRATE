using System;
using System.IO;
using System.Linq;
using log4net;
using log4net.Appender;

namespace SME.UserSystem.Core.Util
{
    public class Log4NetFileCleanupTask
    {
        #region - Constructor -

        public Log4NetFileCleanupTask()
        {
        }

        #endregion - Constructor -

        #region - Methods -

        /// <summary>
        /// Cleans up. Auto configures the cleanup based on the log4net configuration
        /// </summary>
        /// <param name="date">Anything prior will not be kept.</param>
        public void CleanUp(DateTime date)
        {
            string directory = string.Empty;
            string filePrefix = string.Empty;

            var repo = LogManager.GetAllRepositories().FirstOrDefault(); ;
            if (repo == null)
                throw new NotSupportedException("Log4Net has not been configured yet.");

            var app = repo.GetAppenders().Where(x => x.GetType() == typeof(RollingFileAppender)).FirstOrDefault();
            if (app != null)
            {
                var appender = app as RollingFileAppender;

                directory = Path.GetDirectoryName(appender.File);
                filePrefix = Path.GetFileName(appender.File);

                CleanUp(directory, filePrefix, date);
            }
        }

        /// <summary>
        /// Cleans up.
        /// </summary>
        /// <param name="logDirectory">The log directory.</param>
        /// <param name="logPrefix">The log prefix. Example: logfile dont include the file extension.</param>
        /// <param name="date">Anything prior will not be kept.</param>
        public void CleanUp(string logDirectory, string logPrefix, DateTime date)
        {
            if (string.IsNullOrEmpty(logDirectory))
                throw new ArgumentException("logDirectory is missing");

            if (string.IsNullOrEmpty(logDirectory))
                throw new ArgumentException("logPrefix is missing");

            var dirInfo = new DirectoryInfo(logDirectory);
            if (!dirInfo.Exists)
                return;

            var fileInfos = dirInfo.GetFiles("{0}*.*".Sub(logPrefix));
            if (fileInfos.Length == 0)
                return;

            foreach (var info in fileInfos)
            {
                if (string.Compare(info.Name, logPrefix, true) != 0)
                {
                    if (info.CreationTime < date)
                    {
                        info.Delete();
                    }
                }
            }
        }

        #endregion - Methods -
    }
}