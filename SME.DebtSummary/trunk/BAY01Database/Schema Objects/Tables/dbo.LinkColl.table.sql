CREATE TABLE [dbo].[LinkColl] (
    [APPS_ID]    INT           NOT NULL,
    [COLL_ID]    INT           NOT NULL,
    [APPS_TYPE]  NVARCHAR (1)  NULL,
    [APPS_CODE]  INT           NULL,
    [APPS_DATE]  SMALLDATETIME NULL,
    [LISTED]     NVARCHAR (1)  NULL,
    [VALUE_UNIT] MONEY         NULL,
    [APPS_UNIT]  NVARCHAR (10) NULL,
    [RAI]        SMALLINT      NULL,
    [NGAN]       SMALLINT      NULL,
    [WAH]        MONEY         NULL,
    [BUILD_TYPE] NVARCHAR (3)  NULL
);

