﻿ALTER TABLE [CLASSIFY].[LINKED_TYPE]
    ADD CONSTRAINT [DF_CATEGORY_RECURSIVE_TYPE_DEL_FLAG] DEFAULT ((0)) FOR [DEL_FLAG];
