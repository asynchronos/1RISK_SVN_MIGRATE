CREATE TABLE [dbo].[NCB_RESPONSE] (
    [ID]            INT            NULL,
    [ID_No]         NVARCHAR (20)  NULL,
    [ID_Type]       NVARCHAR (5)   NULL,
    [Customer_Name] NVARCHAR (100) NULL,
    [CIF_No]        INT            NULL,
    [Dept_Br_Code]  NVARCHAR (10)  NULL,
    [Request_Date]  DATETIME       NULL,
    [Response_Date] DATETIME       NULL
);

