ALTER TABLE [CLASSIFY].[CATEGORY]
    ADD CONSTRAINT [PK_CLASSIFY.CATEGORY] PRIMARY KEY CLUSTERED ([CATEGORY_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

