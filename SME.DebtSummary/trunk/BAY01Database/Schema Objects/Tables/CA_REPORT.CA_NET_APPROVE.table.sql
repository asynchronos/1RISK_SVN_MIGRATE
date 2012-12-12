﻿CREATE TABLE [CA_REPORT].[CA_NET_APPROVE] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [CA_NO_ID]            NVARCHAR (9)   NOT NULL,
    [OLD_ID]              NVARCHAR (10)  NOT NULL,
    [EMP_ID]              NVARCHAR (10)  NOT NULL,
    [EMP_NAME]            NVARCHAR (120) NULL,
    [EMP_RELATION]        VARCHAR (10)   NOT NULL,
    [CA_CREATE_DATE]      DATETIME       NOT NULL,
    [REGIS_DATE]          DATETIME       NULL,
    [REGIS_BY]            NVARCHAR (10)  NULL,
    [REGIS_LEVEL_ID]      NVARCHAR (20)  NULL,
    [REGIS_LEVEL_NAME]    NVARCHAR (255) NULL,
    [REFERENCE]           NVARCHAR (100) NOT NULL,
    [REFERENCE_DATE]      DATETIME       NULL,
    [NET_OLD_VALUE]       MONEY          NULL,
    [NET_RM_VALUE]        MONEY          NULL,
    [NET_CM_VALUE]        MONEY          NULL,
    [NET_APPROVE_VALUE]   MONEY          NULL,
    [CIF]                 INT            NULL,
    [APPROVE_DATE]        DATETIME       NULL,
    [LAST_PROCESS]        NVARCHAR (200) NULL,
    [LAST_PROCESS_ID]     NVARCHAR (4)   NULL,
    [LAST_PROCESS_GROUP]  CHAR (1)       NULL,
    [LAST_PROCESS_DATE]   DATETIME       NULL,
    [LAST_PROCESS_EMP_ID] NVARCHAR (10)  NULL,
    [LEVEL_ID]            NVARCHAR (20)  NULL,
    [LEVEL_NAME]          NVARCHAR (255) NULL,
    [Customer_Size]       NVARCHAR (2)   NULL,
    [SIZE_DETAIL]         NVARCHAR (50)  NULL,
    [Send_To_Board]       NVARCHAR (2)   NULL,
    [Authority]           NVARCHAR (255) NULL,
    [REGION_ID]           NVARCHAR (10)  NULL,
    [Region_Name]         NVARCHAR (30)  NULL,
    [BRANCH_ID]           NVARCHAR (10)  NULL,
    [OLD_REGION_ID]       NVARCHAR (20)  NULL,
    [OLD_REGION]          NVARCHAR (100) NULL
);
