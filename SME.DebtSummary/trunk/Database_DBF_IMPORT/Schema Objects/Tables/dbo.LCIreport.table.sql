CREATE TABLE [dbo].[LCIreport] (
    [dasof]      NVARCHAR (12)   NULL,
    [cif]        INT             NULL,
    [cif_name]   NVARCHAR (100)  NULL,
    [app_id]     NVARCHAR (100)  NULL,
    [accgl]      INT             NULL,
    [prod_type]  NVARCHAR (100)  NULL,
    [aging]      DECIMAL (18, 2) NULL,
    [bran]       INT             NULL,
    [accno]      NVARCHAR (100)  NULL,
    [contno]     NVARCHAR (100)  NULL,
    [seqno]      INT             NULL,
    [limit]      DECIMAL (18, 2) NULL,
    [principal]  DECIMAL (18, 2) NULL,
    [unearnprin] DECIMAL (18, 2) NULL,
    [accru]      DECIMAL (18, 2) NULL,
    [unearnint]  DECIMAL (18, 2) NULL,
    [susp]       DECIMAL (18, 2) NULL
);

