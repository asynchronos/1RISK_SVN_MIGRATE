﻿CREATE TABLE [SS].[FINANCIAL_MAIN]
(
	[SMES_ID] [int] IDENTITY(1,1) NOT NULL,
	[SMES_STATUS] [int] NULL,
	[CREATE_USER] [nvarchar](10) NULL,
	[CREATE_DATE] [datetime] NULL,
	[UPDATE_USER] [nvarchar](10) NULL,
	[UPDATE_DATE] [datetime] NULL,
	[REF_ID] [int] NULL,
	[BUSINESS_ID_TABLE] [float] NULL,
	[MARGIN_TABLE] [float] NULL,
	[DSCR_TABLE] [float] NULL,
	[AP_TABLE] [float] NULL,
	[AR_TABLE] [float] NULL,
	[STOCK_TABLE] [float] NULL,
	[LTV_TABLE] [float] NULL,
	[WORKING_CAPITAL_TABLE] [float] NULL,
	[RATE_TABLE] [float] NULL,
	[CONTRACT_TABLE] [float] NULL,
	[BUSINESS_GROUP_ID] [int] NULL,
	[PURPOSE_LIST_ID] [nvarchar](4) NULL,
	[INVEST_IN] [int] NULL,
	[TENOR_LIST_ID] [nvarchar](4) NULL,
	[COLLATERAL_TYPE_LIST_ID] [nvarchar](4) NULL,
	[LTV_PERCENT] [float] NULL,
	[INDUS_WATH_LIST_ID] [nvarchar](4) NULL,
	[NET_PROFIT_LIST_ID] [nvarchar](4) NULL,
	[DEBT_EBITDA] [float] NULL,
	[DEBT_EQUITY] [float] NULL,
	[DSCR] [float] NULL,
	[RESULT_PROCESS] [nvarchar](10) NULL,
	[RESULT_REMARK] [nvarchar](500) NULL
)