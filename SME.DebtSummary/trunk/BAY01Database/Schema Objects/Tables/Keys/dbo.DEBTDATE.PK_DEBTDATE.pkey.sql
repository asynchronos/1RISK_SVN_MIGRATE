ALTER TABLE [dbo].[DEBTDATE]
    ADD CONSTRAINT [PK_DEBTDATE] PRIMARY KEY CLUSTERED ([Upd_TABLE] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

