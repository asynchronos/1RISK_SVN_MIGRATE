﻿ALTER TABLE [CLASSIFY].[CATE_AND_MENU]
    ADD CONSTRAINT [FK_CATE_AND_MENU_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;

