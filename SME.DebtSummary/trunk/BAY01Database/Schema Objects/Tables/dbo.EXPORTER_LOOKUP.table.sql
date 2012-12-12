CREATE TABLE [dbo].[EXPORTER_LOOKUP] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [LOOKUP_TYPE] INT           NOT NULL,
    [DESCRIPTION] NVARCHAR (50) NULL,
    [PRIORITY]    INT           NULL,
    [DEL_FLAG]    BIT           NULL,
    [UPDATE_BY]   NVARCHAR (10) NULL,
    [UPDATE_DATE] DATETIME      NULL
);

