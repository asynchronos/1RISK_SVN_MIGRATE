ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
	ADD CONSTRAINT [FK_CUSTOMER_SME_BUSINESS_DESTINATION] 
	FOREIGN KEY ([BUSINESS_DESTINATION_ID])
	REFERENCES [CUSTOMER].[BUSINESS_DESTINATION] ([BUSINESS_DESTINATION_ID])

