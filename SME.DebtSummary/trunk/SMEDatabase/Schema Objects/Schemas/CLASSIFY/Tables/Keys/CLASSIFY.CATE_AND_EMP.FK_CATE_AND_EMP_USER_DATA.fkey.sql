﻿ALTER TABLE [CLASSIFY].[CATE_AND_EMP]  WITH CHECK ADD  CONSTRAINT [FK_CATE_AND_EMP_USER_DATA] FOREIGN KEY([EMP_ID])
REFERENCES [EMPLOYEE].[USER_DATA] ([EMP_ID])
GO

ALTER TABLE [CLASSIFY].[CATE_AND_EMP] CHECK CONSTRAINT [FK_CATE_AND_EMP_USER_DATA]
GO