﻿ALTER TABLE [PERMISSION].[MENU_MASTER]
    ADD CONSTRAINT [DF_MENU_MASTER_MENU_DEL_FLAG] DEFAULT ((0)) FOR [MENU_DEL_FLAG];

