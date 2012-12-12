CREATE TABLE [dbo].[CUSTOMER_SME_HISTORY] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [CIF]          INT           NOT NULL,
    [UPDATE_DATE]  DATETIME      NOT NULL,
    [JUDGEMENT_ID] NVARCHAR (5)  NOT NULL,
    [CM_CODE]      NVARCHAR (10) NULL,
    [UPDATE_BY]    NVARCHAR (50) NULL
);

