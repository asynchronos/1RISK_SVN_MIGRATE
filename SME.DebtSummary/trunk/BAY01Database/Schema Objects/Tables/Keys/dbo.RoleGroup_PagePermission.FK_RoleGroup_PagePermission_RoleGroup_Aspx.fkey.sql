ALTER TABLE [dbo].[RoleGroup_PagePermission]
    ADD CONSTRAINT [FK_RoleGroup_PagePermission_RoleGroup_Aspx] FOREIGN KEY ([PAGE_ID]) REFERENCES [dbo].[RoleGroup_Aspx] ([PAGE_ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

