ALTER TABLE [CUSTOMER].[CUSTOMER]
	ADD CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CIF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]