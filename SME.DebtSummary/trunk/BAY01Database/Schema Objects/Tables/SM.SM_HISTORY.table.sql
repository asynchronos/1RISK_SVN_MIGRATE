CREATE TABLE [SM].[SM_HISTORY] (
    [IDEN]         INT            IDENTITY (1, 1) NOT NULL,
    [CIF]          INT            NULL,
    [CustomerSize] NVARCHAR (50)  NULL,
    [DPD]          MONEY          NULL,
    [Prin]         MONEY          NULL,
    [MoveForm]     NVARCHAR (50)  NULL,
    [DateIn]       DATETIME       NULL,
    [Comment]      NVARCHAR (MAX) NULL
);

