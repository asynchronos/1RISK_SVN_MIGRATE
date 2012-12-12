using System;
using log4net;

namespace SME.DebtSummary.Core.Model
{
    public class MISCustSieViewModel
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public readonly static string UNKNOWN_STR = "Unknown";
        public readonly static int UNKNOWN_ID = -9999;

        private Int32? _MISCustSizeID;

        public Int32? MISCustSizeID
        {
            get
            {
                return _MISCustSizeID;
            }
            set
            {
                _MISCustSizeID = value;
            }
        }

        private String _MISCustSize;

        public String MISCustSize
        {
            get
            {
                return _MISCustSize;
            }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                {
                    _MISCustSize = UNKNOWN_STR;
                    MISCustSizeID = UNKNOWN_ID;
                }
                else
                {
                    _MISCustSize = value;
                }
            }
        }

        private Int32? _MISCustSizeOrdersPriority;

        public Int32? MISCustSizeOrdersPriority
        {
            get
            {
                return _MISCustSizeOrdersPriority;
            }
            set
            {
                _MISCustSizeOrdersPriority = value;
            }
        }
    }
}