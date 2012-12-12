﻿CREATE TABLE [dbo].[Temp_Report_LciDaily] (
    [Last_Date_In]     DATETIME        NULL,
    [PROCESS]          NVARCHAR (200)  NULL,
    [judgement_detail] NVARCHAR (50)   NULL,
    [cm_code]          NVARCHAR (10)   NULL,
    [cm_name]          NVARCHAR (121)  NULL,
    [level_name]       NVARCHAR (255)  NULL,
    [controlling_unit] NVARCHAR (70)   NULL,
    [>3 in 6 Month]    INT             NULL,
    [cif]              INT             NULL,
    [cif_name]         NVARCHAR (100)  NULL,
    [app_id]           NVARCHAR (100)  NULL,
    [accgl]            INT             NULL,
    [prod_type]        NVARCHAR (100)  NULL,
    [aging]            DECIMAL (18, 2) NULL,
    [aging_h]          VARCHAR (24)    NULL,
    [class_h]          VARCHAR (24)    NULL,
    [bran]             INT             NULL,
    [accno]            NVARCHAR (100)  NULL,
    [contno]           NVARCHAR (100)  NULL,
    [seqno]            INT             NULL,
    [limit]            DECIMAL (18, 2) NULL,
    [principal]        DECIMAL (18, 2) NULL,
    [unearnprin]       DECIMAL (18, 2) NULL,
    [accru]            DECIMAL (18, 2) NULL,
    [unearnint]        DECIMAL (18, 2) NULL,
    [susp]             DECIMAL (18, 2) NULL,
    [grp_size]         VARCHAR (30)    NULL,
    [busi_type]        NUMERIC (8)     NULL,
    [busi_desc]        VARCHAR (35)    NULL
);
