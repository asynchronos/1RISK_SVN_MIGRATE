﻿ALTER TABLE [CLASSIFY].[CATE_AND_MENU]  WITH CHECK ADD  CONSTRAINT [FK_CATE_AND_MENU_CATEGORY] FOREIGN KEY([CATEGORY_KEY])
REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY])
GO

ALTER TABLE [CLASSIFY].[CATE_AND_MENU] CHECK CONSTRAINT [FK_CATE_AND_MENU_CATEGORY]
GO