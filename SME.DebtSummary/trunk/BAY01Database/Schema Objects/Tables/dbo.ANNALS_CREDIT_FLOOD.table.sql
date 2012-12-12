CREATE TABLE [dbo].[ANNALS_CREDIT_FLOOD] (
    [ID]            NVARCHAR (10) NOT NULL,
    [CONCERN_FLOOD] BIT           NULL,
    [IMPACT_TYPE]   INT           NULL,
    [OPERATION]     INT           NULL,
    [PROGRAM]       INT           NULL,
    [IMPACT]        INT           NULL,
    [IMPACT_DATE]   DATETIME      NULL,
    [UPDATE_USER]   NVARCHAR (10) NULL,
    [UPDATE_DATE]   DATETIME      NULL
);

