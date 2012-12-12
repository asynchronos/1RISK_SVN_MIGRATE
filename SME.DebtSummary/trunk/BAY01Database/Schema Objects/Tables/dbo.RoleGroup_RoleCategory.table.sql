CREATE TABLE [dbo].[RoleGroup_RoleCategory] (
    [ROLE_CATEGORY_ID]   NUMERIC (5)   IDENTITY (1, 1) NOT NULL,
    [ROLE_CATEGORY_NAME] NVARCHAR (50) NULL,
    [PRIORITY]           INT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'running id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_RoleCategory', @level2type = N'COLUMN', @level2name = N'ROLE_CATEGORY_ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'name of category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_RoleCategory', @level2type = N'COLUMN', @level2name = N'ROLE_CATEGORY_NAME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'priority for sort', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_RoleCategory', @level2type = N'COLUMN', @level2name = N'PRIORITY';

