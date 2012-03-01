using System;

namespace SME.DebtSummary.Core.Model
{
    public interface ICustomerViewModel
    {
        Int32 CIF { get; set; }

        String CUS_TITLE { get; set; }

        String CUS_FIRST { get; set; }

        String CUS_LAST { get; set; }

        String CUS1_TITLE { get; set; }

        String CUS1_FIRST { get; set; }

        String CUS1_LAST { get; set; }

        String CUS2_TITLE { get; set; }

        String CUS2_FIRST { get; set; }

        String CUS2_LAST { get; set; }

        String CUS3_TITLE { get; set; }

        String CUS3_FIRST { get; set; }

        String CUS3_LAST { get; set; }

        String CTITLE_E { get; set; }

        String CFIRST_E { get; set; }

        String CLAST_E { get; set; }

        String CifType { get; set; }

        Int32? BOTID { get; set; }

        Int32? MAIN_CUST { get; set; }

        String GROUP_CUST { get; set; }

        Int32? GROUPCIF { get; set; }

        String BAYRATING { get; set; }

        String RATING { get; set; }

        String ADDR1 { get; set; }

        String ADDR2 { get; set; }

        String PROV { get; set; }

        Int32? ZIPCODE { get; set; }

        String TEL_HOME { get; set; }

        String TEL_OFF { get; set; }

        String TAX_NO { get; set; }

        String CUS_TYPE { get; set; }

        String BUSI_TYPE { get; set; }

        String CLASS { get; set; }

        String IDCARD { get; set; }

        Int64 OFFICR_ID { get; set; }

        DateTime? DATEFAS { get; set; }

        DateTime? BEINGCUST { get; set; }

        DateTime? BTHDATE { get; set; }

        Byte? DEPTFLAG { get; set; }

        Int32? DEPTTRAN { get; set; }

        Int32? CIF0 { get; set; }

        Int32? CIF1 { get; set; }

        Int32? CIF2 { get; set; }

        String PROVSHOP { get; set; }

        String SEX { get; set; }

        String ADDRWORK1 { get; set; }

        String ADDRWORK2 { get; set; }

        Int32? ZIPSHOP { get; set; }

        String CARDTYPE { get; set; }

        String CARDNO { get; set; }
    }
}