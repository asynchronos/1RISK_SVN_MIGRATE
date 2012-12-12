CREATE TABLE [dbo].[RoleGroup_Aspx] (
    [PAGE_ID]           NUMERIC (5)   IDENTITY (1, 1) NOT NULL,
    [RELATIVE_PATH]     NVARCHAR (50) NULL,
    [APPPLICATION_PATH] NVARCHAR (30) NULL,
    [PAGE_DETAIL]       NVARCHAR (50) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'relative path ของ page เช่น "~/aspx/admin/log.aspx"', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_Aspx', @level2type = N'COLUMN', @level2name = N'RELATIVE_PATH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'root ของ application เช่น "/SMEWeb"', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_Aspx', @level2type = N'COLUMN', @level2name = N'APPPLICATION_PATH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'รายละเอียดของ page ย่อๆ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'RoleGroup_Aspx', @level2type = N'COLUMN', @level2name = N'PAGE_DETAIL';

