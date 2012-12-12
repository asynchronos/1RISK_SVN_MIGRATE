CREATE TABLE [dbo].[BUSI_TYPE1] (
    [TYPE1_ID]         INT            NOT NULL,
    [TYPE1_DETAIL]     NVARCHAR (255) NOT NULL,
    [TYPE1_DETAIL_ENG] NVARCHAR (255) NULL,
    [PRIORITY]         INT            NOT NULL,
    [UPDATE_BY]        NVARCHAR (10)  NOT NULL,
    [UPDATE_DATE]      DATETIME       NOT NULL
);

