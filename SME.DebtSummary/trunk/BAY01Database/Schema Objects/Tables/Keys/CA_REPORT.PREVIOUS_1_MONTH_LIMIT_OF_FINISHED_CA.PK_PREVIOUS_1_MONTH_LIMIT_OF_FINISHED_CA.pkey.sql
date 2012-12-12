﻿ALTER TABLE [CA_REPORT].[PREVIOUS_1_MONTH_LIMIT_OF_FINISHED_CA]
    ADD CONSTRAINT [PK_PREVIOUS_1_MONTH_LIMIT_OF_FINISHED_CA] PRIMARY KEY CLUSTERED ([MONTH_KEY] ASC, [CIF] ASC, [LEADER1_CA_OLD_ID] ASC, [LIMIT_NO_PRODUCT] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

