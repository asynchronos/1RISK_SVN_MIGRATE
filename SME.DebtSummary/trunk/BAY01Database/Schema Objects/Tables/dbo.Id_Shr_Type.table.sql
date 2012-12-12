CREATE TABLE [dbo].[Id_Shr_Type] (
    [Id_Shr_Type] NVARCHAR (2)  NOT NULL,
    [Shr_Type]    NVARCHAR (15) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'รหัสประเภทหุ้น', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Shr_Type', @level2type = N'COLUMN', @level2name = N'Id_Shr_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ประเภทหุ้น', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Shr_Type', @level2type = N'COLUMN', @level2name = N'Shr_Type';

