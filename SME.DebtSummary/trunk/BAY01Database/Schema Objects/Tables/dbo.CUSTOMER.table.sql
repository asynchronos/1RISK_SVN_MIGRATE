CREATE TABLE [dbo].[CUSTOMER] (
    [CIF]        INT            NOT NULL,
    [CUS_TITLE]  NVARCHAR (10)  NULL,
    [CUS_FIRST]  NVARCHAR (30)  NULL,
    [CUS_LAST]   NVARCHAR (30)  NULL,
    [CUS1_TITLE] NVARCHAR (10)  NULL,
    [CUS1_FIRST] NVARCHAR (30)  NULL,
    [CUS1_LAST]  NVARCHAR (30)  NULL,
    [CUS2_TITLE] NVARCHAR (10)  NULL,
    [CUS2_FIRST] NVARCHAR (30)  NULL,
    [CUS2_LAST]  NVARCHAR (30)  NULL,
    [CUS3_TITLE] NVARCHAR (10)  NULL,
    [CUS3_FIRST] NVARCHAR (30)  NULL,
    [CUS3_LAST]  NVARCHAR (30)  NULL,
    [CTITLE_E]   NVARCHAR (15)  NULL,
    [CFIRST_E]   NVARCHAR (40)  NULL,
    [CLAST_E]    NVARCHAR (40)  NULL,
    [CifType]    NVARCHAR (1)   NULL,
    [BOTID]      INT            NULL,
    [MAIN_CUST]  INT            NULL,
    [GROUP_CUST] NVARCHAR (1)   NULL,
    [GROUPCIF]   INT            NULL,
    [BAYRATING]  NVARCHAR (2)   NULL,
    [RATING]     NVARCHAR (5)   NULL,
    [ADDR1]      NVARCHAR (110) NULL,
    [ADDR2]      NVARCHAR (70)  NULL,
    [PROV]       NVARCHAR (2)   NULL,
    [ZIPCODE]    INT            NULL,
    [TEL_HOME]   NVARCHAR (20)  NULL,
    [TEL_OFF]    NVARCHAR (20)  NULL,
    [TAX_NO]     NVARCHAR (10)  NULL,
    [CUS_TYPE]   NVARCHAR (4)   NULL,
    [BUSI_TYPE]  NVARCHAR (6)   NULL,
    [CLASS]      NVARCHAR (1)   NULL,
    [IDCARD]     NVARCHAR (13)  NULL,
    [OFFICR_ID]  BIGINT         NULL,
    [DATEFAS]    DATETIME       NULL,
    [BEINGCUST]  DATETIME       NULL,
    [BTHDATE]    DATETIME       NULL,
    [DEPTFLAG]   TINYINT        NULL,
    [DEPTTRAN]   INT            NULL,
    [CIF0]       INT            NULL,
    [CIF1]       INT            NULL,
    [CIF2]       INT            NULL,
    [PROVSHOP]   NVARCHAR (2)   NULL,
    [SEX]        CHAR (1)       NULL,
    [ADDRWORK1]  NVARCHAR (110) NULL,
    [ADDRWORK2]  NVARCHAR (70)  NULL,
    [ZIPSHOP]    INT            NULL,
    [CARDTYPE]   NVARCHAR (10)  NULL,
    [CARDNO]     NVARCHAR (10)  NULL
);

