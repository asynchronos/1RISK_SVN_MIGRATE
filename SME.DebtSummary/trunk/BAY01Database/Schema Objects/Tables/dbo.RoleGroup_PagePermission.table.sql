CREATE TABLE [dbo].[RoleGroup_PagePermission] (
    [ID]               INT         IDENTITY (1, 1) NOT NULL,
    [PAGE_ID]          NUMERIC (5) NOT NULL,
    [ROLE_ID]          NUMERIC (5) NOT NULL,
    [PERMISSION_ID]    NUMERIC (5) NOT NULL,
    [PERMISSION_VALUE] BIT         NULL
);

