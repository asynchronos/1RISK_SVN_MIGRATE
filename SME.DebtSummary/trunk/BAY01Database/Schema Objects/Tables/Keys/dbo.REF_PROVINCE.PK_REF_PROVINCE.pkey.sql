ALTER TABLE [dbo].[REF_PROVINCE]
    ADD CONSTRAINT [PK_REF_PROVINCE] PRIMARY KEY CLUSTERED ([PROV_CODE] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

