﻿ALTER TABLE [dbo].[CUSTOMER_SME_GROUP]
    ADD CONSTRAINT [DF_CUSTOMER_SME_GROUP_UPDATE_DATE] DEFAULT (getdate()) FOR [UPDATE_DATE];
