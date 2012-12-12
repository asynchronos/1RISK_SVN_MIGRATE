CREATE TABLE [dbo].[Id_TypeCid05] (
    [Id_TypeCid05]   NVARCHAR (1)  NOT NULL,
    [TypeCid05_Name] NVARCHAR (10) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ประเภทหนังสือกรรมสิทธิ์ที่ดิน (1=โฉนด,2=นส3,3=นส3ก,4=นส3ข)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_TypeCid05', @level2type = N'COLUMN', @level2name = N'Id_TypeCid05';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หนังสือกรรมสิทธิ์ที่ดิน', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Id_TypeCid05', @level2type = N'COLUMN', @level2name = N'TypeCid05_Name';

