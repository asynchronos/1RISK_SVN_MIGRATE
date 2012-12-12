CREATE TABLE [dbo].[TB_EDUCATION] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [EMP_ID]        CHAR (10)     NOT NULL,
    [DEGREE_CODE]   TINYINT       NOT NULL,
    [U_NAME]        VARCHAR (100) NULL,
    [MAJOR]         VARCHAR (50)  NULL,
    [DATEOFGRADUAT] DATETIME      NOT NULL,
    [UP_DT]         DATETIME      NOT NULL,
    [DELE]          CHAR (1)      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'EMP_ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Degree', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'DEGREE_CODE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'University Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'U_NAME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Major', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'MAJOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of Graduate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'DATEOFGRADUAT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Update Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EDUCATION', @level2type = N'COLUMN', @level2name = N'UP_DT';

