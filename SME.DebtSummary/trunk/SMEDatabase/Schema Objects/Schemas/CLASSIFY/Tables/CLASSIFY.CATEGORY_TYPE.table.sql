CREATE TABLE [CLASSIFY].[CATEGORY_TYPE]
(
	[CATEGORY_TYPE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY_TYPE_DESC] [varchar](50) NULL,
	[CATEGORY_TYPE_DESC_TH] [nvarchar](50) NULL,
	[CATEGORY_TYPE_VALUE] [nvarchar](20) NULL,
	[PRIORITY] [int] NULL,
	[DEL_FLAG] [bit] NULL
)
