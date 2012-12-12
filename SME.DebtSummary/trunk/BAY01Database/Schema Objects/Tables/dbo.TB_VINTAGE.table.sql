﻿CREATE TABLE [dbo].[TB_VINTAGE] (
    [CIF]                INT            NOT NULL,
    [CUSTOMER_NAME]      NVARCHAR (120) NULL,
    [CM_CODE]            NVARCHAR (10)  NULL,
    [CM_NAME]            NVARCHAR (121) NOT NULL,
    [BRANCH_ID]          SMALLINT       NULL,
    [BRANCH_NAME]        NVARCHAR (100) NULL,
    [Id_Region]          SMALLINT       NULL,
    [Region_Name]        NVARCHAR (30)  NULL,
    [GROUP_SIZE_ID]      SMALLINT       NOT NULL,
    [GROUP_SIZE_DETAIL]  NVARCHAR (255) NULL,
    [JUDGEMENT_ID]       NVARCHAR (5)   NOT NULL,
    [JUDGEMENT_DETAIL]   NVARCHAR (50)  NULL,
    [BUSI_RISK1_ID]      VARCHAR (8)    NULL,
    [BUSI_RISK1_DETAIL]  NVARCHAR (255) NULL,
    [STATUS_ID]          INT            NOT NULL,
    [STATUS_DETAIL]      NVARCHAR (50)  NULL,
    [SIZE_ID]            INT            NOT NULL,
    [SIZE_DETAIL]        NVARCHAR (50)  NULL,
    [ByCustomer_ASOF]    SMALLDATETIME  NULL,
    [Class]              NVARCHAR (1)   NULL,
    [Principal]          MONEY          NULL,
    [OLD_ID]             NVARCHAR (10)  NULL,
    [CA_NO_ID]           NVARCHAR (9)   NULL,
    [CA_CREATE_DATE]     DATETIME       NULL,
    [APPROVE_VALUEs]     MONEY          NULL,
    [APPROVE_DATE]       DATETIME       NULL,
    [Reason]             NVARCHAR (MAX) NULL,
    [LAST_PROCESS_ID]    NVARCHAR (4)   NULL,
    [LAST_PROCESS]       NVARCHAR (200) NULL,
    [LAST_PROCESS_GROUP] CHAR (1)       NULL,
    [LAST_PROCESS_DATE]  DATETIME       NULL,
    [LP_END_OF_MONTH]    DATETIME       NULL,
    [LP_YM]              VARCHAR (6)    NULL,
    [EMP_ID]             NVARCHAR (10)  NULL,
    [EMPNAME]            NVARCHAR (120) NULL,
    [LEVEL_ID]           NVARCHAR (20)  NULL,
    [LEVEL_NAME]         NVARCHAR (255) NULL,
    [NEW_CUS]            VARCHAR (3)    NULL,
    [SUBJECT_GROUP]      VARCHAR (8)    NULL,
    [RECIVER]            NVARCHAR (MAX) NULL,
    [Send_To_Board]      NVARCHAR (2)   NULL,
    [Authority]          NVARCHAR (255) NULL,
    [EMP_REQUEST_ID]     NVARCHAR (10)  NULL,
    [EMP_REQUEST_NAME]   NVARCHAR (120) NULL,
    [EMP_APPROVE_ID]     NVARCHAR (10)  NULL,
    [EMP_APPROVE1_NAME]  NVARCHAR (120) NULL,
    [EMP_APPROVE2_ID]    NVARCHAR (10)  NULL,
    [EMP_APPROVE2_NAME]  NVARCHAR (120) NULL,
    [EMP_APPROVE3_ID]    NVARCHAR (10)  NULL,
    [EMP_APPROVE3_NAME]  NVARCHAR (120) NULL,
    [EMP_APPROVE4_ID]    NVARCHAR (10)  NULL,
    [EMP_APPROVE4_NAME]  NVARCHAR (120) NULL,
    [EMP_APPR_ID]        NVARCHAR (10)  NULL,
    [EMP_APPR_NAME]      NVARCHAR (120) NULL
);

