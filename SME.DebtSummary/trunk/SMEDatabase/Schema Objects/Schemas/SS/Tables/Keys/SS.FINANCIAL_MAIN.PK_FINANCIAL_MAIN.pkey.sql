﻿ALTER TABLE [SS].[FINANCIAL_MAIN]
	ADD CONSTRAINT [PK_FINANCIAL_MAIN]
	PRIMARY KEY CLUSTERED (SMES_ID)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]