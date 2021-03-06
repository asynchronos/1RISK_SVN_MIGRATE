CREATE TABLE [dbo].[Tmp_CUSTOMER] (
    [CIF]        INT             NOT NULL,
    [CUS_TITLE]  NVARCHAR (10)   NULL,
    [CUS_FIRST]  NVARCHAR (30)   NULL,
    [CUS_LAST]   NVARCHAR (30)   NULL,
    [CUS1_TITLE] NVARCHAR (10)   NULL,
    [CUS1_FIRST] NVARCHAR (30)   NULL,
    [CUS1_LAST]  NVARCHAR (30)   NULL,
    [CUS2_TITLE] NVARCHAR (10)   NULL,
    [CUS2_FIRST] NVARCHAR (30)   NULL,
    [CUS2_LAST]  NVARCHAR (30)   NULL,
    [CUS3_TITLE] NVARCHAR (10)   NULL,
    [CUS3_FIRST] NVARCHAR (30)   NULL,
    [CUS3_LAST]  NVARCHAR (30)   NULL,
    [CTITLE_E]   NVARCHAR (15)   NULL,
    [CFIRST_E]   NVARCHAR (40)   NULL,
    [CLAST_E]    NVARCHAR (40)   NULL,
    [CifType]    NVARCHAR (1)    NULL,
    [BOTID]      INT             NULL,
    [MAIN_CUST]  INT             NULL,
    [GROUP_CUST] NVARCHAR (1)    NULL,
    [GROUPCIF]   INT             NULL,
    [BAYDATE]    DATETIME        NULL,
    [TYP_RATE]   NCHAR (1)       NULL,
    [BAYRATING]  NVARCHAR (2)    NULL,
    [RATING]     NVARCHAR (5)    NULL,
    [ADDR1]      NVARCHAR (110)  NULL,
    [ADDR2]      NVARCHAR (70)   NULL,
    [PROV]       NVARCHAR (2)    NULL,
    [PROV_DESC]  NVARCHAR (20)   NULL,
    [ZIPCODE]    INT             NULL,
    [TEL_HOME]   NVARCHAR (20)   NULL,
    [ADDRWORK1]  NVARCHAR (110)  NULL,
    [ADDRWORK2]  NVARCHAR (70)   NULL,
    [PROVSHOP]   NVARCHAR (2)    NULL,
    [PROVSHOP_D] NVARCHAR (20)   NULL,
    [ZIPSHOP]    INT             NULL,
    [TEL_OFF]    NVARCHAR (20)   NULL,
    [TAX_NO]     NVARCHAR (10)   NULL,
    [CUS_TYPE]   NVARCHAR (4)    NULL,
    [BUSI_TYPE]  NVARCHAR (6)    NULL,
    [NETFAS]     MONEY           NULL,
    [AUTHOCAP]   MONEY           NULL,
    [PAIDUP]     MONEY           NULL,
    [LANDVAL]    MONEY           NULL,
    [CLASS]      NVARCHAR (1)    NULL,
    [IDCARD]     NVARCHAR (13)   NULL,
    [CITIZEN]    INT             NULL,
    [OFFICR_ID]  BIGINT          NULL,
    [DATEFAS]    DATETIME        NULL,
    [BEINGCUST]  DATETIME        NULL,
    [BTHDATE]    DATETIME        NULL,
    [DEPTFLAGH]  TINYINT         NULL,
    [DEPTHIST]   INT             NULL,
    [DEPTFLAG]   TINYINT         NULL,
    [DEPTTRAN]   INT             NULL,
    [CIF0]       INT             NULL,
    [CIF1]       INT             NULL,
    [CIF2]       INT             NULL,
    [CIF3]       INT             NULL,
    [CIF4]       INT             NULL,
    [CIF5]       INT             NULL,
    [CIF6]       INT             NULL,
    [CIF7]       INT             NULL,
    [CIF8]       INT             NULL,
    [CIF9]       INT             NULL,
    [TDR_AGING]  NUMERIC (12, 2) NULL,
    [TDR_DATE]   DATETIME        NULL,
    [AO_SME]     NUMERIC (10)    NULL,
    [CIFSUGAR]   NUMERIC (10)    NULL,
    [REV_CLASS]  NCHAR (1)       NULL,
    [BOT_CLASS]  NCHAR (1)       NULL,
    [ACC_CLASS]  NCHAR (1)       NULL,
    [STOPACCRU]  NCHAR (1)       NULL,
    [SEX]        CHAR (1)        NULL,
    [CARDTYPE]   NVARCHAR (10)   NULL,
    [CARDNO]     NVARCHAR (10)   NULL
);

