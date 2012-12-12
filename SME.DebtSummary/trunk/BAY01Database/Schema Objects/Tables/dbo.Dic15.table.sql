CREATE TABLE [dbo].[Dic15] (
    [COLL_ID]    INT           NOT NULL,
    [NAME]       NVARCHAR (40) NULL,
    [SHIP_NO]    NVARCHAR (20) NULL,
    [REGIS_PORT] NVARCHAR (40) NULL,
    [WEIGHT]     INT           NULL,
    [POWER]      INT           NULL,
    [BUILDNAME]  NVARCHAR (40) NULL,
    [ADDR]       NVARCHAR (15) NULL,
    [SOI]        NVARCHAR (20) NULL,
    [ROAD]       NVARCHAR (20) NULL,
    [MOO]        SMALLINT      NULL,
    [GROUP]      SMALLINT      NULL,
    [DISTRICT]   NVARCHAR (20) NULL,
    [AMPHUR]     NVARCHAR (20) NULL,
    [PROV_CODE]  SMALLINT      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หมู่ที่', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Dic15', @level2type = N'COLUMN', @level2name = N'MOO';

