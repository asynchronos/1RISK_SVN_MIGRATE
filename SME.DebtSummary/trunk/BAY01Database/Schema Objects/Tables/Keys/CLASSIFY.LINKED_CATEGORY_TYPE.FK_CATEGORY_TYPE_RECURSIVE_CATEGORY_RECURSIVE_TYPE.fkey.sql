﻿ALTER TABLE [CLASSIFY].[LINKED_CATEGORY_TYPE]
    ADD CONSTRAINT [FK_CATEGORY_TYPE_RECURSIVE_CATEGORY_RECURSIVE_TYPE] FOREIGN KEY ([LINKED_TYPE_KEY]) REFERENCES [CLASSIFY].[LINKED_TYPE] ([LINKED_TYPE_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;

