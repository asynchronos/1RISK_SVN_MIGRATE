﻿ALTER TABLE [dbo].[ByCus_CIF]
    ADD CONSTRAINT [PK_ByCus_CIF] PRIMARY KEY CLUSTERED ([Cif] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

