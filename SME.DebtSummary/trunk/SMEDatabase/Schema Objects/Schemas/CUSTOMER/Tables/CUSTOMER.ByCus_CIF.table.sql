﻿CREATE TABLE [CUSTOMER].[ByCus_CIF]
(
	[Cif] [int] NOT NULL,
	[Name] [nvarchar](80) NULL,
	[BOTID] [int] NULL,
	[BaySize] [nvarchar](16) NULL,
	[BaySizeNo] [tinyint] NULL,
	[Rating] [nvarchar](3) NULL,
	[BizTypeE] [nvarchar](30) NULL,
	[Busi_Type] [int] NULL,
	[BranchMaxPrin] [smallint] NULL,
	[AgingOK] [money] NULL,
	[AgingMax] [money] NULL,
	[Class] [nvarchar](1) NULL,
	[ClassE] [nvarchar](4) NULL,
	[PrincipalFull] [money] NULL,
	[Principal] [money] NULL,
	[PrinCom] [money] NULL,
	[PrinRetail] [money] NULL,
	[Cont] [money] NULL,
	[ContIAS] [money] NULL,
	[Contingent] [money] NULL,
	[Contingent_EFW] [money] NULL,
	[AccruFull] [money] NULL,
	[Accru] [money] NULL,
	[SuspOri] [money] NULL,
	[Susp] [money] NULL,
	[UNEARNPRIN] [money] NULL,
	[UNEARNINT] [money] NULL,
	[UNCLEAPRIN] [money] NULL,
	[UNCLEAINT] [money] NULL,
	[DEFER] [money] NULL,
	[UseValue] [money] NULL,
	[BAfterC] [money] NULL,
	[TdrLoss] [money] NULL,
	[Reserve] [money] NULL,
	[PVLOSS] [money] NULL,
	[AddResv] [money] NULL,
	[Totresv] [money] NULL,
	[Full_IAS39] [money] NULL,
	[AddResv_IAS39] [money] NULL,
	[ResvFull] [money] NULL,
	[CusDeptFlag] [tinyint] NULL,
	[CusDeptTran] [int] NULL,
	[Office_Id_CIM] [float] NULL,
	[AO_SME] [float] NULL,
	[Office_Id] [float] NULL,
	[Affiliate] [bit] NOT NULL,
	[NplFlag] [nvarchar](3) NULL,
	[FirstSMHistory] [datetime] NULL,
	[FirstSMDate] [datetime] NULL,
	[FirstSMYear] [int] NULL,
	[FirstSMYear1] [int] NULL,
	[LastSMCount] [int] NULL,
	[LastSMDate] [datetime] NULL,
	[LastSMYear] [int] NULL,
	[LastSMYear1] [int] NULL,
	[SMMonthFirst] [int] NULL,
	[SMMonthLast] [int] NULL,
	[FirstNplHistory] [datetime] NULL,
	[FirstNplDate] [datetime] NULL,
	[FirstNplYear] [int] NULL,
	[FirstNplYear1] [int] NULL,
	[LastNplCount] [int] NULL,
	[LastNplDate] [datetime] NULL,
	[LastNplYear] [int] NULL,
	[LastNplYear1] [int] NULL,
	[NplMonthFirst] [int] NULL,
	[NplMonthLast] [int] NULL,
	[TdrFlag] [nvarchar](6) NULL,
	[GDR] [nvarchar](1) NULL,
	[TdrFirst] [int] NULL,
	[Count] [tinyint] NULL,
	[Date_Report] [int] NULL,
	[DateReport] [nvarchar](7) NULL,
	[DateRegister] [nvarchar](7) NULL,
	[BOT] [nvarchar](10) NULL,
	[BOTYear] [nvarchar](15) NULL,
	[BOTClassAfter] [nvarchar](1) NULL,
	[BOT1] [nvarchar](3) NULL,
	[BOTYear1] [nvarchar](10) NULL,
	[BOTClass1] [nvarchar](1) NULL,
	[CDR] [nvarchar](3) NULL,
	[CDRYear] [nvarchar](10) NULL,
	[CDRClass] [nvarchar](1) NULL,
	[CM_Dep] [nvarchar](10) NULL,
	[CM_Flag] [nvarchar](15) NULL,
	[CM_Group] [nvarchar](15) NULL,
	[CM_Temp] [nvarchar](15) NULL,
	[CM_Id_Ao] [float] NULL,
	[CM_Ao] [nvarchar](15) NULL,
	[CM_AoTel] [nvarchar](15) NULL,
	[RM_Dep] [nvarchar](10) NULL,
	[RM_Group] [nvarchar](15) NULL,
	[RM_Temp] [nvarchar](15) NULL,
	[RM_Id_Ao] [float] NULL,
	[RM_Ao] [nvarchar](15) NULL,
	[RM_AoTel] [nvarchar](15) NULL
)