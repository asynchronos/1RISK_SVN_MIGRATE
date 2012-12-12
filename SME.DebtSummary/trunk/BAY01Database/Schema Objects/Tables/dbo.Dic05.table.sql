CREATE TABLE [dbo].[Dic05] (
    [COLL_ID]      INT           NOT NULL,
    [Id_TypeCid05] NVARCHAR (1)  NOT NULL,
    [CHANODE]      NVARCHAR (10) NULL,
    [LAND]         NVARCHAR (5)  NULL,
    [SURVEY]       NVARCHAR (5)  NULL,
    [PAGE]         NVARCHAR (5)  NULL,
    [BOOK]         NVARCHAR (5)  NULL,
    [BUILDNAME]    NVARCHAR (40) NULL,
    [SOI]          NVARCHAR (20) NULL,
    [ROAD]         NVARCHAR (20) NULL,
    [DISTRICT]     NVARCHAR (40) NULL,
    [AMPHUR]       NVARCHAR (40) NULL,
    [PROV_CODE]    SMALLINT      NULL,
    [AREA_RAI]     SMALLINT      NULL,
    [AREA_NGAN]    SMALLINT      NULL,
    [AREA_WAH]     MONEY         NULL
);

