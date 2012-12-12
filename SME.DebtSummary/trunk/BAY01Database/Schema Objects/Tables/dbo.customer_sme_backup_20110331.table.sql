CREATE TABLE [dbo].[customer_sme_backup_20110331] (
    [CIF]                     INT           NOT NULL,
    [GROUP_ID]                INT           NULL,
    [CM_CODE]                 NVARCHAR (10) NULL,
    [OLD_CM_CODE]             NVARCHAR (10) NULL,
    [BRANCH_ID]               SMALLINT      NULL,
    [JUDGEMENT_ID]            NVARCHAR (5)  NULL,
    [BUSI_RISK1_ID]           VARCHAR (8)   NULL,
    [BUSI_RISK2_ID]           VARCHAR (8)   NULL,
    [BUSI_RISK3_ID]           VARCHAR (8)   NULL,
    [BUSINESS_DESTINATION_ID] NUMERIC (3)   NULL,
    [EXPORT_WEIGHT]           NUMERIC (3)   NULL,
    [LOCAL_WEIGHT]            NUMERIC (3)   NULL,
    [STATUS_ID]               INT           NULL,
    [SIZE_ID]                 INT           NULL,
    [UPDATE_DATE]             DATETIME      NOT NULL,
    [UPDATE_BY]               NVARCHAR (10) NULL,
    [RATING_TYPE_KEY]         INT           NULL,
    [RATING_KEY]              INT           NULL,
    [RATING_UPDATE_DATE]      DATETIME      NULL
);

