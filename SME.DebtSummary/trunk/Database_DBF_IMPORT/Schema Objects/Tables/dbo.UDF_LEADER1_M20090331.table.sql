﻿CREATE TABLE [dbo].[UDF_LEADER1_M20090331] (
    [AS_OF_DATE]         DATETIME        NULL,
    [DECB_RD]            NVARCHAR (50)   NULL,
    [CIF]                NUMERIC (19)    NULL,
    [SUBJECT_IDEN]       NUMERIC (9)     NULL,
    [CA_NO_ID]           NUMERIC (9)     NULL,
    [REFERENCE]          NVARCHAR (100)  NULL,
    [APP_PRODUCT_CODE]   NVARCHAR (4)    NULL,
    [APP_PROJECT_CODE]   NVARCHAR (4)    NULL,
    [DATE_IN_ANNALS]     DATETIME        NULL,
    [ANNALS_CREATE_DATE] DATETIME        NULL,
    [APP_DATE_APPROVE]   DATETIME        NULL,
    [APP_DATE_REJECT]    DATETIME        NULL,
    [APP_REJECT_REASON]  NVARCHAR (200)  NULL,
    [APP_STATUS_CURRENT] NVARCHAR (200)  NULL,
    [SUBJECT_DETAIL_ID]  NVARCHAR (5)    NULL,
    [SUBJECT_DETAIL]     NVARCHAR (100)  NULL,
    [VALUE_CUSTOMER]     NUMERIC (16, 2) NULL,
    [VALUE_APPROVE]      NUMERIC (16, 2) NULL,
    [ACC_NO]             NVARCHAR (20)   NULL,
    [EMP_ID]             NVARCHAR (10)   NULL,
    [LEVEL_NAME]         NVARCHAR (255)  NULL,
    [CRM_REF_CODE]       NVARCHAR (15)   NULL
);
