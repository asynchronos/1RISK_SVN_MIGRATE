ALTER TABLE [dbo].[RoleGroup_EmpInRole]
    ADD CONSTRAINT [FK_RoleGroup_EmpInRole_RoleGroup_Role] FOREIGN KEY ([ROLE_ID]) REFERENCES [dbo].[RoleGroup_Role] ([ROLE_ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

