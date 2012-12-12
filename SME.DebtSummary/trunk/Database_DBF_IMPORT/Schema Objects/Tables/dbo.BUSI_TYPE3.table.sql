CREATE TABLE [dbo].[BUSI_TYPE3] (
    [TYPE3_ID]         INT            NOT NULL,
    [TYPE3_DETAIL]     NVARCHAR (255) NOT NULL,
    [TYPE3_DETAIL_ENG] NVARCHAR (255) NULL,
    [GRADE]            VARCHAR (1)    NULL,
    [PRIORITY]         INT            NOT NULL,
    [TYPE2_ID]         INT            NOT NULL,
    [CODE_BAY]         INT            NULL,
    [CODE_RESEARCH]    INT            NULL,
    [UPDATE_BY]        NVARCHAR (10)  NOT NULL,
    [UPDATE_DATE]      DATETIME       NOT NULL
);

