CREATE TABLE [dbo].[BUSI_TYPE2] (
    [TYPE2_ID]         INT            NOT NULL,
    [TYPE2_DETAIL]     NVARCHAR (255) NOT NULL,
    [TYPE2_DETAIL_ENG] NVARCHAR (255) NULL,
    [PRIORITY]         INT            NOT NULL,
    [TYPE1_ID]         INT            NOT NULL,
    [UPDATE_BY]        NVARCHAR (10)  NOT NULL,
    [UPDATE_DATE]      DATETIME       NOT NULL
);

