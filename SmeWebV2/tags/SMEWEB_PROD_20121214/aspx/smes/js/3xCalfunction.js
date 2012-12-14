function FNSTMT() {  // financial statement

    // Private variable


    var CASH_BOND
    var BOND_DEPOSIT_PLEDGE_PERSON;
    var INVENTORY_INTERVIEW;
    var INVENTORY_VISIT;
    var MACHINERY_EQUIPMENT;
    var CORE_ASSETS;
    var OTHER_FIXED_ASSETS_OTHER_BANK;
    var OTHER_FIXED_ASSETS;
    var ASSETS_INCREASE_LOAN;
    var ACCOUNT_PAYABLE;
    var CURRENT_LIABILITY_BAY;
    var WORKING_CAPITAL;
    var TCG_LOAN;
    var CURRENT_LIABILITY_OTHER_BANK;
    var OTHER_CURRENT_LIABILITY;
    var REFINANCE_WORKING_CAPITAL_OTHER;
    var LONG_TERM_LIABILITY_BAY;
    var LOAN;
    var LONG_TERM_LIABILITY_OTHER_BANK;
    var LONG_TERM_OTHER_LIABILITY;
    var REFINANCE_WORKING_LOAN_OTHER;
    var LOANS_REL_CO_DIRECTORS;

    return {
        // Public methods
        setCASH_BOND: function (newCASH_BOND) {
            CASH_BOND = newCASH_BOND;
        },
        setBOND_DEPOSIT_PLEDGE_PERSON: function (newBOND_DEPOSIT_PLEDGE_PERSON) {
            BOND_DEPOSIT_PLEDGE_PERSON = newBOND_DEPOSIT_PLEDGE_PERSON;
        },
        getCASH_BOND: function () {
            return (CASH_BOND + BOND_DEPOSIT_PLEDGE_PERSON);
        },
        setACCOUNT_RECEIVABLE: function (newACCOUNT_RECEIVABLE) {
            ACCOUNT_RECEIVABLE = newACCOUNT_RECEIVABLE;
        },
        getACCOUNT_RECEIVABLE: function () {
            return ACCOUNT_RECEIVABLE;
        },

        setINVENTORY_INTERVIEW: function (newINVENTORY_INTERVIEW) {
            INVENTORY_INTERVIEW = newINVENTORY_INTERVIEW;
        },
        setINVENTORY_VISIT: function (newINVENTORY_VISIT) {
            INVENTORY_VISIT = newINVENTORY_VISIT;
        },
        getINVENTORY: function () {
            if (INVENTORY_VISIT == 0) {
                return INVENTORY_INTERVIEW;

            } else {
                return INVENTORY_VISIT;
            }
        },
        getTOTAL_CURRENT_ASSETS: function () {
            return this.getCASH_BOND() + this.getACCOUNT_RECEIVABLE() + this.getINVENTORY();
        },
        setMACHINERY_EQUIPMENT: function (newMACHINERY_EQUIPMENT) {
            MACHINERY_EQUIPMENT = newMACHINERY_EQUIPMENT;
        },
        getMACHINERY_EQUIPMENT: function () {
            return MACHINERY_EQUIPMENT;
        },
        setCORE_ASSETS: function (newCORE_ASSETS) {
            CORE_ASSETS = newCORE_ASSETS;
        },
        getPROPERTY_PLANT_BUILDING: function () {
            return CORE_ASSETS;
        },

        setOTHER_FIXED_ASSETS_OTHER_BANK: function (newOTHER_FIXED_ASSETS_OTHER_BANK) {
            OTHER_FIXED_ASSETS_OTHER_BANK = newOTHER_FIXED_ASSETS_OTHER_BANK;
        },
        setOTHER_FIXED_ASSETS: function (newOTHER_FIXED_ASSETS) {
            OTHER_FIXED_ASSETS = newOTHER_FIXED_ASSETS;
        },
        getOTHER_FIXED_ASSETS: function () {
            return OTHER_FIXED_ASSETS + OTHER_FIXED_ASSETS_OTHER_BANK;
        },
        setASSETS_INCREASE_LOAN: function (newASSETS_INCREASE_LOAN) {
            ASSETS_INCREASE_LOAN = newASSETS_INCREASE_LOAN
        },
        getASSETS_FROM_CREDIT: function () {
            return ASSETS_INCREASE_LOAN;
        },
        getTOTAL_FIXED_ASSETS: function () {
            return this.getMACHINERY_EQUIPMENT() + this.getPROPERTY_PLANT_BUILDING() + this.getOTHER_FIXED_ASSETS() + this.getASSETS_FROM_CREDIT();
        },
        getTOTAL_ASSETS: function () {
            return this.getTOTAL_FIXED_ASSETS() + this.getTOTAL_CURRENT_ASSETS();
        },

        setACCOUNT_PAYABLE: function (newACCOUNT_PAYABLE) {
            ACCOUNT_PAYABLE = newACCOUNT_PAYABLE;
        },
        getACCOUNT_PAYABLE: function () {
            return ACCOUNT_PAYABLE;
        },
        setCURRENT_LIABILITY_BAY: function (newCURRENT_LIABILITY_BAY) {
            CURRENT_LIABILITY_BAY = newCURRENT_LIABILITY_BAY;
        },
        setWORKING_CAPITAL: function (newWORKING_CAPITAL) {
            WORKING_CAPITAL = newWORKING_CAPITAL;
        },
        getCURRENT_LIABILITY_BAY: function () {
            return CURRENT_LIABILITY_BAY + WORKING_CAPITAL;
        },
        setTCG_LOAN: function (newTCG_LOAN) {
            TCG_LOAN = newTCG_LOAN;
        },
        setCURRENT_LIABILITY_OTHER_BANK: function (newCURRENT_LIABILITY_OTHER_BANK) {
            CURRENT_LIABILITY_OTHER_BANK = newCURRENT_LIABILITY_OTHER_BANK;
        },
        setOTHER_CURRENT_LIABILITY: function (newOTHER_CURRENT_LIABILITY) {
            OTHER_CURRENT_LIABILITY = newOTHER_CURRENT_LIABILITY;
        },
        setREFINANCE_WORKING_CAPITAL_OTHER: function (newREFINANCE_WORKING_CAPITAL_OTHER) {
            REFINANCE_WORKING_CAPITAL_OTHER = newREFINANCE_WORKING_CAPITAL_OTHER;
        },
        getOTHER_CURRENT_LIABILITY: function () {
            if (WORKING_CAPITAL + TCG_LOAN == 0) {
                return CURRENT_LIABILITY_OTHER_BANK + OTHER_CURRENT_LIABILITY;
            } else {
                return CURRENT_LIABILITY_OTHER_BANK + OTHER_CURRENT_LIABILITY - REFINANCE_WORKING_CAPITAL_OTHER;
            }
        },
        getTOTAL_CURRENT_LIABILITY: function () {
            return this.getACCOUNT_PAYABLE() + this.getCURRENT_LIABILITY_BAY() + this.getOTHER_CURRENT_LIABILITY();
        },
        setLONG_TERM_LIABILITY_BAY: function (newLONG_TERM_LIABILITY_BAY) {
            LONG_TERM_LIABILITY_BAY = newLONG_TERM_LIABILITY_BAY;
        },
        setLOAN: function (newLOAN) {
            LOAN = newLOAN;
        },
        getLONG_TERM_LIABILITY_BAY: function () {
            return LONG_TERM_LIABILITY_BAY + LOAN + TCG_LOAN;
        },

        setLONG_TERM_LIABILITY_OTHER_BANK: function (newLONG_TERM_LIABILITY_OTHER_BANK) {
            LONG_TERM_LIABILITY_OTHER_BANK = newLONG_TERM_LIABILITY_OTHER_BANK;
        },
        setLONG_TERM_OTHER_LIABILITY: function (newLONG_TERM_OTHER_LIABILITY) {
            LONG_TERM_OTHER_LIABILITY = newLONG_TERM_OTHER_LIABILITY;
        },
        setREFINANCE_WORKING_LOAN_OTHER: function (newREFINANCE_WORKING_LOAN_OTHER) {
            REFINANCE_WORKING_LOAN_OTHER = newREFINANCE_WORKING_LOAN_OTHER;
        },

        getOTHER_LONG_TERM_LIABILITY: function () {
            if (TCG_LOAN + LOAN == 0) {
                return LONG_TERM_LIABILITY_OTHER_BANK + LONG_TERM_OTHER_LIABILITY;
            } else {
                return LONG_TERM_LIABILITY_OTHER_BANK + LONG_TERM_OTHER_LIABILITY - REFINANCE_WORKING_LOAN_OTHER;
            }
        },
        getTOTAL_LONG_TERM: function () {
            return this.getLONG_TERM_LIABILITY_BAY() + this.getOTHER_LONG_TERM_LIABILITY();
        },
        getTOTAL_LIABILITY: function () {

            return this.getTOTAL_CURRENT_LIABILITY() + this.getTOTAL_LONG_TERM();
        },
        setLOANS_REL_CO_DIRECTORSTextBox: function (newLOANS_REL_CO_DIRECTORS) {
            LOANS_REL_CO_DIRECTORS = newLOANS_REL_CO_DIRECTORS;
        },
        getLOANS_REL_CO_DIRECTORS: function () {
            return LOANS_REL_CO_DIRECTORS;
        },
        getEQUITY: function () {
            return this.getTOTAL_ASSETS() - this.getTOTAL_LIABILITY() - this.getLOANS_REL_CO_DIRECTORS();
        },
        getLIABILITY_EQUITY: function () {
            return this.getTOTAL_LIABILITY()+ this.getLOANS_REL_CO_DIRECTORS() +  this.getEQUITY();
        }

    };



}