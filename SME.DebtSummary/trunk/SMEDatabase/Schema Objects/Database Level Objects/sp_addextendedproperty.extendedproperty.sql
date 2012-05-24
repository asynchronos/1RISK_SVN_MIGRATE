EXEC sp_addextendedproperty @name=N'MS_Description', 
    @value =N'0:ยกเลิก;1:Customer save;2:Rm save;3:Cm Save', 
    @level0type = N'SCHEMA',
    @level0name = N'SS', 
    @level1type = N'TABLE',
    @level1name = N'FINANCIAL_MAIN', 
    @level2type = N'COLUMN',
    @level2name = N'SMES_STATUS'