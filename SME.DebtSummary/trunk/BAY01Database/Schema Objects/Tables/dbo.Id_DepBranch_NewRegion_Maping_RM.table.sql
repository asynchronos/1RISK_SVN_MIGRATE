CREATE TABLE [dbo].[Id_DepBranch_NewRegion_Maping_RM] (
    [Flag]         TINYINT        NULL,
    [Id_DepTran]   INT            NULL,
    [DepTranT]     NVARCHAR (70)  NULL,
    [ID]           FLOAT          NULL,
    [8up]          NVARCHAR (255) NULL,
    [8up_name]     NVARCHAR (255) NULL,
    [Section]      FLOAT          NULL,
    [Section_name] NVARCHAR (255) NULL,
    [Grp_RMSME]    NVARCHAR (255) NULL,
    [RegionNew_No] FLOAT          NULL,
    [RegionNewTx]  NVARCHAR (255) NULL,
    [VP_Branch]    NVARCHAR (255) NULL,
    [RegionType]   NVARCHAR (255) NULL,
    [RegionOld]    NVARCHAR (255) NULL,
    [Flag2]        TINYINT        NULL,
    [BranchCode]   FLOAT          NULL,
    [BranchName]   NVARCHAR (255) NULL,
    [SBC]          NVARCHAR (255) NULL
);

