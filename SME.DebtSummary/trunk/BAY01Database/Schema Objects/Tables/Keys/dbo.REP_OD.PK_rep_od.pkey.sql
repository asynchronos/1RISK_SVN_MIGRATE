﻿ALTER TABLE [dbo].[REP_OD]
    ADD CONSTRAINT [PK_rep_od] PRIMARY KEY CLUSTERED ([accno] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

