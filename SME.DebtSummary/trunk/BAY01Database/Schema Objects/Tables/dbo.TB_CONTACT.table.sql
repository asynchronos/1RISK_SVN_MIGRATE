CREATE TABLE [dbo].[TB_CONTACT] (
    [CIF]        INT            NOT NULL,
    [NAME]       NVARCHAR (255) NOT NULL,
    [SURNAME]    NVARCHAR (255) NULL,
    [POS]        NVARCHAR (255) NULL,
    [ADDR1]      NVARCHAR (255) NULL,
    [ADDR2]      NVARCHAR (255) NULL,
    [Tel_Off]    VARCHAR (50)   NULL,
    [Tel_Mobile] VARCHAR (50)   NULL,
    [UP_DT]      DATETIME       NULL,
    [EMP_UP]     NVARCHAR (50)  NULL,
    [CR_DT]      DATETIME       NULL,
    [EMP_CR]     NVARCHAR (50)  NULL
);

