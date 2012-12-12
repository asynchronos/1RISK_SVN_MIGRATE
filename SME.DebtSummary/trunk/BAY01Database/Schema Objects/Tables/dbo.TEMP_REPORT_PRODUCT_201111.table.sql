﻿CREATE TABLE [dbo].[TEMP_REPORT_PRODUCT_201111] (
    [ID]               NVARCHAR (10)   NOT NULL,
    [REG-DATE]         DATETIME        NULL,
    [APP-DATE]         DATETIME        NULL,
    [CIF]              INT             NULL,
    [CUSTOMER]         NVARCHAR (72)   NULL,
    [EMP-ID]           NVARCHAR (10)   NULL,
    [EMPLOYEE]         VARCHAR (121)   NULL,
    [BRANCH-ID]        NVARCHAR (10)   NULL,
    [BRANCH-NAME]      NVARCHAR (100)  NULL,
    [REGION-ID]        NVARCHAR (10)   NULL,
    [REGION-NAME]      NVARCHAR (30)   NULL,
    [NEW]              INT             NOT NULL,
    [OLD]              INT             NOT NULL,
    [REVIEW]           INT             NOT NULL,
    [EXCEPTION]        INT             NOT NULL,
    [APPROVE]          INT             NOT NULL,
    [O-D]              MONEY           NULL,
    [(O-D)]            MONEY           NULL,
    [F-L]              MONEY           NULL,
    [(F-L)]            MONEY           NULL,
    [L-G]              MONEY           NULL,
    [(L-G)]            MONEY           NULL,
    [STL-PN]           MONEY           NULL,
    [(STL-PN)]         MONEY           NULL,
    [TRADE-FIN]        MONEY           NULL,
    [(TRADE-FIN)]      MONEY           NULL,
    [OTHERS]           MONEY           NULL,
    [(OTHERS)]         MONEY           NULL,
    [SUM-INCREASE]     MONEY           NULL,
    [SUM-DECREASE]     MONEY           NULL,
    [NET]              MONEY           NULL,
    [SUM-RM_VALUE]     MONEY           NULL,
    [PROCESS_HEAD]     NVARCHAR (100)  NULL,
    [PROCESS_GROUP]    CHAR (1)        NULL,
    [PROCESS]          NVARCHAR (200)  NULL,
    [TTY]              NUMERIC (18, 7) NULL,
    [PAT]              NUMERIC (18, 7) NULL,
    [APP-TYPE]         VARCHAR (30)    NOT NULL,
    [LEVEL_NAME]       NVARCHAR (100)  NULL,
    [Job_Type]         NVARCHAR (50)   NULL,
    [Authority]        NVARCHAR (255)  NULL,
    [REFERRAL_NO]      NVARCHAR (11)   NULL,
    [REFERENCE]        NVARCHAR (100)  NULL,
    [Board]            NVARCHAR (100)  NULL,
    [LEVEL_PROCESS_ID] NVARCHAR (20)   NULL,
    [BUSINESS_ID]      NVARCHAR (6)    NULL,
    [BUSINESS_TYPE]    NVARCHAR (255)  NULL,
    [Customer_Size]    NVARCHAR (2)    NULL,
    [SIZE_DETAIL]      NVARCHAR (50)   NULL,
    [REASON_REMARK]    NVARCHAR (MAX)  NULL,
    [RESULT_REMARK]    NVARCHAR (MAX)  NULL,
    [EMP_APPROVE]      VARCHAR (121)   NULL,
    [EMP_APPROVE2]     VARCHAR (121)   NULL,
    [EMP_APPROVE3]     VARCHAR (121)   NULL,
    [EMP_APPROVE4]     VARCHAR (121)   NULL,
    [EMP_REQUEST]      VARCHAR (121)   NULL,
    [LIM_AMT]          DECIMAL (15, 2) NULL,
    [Send_To_Board]    NVARCHAR (2)    NULL,
    [PROCESS_ID]       NVARCHAR (4)    NULL,
    [EMP_APPROVE_ID]   NVARCHAR (10)   NULL,
    [EMP_APPROVE2_ID]  NVARCHAR (10)   NULL,
    [EMP_APPROVE3_ID]  NVARCHAR (10)   NULL,
    [EMP_APPROVE4_ID]  NVARCHAR (10)   NULL,
    [EMP_REQUEST_ID]   NVARCHAR (10)   NULL,
    [OUT_OF_SCOPE_ID]  NVARCHAR (1)    NULL,
    [OUT_OF_SCOPE]     NVARCHAR (50)   NULL,
    [GROUP_EXPOSURE]   MONEY           NULL,
    [REVIEW_DATE]      DATETIME        NULL
);
