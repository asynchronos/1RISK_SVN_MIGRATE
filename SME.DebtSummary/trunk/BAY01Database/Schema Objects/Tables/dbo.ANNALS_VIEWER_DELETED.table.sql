CREATE TABLE [dbo].[ANNALS_VIEWER_DELETED] (
    [ANNALS_TYPE]   NVARCHAR (1)  NOT NULL,
    [ANNALS_SEQ_NO] NVARCHAR (5)  NOT NULL,
    [ANNALS_YEAR]   NVARCHAR (4)  NOT NULL,
    [EMP_ID]        NVARCHAR (10) NOT NULL,
    [DELETE_DATE]   DATETIME      NOT NULL,
    [CREATE_DATE]   DATETIME      NOT NULL
);

