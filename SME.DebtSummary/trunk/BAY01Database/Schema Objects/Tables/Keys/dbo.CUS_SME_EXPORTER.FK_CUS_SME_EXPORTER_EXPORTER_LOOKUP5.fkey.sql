﻿ALTER TABLE [dbo].[CUS_SME_EXPORTER]
    ADD CONSTRAINT [FK_CUS_SME_EXPORTER_EXPORTER_LOOKUP5] FOREIGN KEY ([EX_CURRENCY_TYPE_3]) REFERENCES [dbo].[EXPORTER_LOOKUP] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
