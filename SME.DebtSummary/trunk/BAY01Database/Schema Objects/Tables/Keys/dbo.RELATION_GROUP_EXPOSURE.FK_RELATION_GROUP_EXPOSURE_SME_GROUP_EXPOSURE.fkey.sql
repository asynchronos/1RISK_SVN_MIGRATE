ALTER TABLE [dbo].[RELATION_GROUP_EXPOSURE]
    ADD CONSTRAINT [FK_RELATION_GROUP_EXPOSURE_SME_GROUP_EXPOSURE] FOREIGN KEY ([EXPOSURE_ID]) REFERENCES [dbo].[SME_GROUP_EXPOSURE] ([EXPOSURE_ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

