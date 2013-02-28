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


