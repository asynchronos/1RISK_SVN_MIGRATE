CREATE TABLE [dbo].[Id_Rental_Type] (
    [Id_Rental_Type] NVARCHAR (1)  NOT NULL,
    [Rental_Type]    NVARCHAR (20) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'รหัสประเภทสิทธิการเช่า', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Rental_Type', @level2type = N'COLUMN', @level2name = N'Id_Rental_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ประเภทสิทธิการเช่า', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_Rental_Type', @level2type = N'COLUMN', @level2name = N'Rental_Type';

