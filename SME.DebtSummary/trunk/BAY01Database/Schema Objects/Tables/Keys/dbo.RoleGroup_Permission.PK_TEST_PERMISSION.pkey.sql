﻿ALTER TABLE [dbo].[RoleGroup_Permission]
    ADD CONSTRAINT [PK_TEST_PERMISSION] PRIMARY KEY CLUSTERED ([PERMISSION_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

