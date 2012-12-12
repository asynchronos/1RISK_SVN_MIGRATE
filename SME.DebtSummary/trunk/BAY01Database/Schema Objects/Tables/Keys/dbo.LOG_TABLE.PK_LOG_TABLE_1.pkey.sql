﻿ALTER TABLE [dbo].[LOG_TABLE]
    ADD CONSTRAINT [PK_LOG_TABLE_1] PRIMARY KEY CLUSTERED ([TIME_STAMP] ASC, [IP_ADDRESS] ASC, [LOG_TYPE_ID] ASC, [CREATE_DATE] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

