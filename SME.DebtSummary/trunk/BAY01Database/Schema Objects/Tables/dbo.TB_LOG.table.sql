CREATE TABLE [dbo].[TB_LOG] (
    [TRANDATE]    DATETIME      NOT NULL,
    [USERNAME]    NVARCHAR (20) NULL,
    [IP]          NVARCHAR (20) NULL,
    [LOG_TYPE_ID] NVARCHAR (2)  NULL,
    [ID]          NVARCHAR (20) NULL
);

