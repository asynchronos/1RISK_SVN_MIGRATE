CREATE TABLE [dbo].[Dic08] (
    [COLL_ID]        INT           NOT NULL,
    [Id_Rental_Type] NVARCHAR (1)  NULL,
    [RENTALNAME]     NVARCHAR (40) NULL,
    [REN_CNT_NO]     NVARCHAR (20) NULL,
    [CNT_DATE]       SMALLDATETIME NULL,
    [CNT_DUE]        SMALLDATETIME NULL,
    [REN_OWNER]      NVARCHAR (40) NULL,
    [REN_REN_BY]     NVARCHAR (40) NULL,
    [BUILDNAME]      NVARCHAR (40) NULL,
    [REN_ADDR]       NVARCHAR (15) NULL,
    [REN_SOR]        NVARCHAR (20) NULL,
    [REN_ROAD]       NVARCHAR (20) NULL,
    [REN_MOO]        SMALLINT      NULL,
    [REN_GROUP]      SMALLINT      NULL,
    [DISTRICT]       NVARCHAR (20) NULL,
    [AMPHUR]         NVARCHAR (20) NULL,
    [PROV_CODE]      SMALLINT      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หมู่ที่', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Dic08', @level2type = N'COLUMN', @level2name = N'REN_MOO';

