﻿ALTER TABLE [dbo].[TEMP_NPL]
    ADD CONSTRAINT [PK_TEMP_NPL] PRIMARY KEY CLUSTERED ([CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

