using System;

namespace SME.DebtSummary.Core.Model
{
    public class CustomerDebtViewModel
    {
        private Int32 _CIF;

        public Int32 CIF
        {
            get { return _CIF; }
            set { _CIF = value; }
        }

        private String _Name;

        public String Name
        {
            get { return _Name; }
            set { _Name = value; }
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

        private Int16 _BranchMaxPrin;

        public Int16 BranchMaxPrin
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
    }
}