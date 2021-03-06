CREATE NONCLUSTERED INDEX [LEADER1_CA_OLD_ID_CLS_WHEN_APPROVE_LAST_UPDATE]
    ON [dbo].[CLS_WHEN_APPROVE_LAST_UPDATE]([LEADER1_CA_OLD_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

