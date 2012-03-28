﻿CREATE TABLE [CUSTOMER].[CUSTOMER_SME_RATING]
(
	[RATING_KEY] [int] IDENTITY(1,1) NOT NULL,
	[RATING_CODE] [nvarchar](10) NULL,
	[RATING_TYPE_KEY] [int] NOT NULL,
	[RATING_DESC] [nvarchar](50) NULL,
	[PRIORITY] [int] NULL,
 CONSTRAINT [PK_CUSTOMER_SME_RATING_1] PRIMARY KEY CLUSTERED 
(
	[RATING_KEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SME_RATING_CUSTOMER_SME_RATING_TYPE1] FOREIGN KEY([RATING_TYPE_KEY])
REFERENCES [CUSTOMER].[CUSTOMER_SME_RATING_TYPE] ([RATING_TYPE_KEY])
GO

ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING] CHECK CONSTRAINT [FK_CUSTOMER_SME_RATING_CUSTOMER_SME_RATING_TYPE1]
GO
