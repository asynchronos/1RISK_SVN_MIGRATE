ALTER TABLE [dbo].[COLLGROUP]
    ADD CONSTRAINT [PK_COLLGROUP_1] PRIMARY KEY CLUSTERED ([CIDGROUP] ASC, [COLL_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

