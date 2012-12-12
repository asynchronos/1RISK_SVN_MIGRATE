CREATE TABLE [PERMISSION].[APPLICATION] (
    [APP_KEY]  INT           IDENTITY (1, 1) NOT NULL,
    [APP_DESC] NVARCHAR (50) NOT NULL,
    [PRIORITY] INT           NULL,
    [DEL_FLAG] BIT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Application Key', @level0type = N'SCHEMA', @level0name = N'PERMISSION', @level1type = N'TABLE', @level1name = N'APPLICATION', @level2type = N'COLUMN', @level2name = N'APP_KEY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Application Description/Application Name', @level0type = N'SCHEMA', @level0name = N'PERMISSION', @level1type = N'TABLE', @level1name = N'APPLICATION', @level2type = N'COLUMN', @level2name = N'APP_DESC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Priority Order', @level0type = N'SCHEMA', @level0name = N'PERMISSION', @level1type = N'TABLE', @level1name = N'APPLICATION', @level2type = N'COLUMN', @level2name = N'PRIORITY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delete Flag', @level0type = N'SCHEMA', @level0name = N'PERMISSION', @level1type = N'TABLE', @level1name = N'APPLICATION', @level2type = N'COLUMN', @level2name = N'DEL_FLAG';

