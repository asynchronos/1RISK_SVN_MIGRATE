﻿ALTER TABLE [EMPLOYEE].[TB_EMPLOYEE]
	ADD CONSTRAINT [PK_TB_EMPLOYEE]
	PRIMARY KEY CLUSTERED ([EMP_ID] ASC)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]