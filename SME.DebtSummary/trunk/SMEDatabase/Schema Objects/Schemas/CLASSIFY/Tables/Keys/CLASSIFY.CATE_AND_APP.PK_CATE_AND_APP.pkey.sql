﻿/****** Object:  Index [PK_CATE_AND_APP]    Script Date: 04/03/2012 16:03:13 ******/
ALTER TABLE [CLASSIFY].[CATE_AND_APP] ADD  CONSTRAINT [PK_CATE_AND_APP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]