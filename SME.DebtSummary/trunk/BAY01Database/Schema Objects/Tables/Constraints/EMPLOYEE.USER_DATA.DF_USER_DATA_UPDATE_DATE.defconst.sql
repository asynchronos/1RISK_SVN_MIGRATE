ALTER TABLE [EMPLOYEE].[USER_DATA]
    ADD CONSTRAINT [DF_USER_DATA_UPDATE_DATE] DEFAULT (getdate()) FOR [UPDATE_DATE];

