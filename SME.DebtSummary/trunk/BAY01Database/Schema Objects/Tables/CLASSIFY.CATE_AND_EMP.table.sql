CREATE TABLE [CLASSIFY].[CATE_AND_EMP] (
    [ID]            INT          IDENTITY (1, 1) NOT NULL,
    [CATEGORY_KEY]  INT          NOT NULL,
    [EMP_ID]        VARCHAR (10) NOT NULL,
    [HEAD_PRIORITY] INT          NULL,
    [DEL_FLAG]      BIT          NULL
);

