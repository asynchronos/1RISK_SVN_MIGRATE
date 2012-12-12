CREATE TABLE [dbo].[Id_Fled_Type] (
    [Id_Fled_Type] NVARCHAR (1)  NOT NULL,
    [Fled_Type]    NVARCHAR (15) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'รหัสประเภทการจำนอง/จำนำ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Fled_Type', @level2type = N'COLUMN', @level2name = N'Id_Fled_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ประเภทการจำนอง/จำนำ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Fled_Type', @level2type = N'COLUMN', @level2name = N'Fled_Type';

