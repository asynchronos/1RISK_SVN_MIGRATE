ALTER TABLE [dbo].[RoleGroup_PagePermission]
    ADD CONSTRAINT [FK_RoleGroup_PagePermission_RoleGroup_Permission] FOREIGN KEY ([PERMISSION_ID]) REFERENCES [dbo].[RoleGroup_Permission] ([PERMISSION_ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

