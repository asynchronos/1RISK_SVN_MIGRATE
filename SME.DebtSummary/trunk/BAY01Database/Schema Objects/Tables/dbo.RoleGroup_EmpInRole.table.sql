CREATE TABLE [dbo].[RoleGroup_EmpInRole] (
    [ID]      INT           IDENTITY (1, 1) NOT NULL,
    [EMP_ID]  NVARCHAR (10) NOT NULL,
    [ROLE_ID] NUMERIC (5)   NOT NULL
);

