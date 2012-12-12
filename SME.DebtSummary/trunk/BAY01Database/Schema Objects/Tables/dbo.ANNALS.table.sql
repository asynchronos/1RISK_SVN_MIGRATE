CREATE TABLE [dbo].[ANNALS] (
    [ANNALS_YEAR]        NVARCHAR (4)   NOT NULL,
    [ANNALS_TYPE]        NVARCHAR (1)   NOT NULL,
    [ANNALS_SEQ_NO]      NVARCHAR (5)   NOT NULL,
    [SENDER]             NVARCHAR (MAX) NULL,
    [RECIVER]            NVARCHAR (MAX) NULL,
    [REFERENCE]          NVARCHAR (100) NOT NULL,
    [HEADER]             NVARCHAR (100) NOT NULL,
    [DETAIL]             NVARCHAR (MAX) NULL,
    [DATE_IN_ANNALS]     DATETIME       NULL,
    [ANNALS_CREATE_DATE] DATETIME       NOT NULL,
    [ANNALS_UPDATE_DATE] DATETIME       NOT NULL,
    [DEPART_REFER]       SMALLINT       NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หนังสือเข้า/ออก', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ANNALS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ประเภทของจดหมาย (เข้า/ออก)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ANNALS', @level2type = N'COLUMN', @level2name = N'ANNALS_TYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'หนังสือเข้าจะเป็นวันที่ออกของหนังสือนั้น
หนังสือออกจะเป็นวันที่วันเดียวกับ ANNALS_CREATE_DATE', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ANNALS', @level2type = N'COLUMN', @level2name = N'DATE_IN_ANNALS';

