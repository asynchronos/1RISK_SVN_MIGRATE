CREATE TABLE [dbo].[Dic09] (
    [COLL_ID]      INT           NOT NULL,
    [MACHTYPE]     NVARCHAR (30) NULL,
    [Id_Fled_Type] NVARCHAR (1)  NULL,
    [MACHNO]       NVARCHAR (20) NULL,
    [BUILDNAME]    NVARCHAR (40) NULL,
    [ADDR]         NVARCHAR (15) NULL,
    [SOI]          NVARCHAR (20) NULL,
    [ROAD]         NVARCHAR (20) NULL,
    [MOO]          SMALLINT      NULL,
    [GROUP]        SMALLINT      NULL,
    [DISTRICT]     NVARCHAR (20) NULL,
    [AMPHUR]       NVARCHAR (20) NULL,
    [PROV_CODE]    SMALLINT      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หมู่ที่', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Dic09', @level2type = N'COLUMN', @level2name = N'MOO';

