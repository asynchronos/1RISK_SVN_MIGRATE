CREATE TABLE [dbo].[TB_EMPTRANING] (
    [ID_NO]      INT            IDENTITY (1, 1) NOT NULL,
    [EMP_ID]     CHAR (50)      NOT NULL,
    [NAMETRAIN]  NVARCHAR (255) NULL,
    [PLACE]      NVARCHAR (100) NULL,
    [STARTDATE]  DATETIME       NULL,
    [FINISHDATE] DATETIME       NULL,
    [IN_OUT]     CHAR (1)       NOT NULL,
    [UP_DT]      DATETIME       NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'ID_NO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'EMP_ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Train Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'NAMETRAIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Place', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'PLACE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of Start', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'STARTDATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of finish', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'FINISHDATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'in-out', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'IN_OUT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_EMPTRANING', @level2type = N'COLUMN', @level2name = N'UP_DT';

