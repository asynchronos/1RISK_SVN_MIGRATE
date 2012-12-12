CREATE TABLE [dbo].[RoleGroup_RoleLink] (
    [LINK_ID]     NUMERIC (5)   IDENTITY (1, 1) NOT NULL,
    [DESCRIPTION] NVARCHAR (50) NULL,
    [LINK]        VARCHAR (50)  NOT NULL,
    [PRIORITY]    INT           NULL
);

