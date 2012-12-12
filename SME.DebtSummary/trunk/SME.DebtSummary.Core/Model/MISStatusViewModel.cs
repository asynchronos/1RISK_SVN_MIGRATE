using System;
using log4net;

namespace SME.DebtSummary.Core.Model
{
    public class MISStatusViewModel
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public static string UNKNOWN_STR = "Unknown";
        public static int UNKNOWN_ID = -9999;

        private Int32? _MISStatusID;

        public Int32? MISStatusID
        {
            get
            {
                return _MISStatusID;
            }
            set
            {
                _MISStatusID = value;
            }
        }

        private String _MISStatus;

        public String MISStatus
        {
            get
            {
                return _MISStatus;
            }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                {
                    _MISStatus = UNKNOWN_STR;
                    MISStatusID = UNKNOWN_ID;
                }
                else
                {
                    _MISStatus = value;
                }
            }
        }

        private Int32? _MISStatusOrdersPriority;

        public Int32? MISStatusOrdersPriority
        {
            get
            {
                return _MISStatusOrdersPriority;
            }
            set
            {
                _MISStatusOrdersPriority = value;
            }
        }
    }
}