CREATE TABLE [dbo].[upsys] (
    [cif]        INT           NOT NULL,
    [main_br]    SMALLINT      NOT NULL,
    [group_id]   INT           NULL,
    [cm_code]    NVARCHAR (10) NOT NULL,
    [grp_size]   SMALLINT      NOT NULL,
    [busi_risk1] INT           NOT NULL,
    [busi_risk2] INT           NOT NULL,
    [busi_risk3] INT           NOT NULL
);

