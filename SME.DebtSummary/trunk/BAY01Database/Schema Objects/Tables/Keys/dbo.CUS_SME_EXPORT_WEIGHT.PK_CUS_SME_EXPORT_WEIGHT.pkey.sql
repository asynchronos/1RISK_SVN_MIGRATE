﻿ALTER TABLE [dbo].[CUS_SME_EXPORT_WEIGHT]
    ADD CONSTRAINT [PK_CUS_SME_EXPORT_WEIGHT] PRIMARY KEY CLUSTERED ([CIF] ASC, [EXPORT_TO] ASC, [CURRENCY_TYPE] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

