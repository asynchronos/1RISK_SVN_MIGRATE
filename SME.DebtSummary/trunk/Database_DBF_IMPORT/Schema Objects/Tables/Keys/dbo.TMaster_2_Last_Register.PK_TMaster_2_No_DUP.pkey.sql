﻿ALTER TABLE [dbo].[TMaster_2_Last_Register]
    ADD CONSTRAINT [PK_TMaster_2_No_DUP] PRIMARY KEY CLUSTERED ([Cif_No] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
