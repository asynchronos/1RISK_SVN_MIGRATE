﻿CREATE TABLE [dbo].[TEMP_PORT_20111231] (
    [Cif]                     FLOAT          NOT NULL,
    [Name]                    NVARCHAR (255) NULL,
    [BOTID]                   FLOAT          NULL,
    [BaySize]                 NVARCHAR (255) NULL,
    [BaySizeNo]               FLOAT          NULL,
    [Rating]                  NVARCHAR (255) NULL,
    [BizTypeE]                NVARCHAR (255) NULL,
    [Busi_Type]               FLOAT          NULL,
    [BranchMaxPrin]           FLOAT          NULL,
    [AgingOK]                 MONEY          NULL,
    [AgingMax]                MONEY          NULL,
    [Class]                   NVARCHAR (255) NULL,
    [ClassE]                  NVARCHAR (255) NULL,
    [PrincipalFull]           FLOAT          NULL,
    [Principal]               FLOAT          NULL,
    [PrinCom]                 FLOAT          NULL,
    [PrinRetail]              FLOAT          NULL,
    [Cont]                    FLOAT          NULL,
    [ContIAS]                 FLOAT          NULL,
    [Contingent]              FLOAT          NULL,
    [Contingent_EFW]          FLOAT          NULL,
    [AccruFull]               FLOAT          NULL,
    [Accru]                   FLOAT          NULL,
    [SuspOri]                 MONEY          NULL,
    [Susp]                    MONEY          NULL,
    [CusDeptFlag]             FLOAT          NULL,
    [CusDeptTran]             FLOAT          NULL,
    [Office_Id_CIM]           FLOAT          NULL,
    [01_ByCus5412_AO_SME]     FLOAT          NULL,
    [Office_Id]               FLOAT          NULL,
    [Affiliate]               BIT            NOT NULL,
    [NplFlag]                 NVARCHAR (255) NULL,
    [FirstSMHistory]          DATETIME       NULL,
    [FirstSMDate]             DATETIME       NULL,
    [FirstSMYear]             FLOAT          NULL,
    [FirstSMYear1]            FLOAT          NULL,
    [LastSMCount]             FLOAT          NULL,
    [LastSMDate]              DATETIME       NULL,
    [LastSMYear]              FLOAT          NULL,
    [TdrFlag]                 NVARCHAR (255) NULL,
    [GDR]                     NVARCHAR (255) NULL,
    [TdrFirst]                FLOAT          NULL,
    [Count]                   NVARCHAR (255) NULL,
    [Date_Report]             NVARCHAR (255) NULL,
    [DateReport]              NVARCHAR (255) NULL,
    [DateRegister]            NVARCHAR (255) NULL,
    [BOT]                     NVARCHAR (255) NULL,
    [BOTYear]                 NVARCHAR (255) NULL,
    [BOTClassAfter]           NVARCHAR (255) NULL,
    [BOT1]                    NVARCHAR (255) NULL,
    [BOTYear1]                NVARCHAR (255) NULL,
    [BOTClass1]               NVARCHAR (255) NULL,
    [CDR]                     NVARCHAR (255) NULL,
    [CDRYear]                 NVARCHAR (255) NULL,
    [CDRClass]                NVARCHAR (255) NULL,
    [CM_Dep]                  NVARCHAR (255) NULL,
    [DEPTFLAG]                FLOAT          NULL,
    [DEPTTRAN]                FLOAT          NULL,
    [DepTranT]                NVARCHAR (255) NULL,
    [DepTranE]                NVARCHAR (255) NULL,
    [AO_SME1]                 FLOAT          NULL,
    [AO_SME2]                 NVARCHAR (255) NULL,
    [CM_ID]                   FLOAT          NULL,
    [CM_FIRSTNAME]            NVARCHAR (255) NULL,
    [HEAD_FIRSTNAME]          NVARCHAR (255) NULL,
    [MANAGER_FIRSTNAME]       NVARCHAR (255) NULL,
    [CM Adj ID from AO SME]   NVARCHAR (255) NULL,
    [CM Adj Name from AO SME] NVARCHAR (255) NULL,
    [CCR]                     NVARCHAR (255) NULL,
    [DD]                      NVARCHAR (255) NULL,
    [sugar]                   NVARCHAR (255) NULL,
    [Last Owner]              NVARCHAR (255) NULL
);
