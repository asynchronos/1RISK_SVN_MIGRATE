CREATE TABLE [CLASSIFY].[CATEGORY] (
    [CATEGORY_KEY]      INT            IDENTITY (1, 1) NOT NULL,
    [CATEGORY_DESC]     VARCHAR (100)  NULL,
    [CATEGORY_DESC_TH]  NVARCHAR (100) NULL,
    [CATEGORY_VALUE]    NVARCHAR (20)  NULL,
    [CATEGORY_TYPE_KEY] INT            NULL,
    [PRIORITY]          INT            NULL,
    [DEL_FLAG]          BIT            NULL
);

