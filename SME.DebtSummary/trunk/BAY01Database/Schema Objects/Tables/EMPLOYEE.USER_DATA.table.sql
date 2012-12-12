CREATE TABLE [EMPLOYEE].[USER_DATA] (
    [EMP_ID]                VARCHAR (10)  NOT NULL,
    [EMP_TITLE]             NVARCHAR (20) NOT NULL,
    [EMP_NAME]              NVARCHAR (50) NOT NULL,
    [EMP_SURNAME]           NVARCHAR (50) NOT NULL,
    [EMP_TITLE_E]           NVARCHAR (20) NULL,
    [EMP_NAME_E]            NVARCHAR (50) NULL,
    [EMP_SURNAME_E]         NVARCHAR (50) NULL,
    [PASSWD]                NVARCHAR (20) NULL,
    [EMAIL]                 NVARCHAR (50) NULL,
    [CREATE_DATE]           DATETIME      NULL,
    [EXPIRE_DATE]           DATETIME      NULL,
    [UPDATE_DATE]           DATETIME      NULL,
    [LAST_SIGN_ON_DATE]     DATETIME      NULL,
    [LAST_CHANGE_PASS_DATE] DATETIME      NULL,
    [DEL_FLAG]              BIT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee ID', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Title Name', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_TITLE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Name', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_NAME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Surname', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_SURNAME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Title Name(English)', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_TITLE_E';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Name(English)', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_NAME_E';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee Surname(English)', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EMP_SURNAME_E';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'PASSWD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Create Date', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'CREATE_DATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expire Date', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'EXPIRE_DATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Update Date', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'UPDATE_DATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Sign on Date', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'LAST_SIGN_ON_DATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Change Password Date', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'LAST_CHANGE_PASS_DATE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delete Flag', @level0type = N'SCHEMA', @level0name = N'EMPLOYEE', @level1type = N'TABLE', @level1name = N'USER_DATA', @level2type = N'COLUMN', @level2name = N'DEL_FLAG';

