ALTER TABLE [dbo].[ANNALS_VIEWER]
    ADD CONSTRAINT [DF_ANNALS_VIEWER_CREATE_DATE] DEFAULT (getdate()) FOR [CREATE_DATE];

