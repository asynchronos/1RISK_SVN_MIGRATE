CREATE TABLE [CLASSIFY].[APP_PROFILE]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[APP_KEY] [int] NULL,
	[EMP_ID] [varchar](10) NULL,
	[CREATE_DATE] [datetime] NULL,
	[EXPIRE_DATE] [datetime] NULL,
	[LAST_ACTIVITY] [nvarchar](50) NULL,
	[LAST_ACTIVITY_DATE] [datetime] NULL,
	[IS_AUTHENTICATED] [bit] NULL,
	[DEL_FLAG] [bit] NULL
)
