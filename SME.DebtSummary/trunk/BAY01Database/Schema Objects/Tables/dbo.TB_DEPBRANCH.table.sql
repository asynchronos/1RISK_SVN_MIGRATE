CREATE TABLE [dbo].[TB_DEPBRANCH] (
    [Status]             NVARCHAR (3)  NULL,
    [Flag]               TINYINT       NULL,
    [Id_DepTran]         INT           NULL,
    [DepTranT]           NVARCHAR (70) NULL,
    [DepTranE]           NVARCHAR (70) NULL,
    [Id_Lending]         INT           NULL,
    [LendingT]           NVARCHAR (50) NULL,
    [LendingE]           NVARCHAR (70) NULL,
    [Id_LendingSubSort]  INT           NULL,
    [Id_LendingSub]      INT           NULL,
    [LendingSubT]        NVARCHAR (50) NULL,
    [LendingSubE]        NVARCHAR (70) NULL,
    [Id_LendingSubSort1] INT           NULL,
    [Id_LendingSub1]     INT           NULL,
    [LendingSubT1]       NVARCHAR (50) NULL,
    [LendingSubE1]       NVARCHAR (70) NULL,
    [Id_Province]        SMALLINT      NULL,
    [ProvinceT]          NVARCHAR (50) NULL,
    [ProvinceE]          NVARCHAR (50) NULL,
    [Id_Head]            TINYINT       NULL,
    [Head]               NVARCHAR (25) NULL
);

