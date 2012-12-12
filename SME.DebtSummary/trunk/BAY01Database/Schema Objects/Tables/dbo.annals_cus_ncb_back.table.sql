CREATE TABLE [dbo].[annals_cus_ncb_back] (
    [ID]                     NVARCHAR (10)  NULL,
    [CIF]                    INT            NULL,
    [CUS_NCB_TYPE_ID]        NVARCHAR (1)   NULL,
    [CUS_NCB_DATE]           DATETIME       NULL,
    [CUS_NCB_TYPE_DETAIL_ID] INT            NULL,
    [DETAIL]                 NVARCHAR (500) NULL,
    [DEPT_ID]                INT            NULL,
    [CUS_TYPE_ID]            INT            NULL,
    [AUTH_1_ID]              NVARCHAR (10)  NULL,
    [AUTH_2_ID]              NVARCHAR (10)  NULL
);

