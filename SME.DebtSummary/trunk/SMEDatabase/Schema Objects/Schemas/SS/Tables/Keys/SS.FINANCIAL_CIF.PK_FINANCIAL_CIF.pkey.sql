﻿ALTER TABLE [SS].[FINANCIAL_CIF]
	ADD CONSTRAINT [PK_FINANCIAL_CIF]
	PRIMARY KEY CLUSTERED (SMES_ID)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]