ALTER TABLE [CLASSIFY].[CATE_AND_EMP]  WITH CHECK ADD  CONSTRAINT [FK_CATE_AND_EMP_CATEGORY] FOREIGN KEY([CATEGORY_KEY])
REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY])
GO

ALTER TABLE [CLASSIFY].[CATE_AND_EMP] CHECK CONSTRAINT [FK_CATE_AND_EMP_CATEGORY]
GO