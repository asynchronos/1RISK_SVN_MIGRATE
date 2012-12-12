CREATE TABLE [dbo].[MergeCOS] (
    [CIF]       INT           NULL,
    [PLED_ID]   NVARCHAR (15) NULL,
    [APPS_ID]   INT           NULL,
    [PLED_SEQ]  SMALLINT      NULL,
    [GUAR_AMT]  MONEY         NULL,
    [GUARANTEE] MONEY         NULL,
    [COLLTYPE]  TINYINT       NULL,
    [COLLVAL]   MONEY         NULL,
    [DISCVAL]   MONEY         NULL,
    [VAL_R]     MONEY         NULL,
    [VALDATE]   SMALLDATETIME NULL,
    [USEVALUE]  MONEY         NULL,
    [USEACCRU]  MONEY         NULL,
    [DISCPCT]   MONEY         NULL,
    [CO_NO]     SMALLINT      NULL,
    [TOTAMT]    MONEY         NULL,
    [Class]     NVARCHAR (1)  NULL,
    [APPS_PCT]  MONEY         NULL,
    [BAYPCT]    MONEY         NULL,
    [AMCPCT]    MONEY         NULL,
    [ISAT]      NCHAR (10)    NULL
);

