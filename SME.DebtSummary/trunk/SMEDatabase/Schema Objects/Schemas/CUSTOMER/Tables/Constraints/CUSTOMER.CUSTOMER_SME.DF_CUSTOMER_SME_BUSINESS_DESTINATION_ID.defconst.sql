﻿ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
   ADD CONSTRAINT [DF_CUSTOMER_SME_BUSINESS_DESTINATION_ID] 
   DEFAULT 1
   FOR [BUSINESS_DESTINATION_ID]

