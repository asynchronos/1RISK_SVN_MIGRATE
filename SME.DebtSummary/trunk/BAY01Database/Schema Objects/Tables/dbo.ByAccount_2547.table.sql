﻿CREATE TABLE [dbo].[ByAccount_2547] (
    [Cif]        INT           NULL,
    [YM]         INT           NULL,
    [Branch]     SMALLINT      NULL,
    [ACCGL]      INT           NULL,
    [ACCNO]      NVARCHAR (16) NULL,
    [CONTNO]     NVARCHAR (13) NULL,
    [SEQNO]      INT           NULL,
    [CLADJ]      NVARCHAR (1)  NULL,
    [Principal]  MONEY         NULL,
    [Accru]      MONEY         NULL,
    [Susp]       MONEY         NULL,
    [UNCLEAPRIN] MONEY         NULL,
    [UNCLEAINT]  MONEY         NULL,
    [Pay_PRIN]   MONEY         NULL,
    [Pay_INT]    MONEY         NULL,
    [Pay_SUSP]   MONEY         NULL,
    [Post_PRIN]  MONEY         NULL,
    [Post_INT]   MONEY         NULL,
    [Post_SUSP]  MONEY         NULL,
    [Rev_Accru]  MONEY         NULL,
    [Yield]      MONEY         NULL,
    [APP_ID]     NVARCHAR (3)  NULL
);

