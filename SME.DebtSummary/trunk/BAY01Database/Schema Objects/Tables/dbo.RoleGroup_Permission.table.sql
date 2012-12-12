CREATE TABLE [dbo].[RoleGroup_Permission] (
    [PERMISSION_ID]     NUMERIC (5)   IDENTITY (1, 1) NOT NULL,
    [PERMISSION_DETAIL] NVARCHAR (50) NULL,
    [PRIORITY]          INT           NULL
);

