CREATE TABLE [dbo].[CIF_NOT_IN_CUSTOMER_SME] (
    [CIF]           INT           NOT NULL,
    [CM_CODE]       NVARCHAR (10) NULL,
    [CM_LEVEL_SIZE] VARCHAR (5)   NULL,
    [ID]            NVARCHAR (10) NOT NULL,
    [PROCESS_GROUP] CHAR (1)      NULL,
    [JOB_TYPE_ID]   NVARCHAR (2)  NULL,
    [NEW_SME]       CHAR (1)      NULL
);

