ALTER TABLE [dbo].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_RATING_KEY_1] DEFAULT ((1)) FOR [RATING_KEY];

