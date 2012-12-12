CREATE TABLE [dbo].[TEMP_R_APPROVE_1] (
    [CIF]               INT             NULL,
    [CUSTOMER_NAME]     CHAR (50)       NOT NULL,
    [principal]         DECIMAL (16, 2) NOT NULL,
    [BaySize]           CHAR (30)       NOT NULL,
    [CA_NO_ID]          NVARCHAR (9)    NOT NULL,
    [SUBJECT_GROUP]     VARCHAR (8)     NULL,
    [LAST_PROCESS_BY]   NVARCHAR (120)  NULL,
    [APPROVE_DATE]      DATETIME        NULL,
    [EMP_APPROVE1_NAME] NVARCHAR (120)  NULL,
    [EMP_APPROVE2_NAME] NVARCHAR (120)  NULL,
    [CM_CODE]           NVARCHAR (10)   NULL,
    [CM_NAME]           NVARCHAR (121)  NULL,
    [MIS_SIZE]          NVARCHAR (50)   NULL
);

