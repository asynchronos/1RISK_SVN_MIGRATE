CREATE TABLE [dbo].[cif_back1] (
    [CIF]               NVARCHAR (10)  NOT NULL,
    [CUSTOMER_NAME]     NVARCHAR (255) NULL,
    [GROUP_ID]          INT            NULL,
    [CM_CODE]           NVARCHAR (255) NULL,
    [CM_NAME]           NVARCHAR (255) NULL,
    [OLD_CM_CODE]       NVARCHAR (255) NULL,
    [OLD_CM_NAME]       NVARCHAR (255) NULL,
    [BRANCH_ID]         INT            NULL,
    [BRANCH_NAME]       NVARCHAR (255) NULL,
    [Id_Region]         INT            NULL,
    [Region_Name]       NVARCHAR (255) NULL,
    [GROUP_SIZE_ID]     INT            NULL,
    [GROUP_SIZE_DETAIL] NVARCHAR (255) NULL,
    [A]                 BIT            NULL,
    [AP]                BIT            NULL,
    [P]                 BIT            NULL,
    [C]                 BIT            NULL,
    [Balance_Sheet_CIF] NVARCHAR (2)   NULL,
    [CIF_Balance_Sheet] NVARCHAR (10)  NULL,
    [Remark]            NVARCHAR (255) NULL,
    [Update_Date]       DATETIME       NULL
);

