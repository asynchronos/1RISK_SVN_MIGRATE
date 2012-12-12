﻿CREATE TABLE [dbo].[TEMP_REPORT_PRODUCT_CUS] (
    [ID]                NVARCHAR (10)  NOT NULL,
    [APP-DATE]          DATETIME       NULL,
    [REG-DATE]          DATETIME       NULL,
    [CIF]               INT            NULL,
    [Project_Name]      NVARCHAR (50)  NULL,
    [ACCNO]             NVARCHAR (20)  NULL,
    [Value_Customer]    NVARCHAR (20)  NULL,
    [VALUE_OLD]         NVARCHAR (20)  NULL,
    [VALUE]             NVARCHAR (20)  NULL,
    [VALUE_APPROVE]     NVARCHAR (20)  NULL,
    [Others]            TEXT           NULL,
    [SUBJECT_DETAIL_ID] NVARCHAR (5)   NULL,
    [SUBJECT_DETAIL]    NVARCHAR (100) NULL,
    [DECB_RD]           NVARCHAR (50)  NULL,
    [DECB_RD_ID]        NVARCHAR (10)  NULL,
    [PRODUCT_CODE]      NVARCHAR (4)   NULL,
    [PROJECT_CODE]      NVARCHAR (4)   NULL,
    [PROPOSAL_ID]       NVARCHAR (2)   NULL,
    [PROPOSAL_NAME]     NVARCHAR (50)  NULL,
    [CUSTOMER_NAME]     NVARCHAR (120) NULL,
    [GROUP_ID]          INT            NULL,
    [CM_CODE]           NVARCHAR (10)  NULL,
    [CM_NAME]           NVARCHAR (120) NULL,
    [BRANCH_ID]         SMALLINT       NULL,
    [BRANCH_NAME]       NVARCHAR (100) NULL,
    [Id_Region]         SMALLINT       NULL,
    [Region_Name]       NVARCHAR (30)  NULL,
    [GROUP_SIZE_ID]     SMALLINT       NULL,
    [GROUP_SIZE_DETAIL] NVARCHAR (255) NULL,
    [JUDGEMENT_ID]      NVARCHAR (5)   NULL,
    [JUDGEMENT_DETAIL]  NVARCHAR (50)  NULL,
    [SIZE_ID]           INT            NULL,
    [SIZE_DETAIL]       NVARCHAR (50)  NULL,
    [PROCESS_GROUP]     CHAR (1)       NULL,
    [EMP-ID]            NVARCHAR (10)  NULL,
    [EMPLOYEE]          VARCHAR (121)  NULL,
    [REGION-ID]         NVARCHAR (10)  NULL,
    [REVIEW]            INT            NOT NULL,
    [EXCEPTION]         INT            NOT NULL,
    [APPROVE]           INT            NOT NULL,
    [EMP_APPROVE]       VARCHAR (121)  NULL,
    [EMP_APPROVE2]      VARCHAR (121)  NULL,
    [EMP_REQUEST]       VARCHAR (121)  NULL,
    [LEVEL_NAME]        NVARCHAR (100) NULL,
    [PROCESS_HEAD]      NVARCHAR (100) NULL,
    [REASON_REMARK]     NVARCHAR (MAX) NULL,
    [RESULT_REMARK]     NVARCHAR (MAX) NULL,
    [Send_To_Board]     NVARCHAR (2)   NULL,
    [Authority]         NVARCHAR (255) NULL
);
