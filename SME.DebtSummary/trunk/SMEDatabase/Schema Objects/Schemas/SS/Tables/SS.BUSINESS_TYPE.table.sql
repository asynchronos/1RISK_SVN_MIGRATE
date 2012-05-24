CREATE TABLE [SS].[BUSINESS_TYPE]
(
	[BUSINESS_ID] [int] IDENTITY(1,1) NOT NULL,
	[BUSINESS_CODE] [float] NULL,
	[BUSINESS_NAME] [nvarchar](255) NULL,
	[BUSINESS_GROUP_ID] [float] NULL,
	[MARGIN] [float] NULL,
	[DSCR] [float] NULL,
	[AP] [float] NULL,
	[AR] [float] NULL,
	[STOCK] [float] NULL,
	[LTV] [float] NULL,
	[WORKING_CAPITAL] [float] NULL,
	[RATE] [float] NULL,
	[CONTRACT] [float] NULL
)
