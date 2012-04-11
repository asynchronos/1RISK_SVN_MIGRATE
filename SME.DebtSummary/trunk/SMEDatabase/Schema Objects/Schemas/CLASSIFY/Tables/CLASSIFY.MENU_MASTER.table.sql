CREATE TABLE [CLASSIFY].[MENU_MASTER]
(
	[MENU_KEY] [int] IDENTITY(1,1) NOT NULL,
	[MENU_TITLE] [nvarchar](50) NULL,
	[MENU_URL] [nvarchar](50) NULL,
	[MENU_POPUP_OPT] [nvarchar](50) NULL,
	[MENU_REL] [nvarchar](50) NULL,
	[MENU_TOOLTIP] [nvarchar](50) NULL,
	[MENU_PRIORITY] [int] NULL,
	[MENU_DEL_FLAG] [bit] NULL,
	[MENU_PARENT_KEY] [int] NULL
)
