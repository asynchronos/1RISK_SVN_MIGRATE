﻿ALTER TABLE [dbo].[ANNALS_CUS_CA]
    ADD CONSTRAINT [PK_ANNALS_CUS_CA] PRIMARY KEY CLUSTERED ([ID] ASC, [CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
