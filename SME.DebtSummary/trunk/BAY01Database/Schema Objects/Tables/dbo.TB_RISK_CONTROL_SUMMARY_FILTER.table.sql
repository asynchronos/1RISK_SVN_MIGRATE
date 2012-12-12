CREATE TABLE [dbo].[TB_RISK_CONTROL_SUMMARY_FILTER] (
    [FilterID]        INT           NULL,
    [FilterDesc]      NVARCHAR (50) NULL,
    [PropertyInClass] NVARCHAR (50) NULL,
    [FilterTable]     NVARCHAR (50) NULL,
    [FilterColumn]    NVARCHAR (50) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'รายละเอียดที่จะแสดงใน page', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_RISK_CONTROL_SUMMARY_FILTER', @level2type = N'COLUMN', @level2name = N'FilterDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ชื่อของ property ใน Class', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_RISK_CONTROL_SUMMARY_FILTER', @level2type = N'COLUMN', @level2name = N'PropertyInClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ชื่อ Table ที่จะฟิลเตอร์', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_RISK_CONTROL_SUMMARY_FILTER', @level2type = N'COLUMN', @level2name = N'FilterTable';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ชื่อคอลัมน์ที่ต้องการฟิลเตอร์ใน table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TB_RISK_CONTROL_SUMMARY_FILTER', @level2type = N'COLUMN', @level2name = N'FilterColumn';

