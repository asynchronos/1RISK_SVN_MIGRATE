CREATE TABLE [EMPLOYEE].[USER_DATA]
(
	[EMP_ID] [varchar](10) NOT NULL,
	[EMP_TITLE] [nvarchar](20) NOT NULL,
	[EMP_NAME] [nvarchar](50) NOT NULL,
	[EMP_SURNAME] [nvarchar](50) NOT NULL,
	[EMP_TITLE_E] [nvarchar](20) NULL,
	[EMP_NAME_E] [nvarchar](50) NULL,
	[EMP_SURNAME_E] [nvarchar](50) NULL,
	[PASSWD] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[EXPIRE_DATE] [datetime] NULL,
	[UPDATE_DATE] [datetime] NULL,
	[LAST_SIGN_ON_DATE] [datetime] NULL,
	[LAST_CHANGE_PASS_DATE] [datetime] NULL,
	[DEL_FLAG] [bit] NULL
)
