CREATE TABLE [dbo].[upload_file_bak_20110905] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [USER_ID]          NVARCHAR (10)  NULL,
    [FILE_TYPE]        INT            NULL,
    [REMARK]           NVARCHAR (50)  NULL,
    [COLL_ID]          NVARCHAR (10)  NULL,
    [ANNALS_ID]        NVARCHAR (10)  NULL,
    [PATH]             NVARCHAR (100) NULL,
    [CREATE_DATE]      DATETIME       NULL,
    [BeginCREATE_DATE] DATETIME       NULL
);

