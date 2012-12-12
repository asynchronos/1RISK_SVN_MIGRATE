CREATE TABLE [dbo].[TEMP_TB_CLS_MAPPING_BY_IDEN] (
    [CA_ID]          INT             NULL,
    [CIF]            INT             NULL,
    [SUBJECT_IDEN]   INT             NOT NULL,
    [APPROVE_VALUES] DECIMAL (20, 2) NULL,
    [APPROVE_DATE]   DATETIME        NULL,
    [MAPPING_STATUS] NVARCHAR (1)    NULL,
    [MAPPED_DATE]    DATETIME        NULL
);

