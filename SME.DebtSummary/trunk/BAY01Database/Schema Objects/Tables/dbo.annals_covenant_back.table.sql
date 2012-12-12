CREATE TABLE [dbo].[annals_covenant_back] (
    [IDEN]                    INT            IDENTITY (1, 1) NOT NULL,
    [CIF]                     INT            NULL,
    [COVENANT_TYPE_ID]        NVARCHAR (1)   NULL,
    [DETAIL]                  NVARCHAR (500) NULL,
    [CREATE_DATE]             DATETIME       NULL,
    [DEADLINE_DATE]           DATETIME       NULL,
    [COVENANT_ACTION_ID]      NVARCHAR (2)   NULL,
    [REMARK]                  NVARCHAR (500) NULL,
    [ACTION_DATE]             DATETIME       NULL,
    [USER_ID]                 NCHAR (10)     NULL,
    [USER_UPDATE_DATE]        DATETIME       NULL,
    [ID]                      NVARCHAR (10)  NULL,
    [COVENANT_DETAIL_ID]      NVARCHAR (3)   NULL,
    [NEXT_COVENANT_ACTION_ID] NVARCHAR (2)   NULL,
    [NEXT_ACTION_DATE]        DATETIME       NULL
);

