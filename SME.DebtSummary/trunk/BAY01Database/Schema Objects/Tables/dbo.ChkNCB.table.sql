﻿CREATE TABLE [dbo].[ChkNCB] (
    [ID_REGIST]  NVARCHAR (50)  NULL,
    [FIRST_NAME] NVARCHAR (50)  NULL,
    [LAST_NAME]  NVARCHAR (50)  NULL,
    [NAME_NCB]   NVARCHAR (80)  NULL,
    [DOB_NCB]    NVARCHAR (20)  NULL,
    [confirm]    NVARCHAR (5)   NULL,
    [CIF]        NUMERIC (18)   NULL,
    [CIFTYPE]    NVARCHAR (1)   NULL,
    [NAME_CIM]   NVARCHAR (80)  NULL,
    [IDCARD]     NVARCHAR (13)  NULL,
    [CARDNO]     NVARCHAR (30)  NULL,
    [CARDTYPE]   NVARCHAR (5)   NULL,
    [BTH_DATE]   DATETIME       NULL,
    [BTH_DATE2]  NVARCHAR (50)  NULL,
    [TAX_NO]     NVARCHAR (10)  NULL,
    [NAME_ALL]   NVARCHAR (80)  NULL,
    [ADDRESS]    NVARCHAR (150) NULL
);

