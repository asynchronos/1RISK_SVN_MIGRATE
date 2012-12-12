CREATE TABLE [dbo].[ANNALS_CREDIT_ACCOUNT] (
    [IDEN]              INT           IDENTITY (1, 1) NOT NULL,
    [ID]                NVARCHAR (10) NOT NULL,
    [CIF]               INT           NULL,
    [ACCNO]             NVARCHAR (20) NULL,
    [NBRTHAI]           NVARCHAR (50) NULL,
    [DECB_RD_ID]        NVARCHAR (10) NULL,
    [SUMLIMIT]          MONEY         NULL,
    [SUMPRIN]           MONEY         NULL,
    [SUMACCRU]          MONEY         NULL,
    [SUMSUSP]           MONEY         NULL,
    [SUMAGING]          MONEY         NULL,
    [SUBJECT_DETAIL_ID] NVARCHAR (5)  NULL,
    [Value_Customer]    MONEY         NULL,
    [VALUE_OLD]         MONEY         NULL,
    [VALUE]             MONEY         NULL,
    [VALUE_APPROVE]     MONEY         NULL,
    [Others]            TEXT          NULL,
    [PRODUCT_CODE]      NVARCHAR (4)  NULL,
    [PROJECT_CODE]      NVARCHAR (4)  NULL,
    [PROPOSAL_ID]       NVARCHAR (2)  NULL,
    [RM_ID]             NVARCHAR (10) NULL
);

