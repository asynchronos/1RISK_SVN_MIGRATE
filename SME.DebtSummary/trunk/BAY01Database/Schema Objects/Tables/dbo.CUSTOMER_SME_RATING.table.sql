CREATE TABLE [dbo].[CUSTOMER_SME_RATING] (
    [RATING_KEY]      INT           IDENTITY (1, 1) NOT NULL,
    [RATING_CODE]     NVARCHAR (10) NULL,
    [RATING_TYPE_KEY] INT           NOT NULL,
    [RATING_DESC]     NVARCHAR (50) NULL,
    [PRIORITY]        INT           NULL
);

