﻿CREATE TABLE [dbo].[TB_KPI_LAST_CREDIT_CA] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [CIF]                  INT            NOT NULL,
    [OLD_ID]               NVARCHAR (10)  NOT NULL,
    [APPROVE_VALUEs]       MONEY          NULL,
    [REASON]               NVARCHAR (MAX) NULL,
    [LAST_PROCESS]         NVARCHAR (200) NULL,
    [LAST_PROCESS_ID]      NVARCHAR (4)   NULL,
    [LAST_PROCESS_GROUP]   CHAR (1)       NULL,
    [LAST_PROCESS_DATE]    DATETIME       NULL,
    [LAST_PROCESS_MONTH]   NVARCHAR (6)   NULL,
    [LAST_PROCESS_BY_ID]   NVARCHAR (10)  NULL,
    [LAST_PROCESS_BY_NAME] NVARCHAR (120) NULL,
    [CA_LEVEL_ID]          NVARCHAR (20)  NULL,
    [LEVEL_NAME]           NVARCHAR (255) NULL,
    [CA_SIZE_ID]           NVARCHAR (2)   NULL,
    [CA_SIZE_DETAIL]       NVARCHAR (50)  NULL,
    [CA_REGION_ID]         NVARCHAR (10)  NULL,
    [CA_REGION_NAME]       NVARCHAR (30)  NULL,
    [SUBJECT_GROUP]        VARCHAR (8)    NULL,
    [NEW_CUS]              VARCHAR (3)    NOT NULL,
    [Send_To_Board]        NVARCHAR (2)   NULL,
    [Authority]            NVARCHAR (255) NULL,
    [EMP_REQUEST_ID]       NVARCHAR (10)  NULL,
    [EMP_REQUEST_NAME]     NVARCHAR (120) NULL,
    [EMP_APPROVE1_ID]      NVARCHAR (10)  NULL,
    [EMP_APPROVE1_NAME]    NVARCHAR (120) NULL,
    [EMP_APPROVE2_ID]      NVARCHAR (10)  NULL,
    [EMP_APPROVE2_NAME]    NVARCHAR (120) NULL,
    [EMP_APPROVE3_ID]      NVARCHAR (10)  NULL,
    [EMP_APPROVE3_NAME]    NVARCHAR (120) NULL,
    [EMP_APPROVE4_ID]      NVARCHAR (10)  NULL,
    [EMP_APPROVE4_NAME]    NVARCHAR (120) NULL,
    [SUB_COMMITTEE_1]      NVARCHAR (10)  NULL,
    [SUB_COMMITTEE_1_NAME] NVARCHAR (120) NULL,
    [SUB_COMMITTEE_2]      NVARCHAR (10)  NULL,
    [SUB_COMMITTEE_2_NAME] NVARCHAR (120) NULL,
    [SUB_COMMITTEE_3]      NVARCHAR (10)  NULL,
    [SUB_COMMITTEE_3_NAME] NVARCHAR (120) NULL,
    [EMP_RELATE_ID]        NVARCHAR (10)  NULL,
    [EMP_RELATE_NAME]      NVARCHAR (120) NULL
);

