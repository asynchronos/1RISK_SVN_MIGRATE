﻿ALTER TABLE [CLASSIFY].[CATE_AND_APP]
    ADD CONSTRAINT [FK_CATE_AND_APP_APPLICATION] FOREIGN KEY ([APP_KEY]) REFERENCES [PERMISSION].[APPLICATION] ([APP_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;
