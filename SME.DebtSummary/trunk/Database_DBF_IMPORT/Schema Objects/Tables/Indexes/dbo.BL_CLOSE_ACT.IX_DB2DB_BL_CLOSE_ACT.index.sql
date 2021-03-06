CREATE NONCLUSTERED INDEX [IX_DB2DB_BL_CLOSE_ACT]
    ON [dbo].[BL_CLOSE_ACT]([ACCOUNT_NAME] ASC, [OWNER_NAME] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

