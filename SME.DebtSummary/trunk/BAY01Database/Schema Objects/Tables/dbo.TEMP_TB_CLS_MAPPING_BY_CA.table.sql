CREATE TABLE [dbo].[TEMP_TB_CLS_MAPPING_BY_CA] (
    [CA_ID]              INT             NOT NULL,
    [COUNT_CIFS]         INT             NULL,
    [COUNT_SUBJECTS]     INT             NULL,
    [SUM_APPROVE_VALUES] DECIMAL (20, 2) NULL,
    [APPROVE_DATE]       DATETIME        NULL,
    [STATUS]             NVARCHAR (20)   NULL
);

