ALTER TABLE [dbo].[RoleGroup_Role]
    ADD CONSTRAINT [FK_RoleGroup_Role_RoleGroup_RoleCategory] FOREIGN KEY ([ROLE_CATEGORY_ID]) REFERENCES [dbo].[RoleGroup_RoleCategory] ([ROLE_CATEGORY_ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

