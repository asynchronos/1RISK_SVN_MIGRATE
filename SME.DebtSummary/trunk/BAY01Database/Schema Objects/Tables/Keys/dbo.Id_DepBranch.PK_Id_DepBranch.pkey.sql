﻿ALTER TABLE [dbo].[Id_DepBranch]
    ADD CONSTRAINT [PK_Id_DepBranch] PRIMARY KEY CLUSTERED ([Flag] ASC, [Id_DepTran] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
