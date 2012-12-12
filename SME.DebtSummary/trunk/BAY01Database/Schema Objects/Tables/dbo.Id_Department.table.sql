CREATE TABLE [dbo].[Id_Department] (
    [Id_Depart]         SMALLINT      NOT NULL,
    [Depart_T]          NVARCHAR (70) NOT NULL,
    [Depart_E]          NVARCHAR (50) NULL,
    [Id_DepGroup]       SMALLINT      NULL,
    [Depart_T1]         NVARCHAR (50) NULL,
    [Id_G2]             SMALLINT      NULL,
    [G2]                NVARCHAR (50) NULL,
    [Id_G3]             SMALLINT      NULL,
    [G3]                NVARCHAR (50) NULL,
    [Id_G4]             SMALLINT      NULL,
    [G4]                NVARCHAR (50) NULL,
    [Id_LoanMarketing]  TINYINT       NULL,
    [LoanMarketing]     NVARCHAR (20) NULL,
    [Id_Underwrite]     TINYINT       NULL,
    [Underwrite]        NVARCHAR (20) NULL,
    [Id_PortManagement] TINYINT       NULL,
    [PortManagement]    NVARCHAR (20) NULL
);

