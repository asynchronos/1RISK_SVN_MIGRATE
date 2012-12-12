CREATE NONCLUSTERED INDEX [_dta_index_rep_prod_16_1845581613__K1_6_7_8_10_12]
    ON [dbo].[rep_prod]([cif] ASC)
    INCLUDE([grp_size], [class_h], [aging_h], [busi_desc], [busi_type]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

