CREATE TABLE [dbo].[TEMP_CLASS_HISTORY] (
    [CIF]       INT             NOT NULL,
    [AS_OF]     DATETIME        NOT NULL,
    [YM]        INT             NOT NULL,
    [CLASS]     NVARCHAR (1)    NULL,
    [PRINCIPAL] NUMERIC (20, 2) NULL
);

