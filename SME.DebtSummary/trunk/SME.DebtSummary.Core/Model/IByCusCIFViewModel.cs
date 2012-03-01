using System;

namespace SME.DebtSummary.Core.Model
{
    public interface IByCusCIFViewModel
    {
        Int32 CIF { get; set; }

        String Name { get; set; }

        Int32? BOTID { get; set; }

        String BaySize { get; set; }

        Byte? BaySizeNo { get; set; }

        String Rating { get; set; }

        String BizTypeE { get; set; }

        Int32? Busi_Type { get; set; }

        Int16? BranchMaxPrin { get; set; }

        Decimal? AgingOK { get; set; }

        Decimal? AgingMax { get; set; }

        String Class { get; set; }

        String ClassE { get; set; }

        Decimal? PrincipalFull { get; set; }

        Decimal? Principal { get; set; }

        Decimal? PrinCom { get; set; }

        Decimal? PrinRetail { get; set; }

        Decimal? Cont { get; set; }

        Decimal? ContIAS { get; set; }

        Decimal? Contingent { get; set; }

        Decimal? Contingent_EFW { get; set; }

        Decimal? AccruFull { get; set; }

        Decimal? Accru { get; set; }

        Decimal? SuspOri { get; set; }

        Decimal? Susp { get; set; }

        Decimal? UNEARNPRIN { get; set; }

        Decimal? UNEARNINT { get; set; }

        Decimal? UNCLEAPRIN { get; set; }

        Decimal? UNCLEAINT { get; set; }

        Decimal? DEFER { get; set; }

        Decimal? UseValue { get; set; }

        Decimal? BAfterC { get; set; }

        Decimal? TdrLoss { get; set; }

        Decimal? Reserve { get; set; }

        Decimal? PVLOSS { get; set; }

        Decimal? AddResv { get; set; }

        Decimal? Totresv { get; set; }

        Decimal? Full_IAS39 { get; set; }

        Decimal? AddResv_IAS39 { get; set; }

        Decimal? ResvFull { get; set; }

        Byte? CusDeptFlag { get; set; }

        Int32? CusDeptTran { get; set; }

        Double? Office_Id_CIM { get; set; }

        Double? AO_SME { get; set; }

        Double? Office_Id { get; set; }

        Boolean? Affiliate { get; set; }

        String NplFlag { get; set; }

        DateTime? FirstSMHistory { get; set; }

        DateTime? FirstSMDate { get; set; }

        Int32? FirstSMYear { get; set; }

        Int32? FirstSMYear1 { get; set; }

        Int32? LastSMCount { get; set; }

        DateTime? LastSMDate { get; set; }

        Int32? LastSMYear { get; set; }

        Int32? LastSMYear1 { get; set; }

        Int32? SMMonthFirst { get; set; }

        Int32? SMMonthLast { get; set; }

        DateTime? FirstNplHistory { get; set; }

        DateTime? FirstNplDate { get; set; }

        Int32? FirstNplYear { get; set; }

        Int32? FirstNplYear1 { get; set; }

        Int32? LastNplCount { get; set; }

        DateTime? LastNplDate { get; set; }

        Int32? LastNplYear { get; set; }

        Int32? LastNplYear1 { get; set; }

        Int32? NplMonthFirst { get; set; }

        Int32? NplMonthLast { get; set; }

        String TdrFlag { get; set; }

        String GDR { get; set; }

        Int32? TdrFirst { get; set; }

        Byte? Count { get; set; }

        Int32? Date_Report { get; set; }

        String DateReport { get; set; }

        String DateRegister { get; set; }

        String BOT { get; set; }

        String BOTYear { get; set; }

        String BOTClassAfter { get; set; }

        String BOT1 { get; set; }

        String BOTYear1 { get; set; }

        String BOTClass1 { get; set; }

        String CDR { get; set; }

        String CDRYear { get; set; }

        String CDRClass { get; set; }

        String CM_Dep { get; set; }

        String CM_Flag { get; set; }

        String CM_Group { get; set; }

        String CM_Temp { get; set; }

        Double? CM_Id_Ao { get; set; }

        String CM_Ao { get; set; }

        String CM_AoTel { get; set; }

        String RM_Dep { get; set; }

        String RM_Group { get; set; }

        String RM_Temp { get; set; }

        Double? RM_Id_Ao { get; set; }

        String RM_Ao { get; set; }

        String RM_AoTel { get; set; }
    }
}