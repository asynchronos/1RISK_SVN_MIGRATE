CREATE TABLE [dbo].[Id_Branch_From_Leader] (
    [Id_Branch]    SMALLINT       NOT NULL,
    [Branch_T]     NVARCHAR (50)  NULL,
    [Branch_E]     NVARCHAR (50)  NULL,
    [IPROVNO]      SMALLINT       NULL,
    [PROVICE_NAME] NVARCHAR (50)  NULL,
    [Id_Region]    SMALLINT       NULL,
    [ADDRESS]      NVARCHAR (500) NULL,
    [ZIPCODE]      INT            NULL,
    [TEL]          NVARCHAR (50)  NULL
);

