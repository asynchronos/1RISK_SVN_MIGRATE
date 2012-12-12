CREATE TABLE [dbo].[ByCustomer_2548] (
    [Cif]        INT           NOT NULL,
    [Name]       NVARCHAR (30) NULL,
    [YM]         INT           NOT NULL,
    [Class]      NVARCHAR (1)  NULL,
    [AGING]      MONEY         NULL,
    [Principal]  MONEY         NULL,
    [Accru]      MONEY         NULL,
    [Susp]       MONEY         NULL,
    [UNCLEAPRIN] MONEY         NULL,
    [UNCLEAINT]  MONEY         NULL,
    [UseValue]   MONEY         NULL,
    [Totresv]    MONEY         NULL,
    [Pay_PRIN]   MONEY         NULL,
    [Pay_INT]    MONEY         NULL,
    [Pay_SUSP]   MONEY         NULL,
    [Post_PRIN]  MONEY         NULL,
    [Post_INT]   MONEY         NULL,
    [Post_SUSP]  MONEY         NULL,
    [Rev_Accru]  MONEY         NULL,
    [Yield]      MONEY         NULL
);

