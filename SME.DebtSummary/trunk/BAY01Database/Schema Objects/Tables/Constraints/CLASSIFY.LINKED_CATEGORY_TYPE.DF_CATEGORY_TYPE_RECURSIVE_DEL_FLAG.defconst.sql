﻿ALTER TABLE [CLASSIFY].[LINKED_CATEGORY_TYPE]
    ADD CONSTRAINT [DF_CATEGORY_TYPE_RECURSIVE_DEL_FLAG] DEFAULT ((0)) FOR [DEL_FLAG];
