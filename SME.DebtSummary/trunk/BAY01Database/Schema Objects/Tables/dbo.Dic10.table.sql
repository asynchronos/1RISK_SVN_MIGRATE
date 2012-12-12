CREATE TABLE [dbo].[Dic10] (
    [COLL_ID]   INT           NOT NULL,
    [GOODTYPE]  NVARCHAR (30) NULL,
    [GOODQTY]   MONEY         NULL,
    [GOODUNIT]  NVARCHAR (20) NULL,
    [BUILDNAME] NVARCHAR (40) NULL,
    [ADDR]      NVARCHAR (15) NULL,
    [SOI]       NVARCHAR (20) NULL,
    [ROAD]      NVARCHAR (20) NULL,
    [MOO]       SMALLINT      NULL,
    [GROUP]     SMALLINT      NULL,
    [DISTRICT]  NVARCHAR (20) NULL,
    [AMPHUR]    NVARCHAR (20) NULL,
    [PROV_CODE] SMALLINT      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หมู่ที่', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Dic10', @level2type = N'COLUMN', @level2name = N'MOO';

