CREATE TABLE [CUSTOMER].[CUSTOMER_SME]
(
	[CIF] [int] NOT NULL,
	[GROUP_ID] [int] NULL,
	[CM_CODE] [nvarchar](10) NULL,
	[OLD_CM_CODE] [nvarchar](10) NULL,
	[BRANCH_ID] [smallint] NULL,
	[JUDGEMENT_ID] [nvarchar](5) NULL,
	[BUSI_RISK1_ID] [varchar](8) NULL,
	[BUSI_RISK2_ID] [varchar](8) NULL,
	[BUSI_RISK3_ID] [varchar](8) NULL,
	[BUSINESS_DESTINATION_ID] [numeric](3, 0) NULL,
	[EXPORT_WEIGHT] [numeric](3, 0) NULL,
	[LOCAL_WEIGHT] [numeric](3, 0) NULL,
	[STATUS_ID] [int] NULL,
	[SIZE_ID] [int] NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
	[UPDATE_BY] [nvarchar](10) NULL,
	[RATING_TYPE_KEY] [int] NULL,
	[RATING_KEY] [int] NULL,
	[RATING_UPDATE_DATE] [datetime] NULL,
	[EXTERNAL_SOURCE_MEMO] [ntext] NULL,
	[NEXT_REVIEW_DATE] [datetime] NULL
 )

GO
