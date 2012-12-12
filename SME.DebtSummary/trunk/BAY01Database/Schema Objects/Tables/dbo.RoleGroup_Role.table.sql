CREATE TABLE [dbo].[RoleGroup_Role] (
    [ROLE_ID]          NUMERIC (5)   IDENTITY (1, 1) NOT NULL,
    [ROLE_NAME]        NVARCHAR (50) NULL,
    [ROLE_VALUE]       NVARCHAR (30) NOT NULL,
    [ROLE_CATEGORY_ID] NUMERIC (5)   NOT NULL,
    [PRIORITY]         INT           NULL
);

