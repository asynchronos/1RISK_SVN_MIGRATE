using System;
using log4net;
using Util;

namespace SME.DebtSummary.Core.Model
{
    public class CustomerDebtViewModel
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private Int32 _CIF;

        public Int32 CIF
        {
            get { return _CIF; }
            set { _CIF = value; }
        }

        private String _CM_EMP_ID;

        public String CM_EMP_ID
        {
            get { return _CM_EMP_ID; }
            set { _CM_EMP_ID = value; }
        }

        private String _CM_TITLE;

        public String CM_TITLE
        {
            get { return _CM_TITLE; }
            set { _CM_TITLE = value; }
        }

        private String _CM_FIRSTNAME;

        public String CM_FIRSTNAME
        {
            get { return _CM_FIRSTNAME; }
            set { _CM_FIRSTNAME = value; }
        }

        private String _CM_LASTNAME;

        public String CM_LASTNAME
        {
            get { return _CM_LASTNAME; }
            set { _CM_LASTNAME = value; }
        }

        private String _CM_NAME;

        public String CM_NAME
        {
            get
            {
                if (String.IsNullOrEmpty(_CM_NAME))
                {
                    _CM_NAME = CommonUtil.ConcatName(CM_TITLE, CM_FIRSTNAME, CM_LASTNAME);
                }
                return _CM_NAME;
            }
            set { _CM_NAME = value; }
        }

        private String _CusTitle;

        public String CusTitle
        {
            get { return _CusTitle; }
            set { _CusTitle = value; }
        }

        private String _CusFirstName;

        public String CusFirstName
        {
            get { return _CusFirstName; }
            set { _CusFirstName = value; }
        }

        private String _CusLastName;

        public String CusLastName
        {
            get { return _CusLastName; }
            set { _CusLastName = value; }
        }

        private String _Name;

        public String Name
        {
            get
            {
                if (String.IsNullOrEmpty(_Name))
                {
                    _Name = CommonUtil.ConcatName(CusTitle, CusFirstName, CusLastName);
                }
                return _Name;
            }
            set { _Name = value; }
        }

        private String _CusTitle2;

        public String CusTitle2
        {
            get { return _CusTitle2; }
            set { _CusTitle2 = value; }
        }

        private String _CusFirstName2;

        public String CusFirstName2
        {
            get { return _CusFirstName2; }
            set { _CusFirstName2 = value; }
        }

        private String _CusLastName2;

        public String CusLastName2
        {
            get { return _CusLastName2; }
            set { _CusLastName2 = value; }
        }

        private String _Name2;

        public String Name2
        {
            get
            {
                if (String.IsNullOrEmpty(_Name2))
                {
                    _Name2 = CommonUtil.ConcatName(CusTitle2, CusFirstName2, CusLastName2);
                }
                return _Name2;
            }
            set { _Name2 = value; }
        }

        private String _CusTitle3;

        public String CusTitle3
        {
            get { return _CusTitle3; }
            set { _CusTitle3 = value; }
        }

        private String _CusFirstName3;

        public String CusFirstName3
        {
            get { return _CusFirstName3; }
            set { _CusFirstName3 = value; }
        }

        private String _CusLastName3;

        public String CusLastName3
        {
            get { return _CusLastName3; }
            set { _CusLastName3 = value; }
        }

        private String _Name3;

        public String Name3
        {
            get
            {
                if (String.IsNullOrEmpty(_Name3))
                {
                    _Name3 = CommonUtil.ConcatName(CusTitle3, CusFirstName3, CusLastName3);
                }
                return _Name3;
            }
            set { _Name3 = value; }
        }

        private String _CusTitle4;

        public String CusTitle4
        {
            get { return _CusTitle4; }
            set { _CusTitle4 = value; }
        }

        private String _CusFirstName4;

        public String CusFirstName4
        {
            get { return _CusFirstName4; }
            set { _CusFirstName4 = value; }
        }

        private String _CusLastName4;

        public String CusLastName4
        {
            get { return _CusLastName4; }
            set { _CusLastName4 = value; }
        }

        private String _Name4;

        public String Name4
        {
            get
            {
                if (String.IsNullOrEmpty(_Name4))
                {
                    _Name4 = CommonUtil.ConcatName(CusTitle4, CusFirstName4, CusLastName4);
                }
                return _Name4;
            }
            set { _Name4 = value; }
        }

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
                    _MISCustSize = MISCustSieViewModel.UNKNOWN_STR;
                    MISCustSizeID = MISCustSieViewModel.UNKNOWN_ID;
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

        private String _BaySize;

        public String BaySize
        {
            get
            {
                return _BaySize;
            }
            set
            {
                _BaySize = value;
            }
        }

        private String _Rating;

        public String Rating
        {
            get
            {
                return _Rating;
            }
            set
            {
                _Rating = value;
            }
        }

        private Int16? _BranchMaxPrin;

        public Int16? BranchMaxPrin
        {
            get
            {
                return _BranchMaxPrin;
            }
            set
            {
                _BranchMaxPrin = value;
            }
        }

        private String _Class;

        public String Class
        {
            get
            {
                return _Class;
            }
            set
            {
                _Class = value;
            }
        }

        private String _ClassE;

        public String ClassE
        {
            get
            {
                return _ClassE;
            }
            set
            {
                _ClassE = value;
            }
        }

        private String _TdrFlag;

        public String TdrFlag
        {
            get
            {
                return _TdrFlag;
            }
            set
            {
                _TdrFlag = value;
            }
        }

        private Decimal? _Principal;

        public Decimal? Principal
        {
            get
            {
                return _Principal;
            }
            set
            {
                _Principal = value;
            }
        }

        private Decimal? _Accru;

        public Decimal? Accru
        {
            get
            {
                return _Accru;
            }
            set
            {
                _Accru = value;
            }
        }

        private Decimal? _Susp;

        public Decimal? Susp
        {
            get
            {
                return _Susp;
            }
            set
            {
                _Susp = value;
            }
        }

        private Decimal? _UseValue;

        public Decimal? UseValue
        {
            get
            {
                return _UseValue;
            }
            set
            {
                _UseValue = value;
            }
        }

        private Decimal? _TotResv;

        public Decimal? TotResv
        {
            get
            {
                return _TotResv;
            }
            set
            {
                _TotResv = value;
            }
        }

        private String _CM_Dep;

        public String CM_Dep
        {
            get
            {
                return _CM_Dep;
            }
            set
            {
                _CM_Dep = value;
            }
        }

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
                    _MISStatus = MISStatusViewModel.UNKNOWN_STR;
                    MISStatusID = MISStatusViewModel.UNKNOWN_ID;
                }
                else
                {
                    _MISStatus = value;
                }
            }
        }

        private Int32? _MISStatusPriority;

        public Int32? MISStatusPriority
        {
            get
            {
                return _MISStatusPriority;
            }
            set
            {
                _MISStatusPriority = value;
            }
        }
    }
}