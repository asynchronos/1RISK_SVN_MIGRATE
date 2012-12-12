CREATE TABLE [dbo].[TEMP_CASHFLOW] (
    [CIF]                            INT            NULL,
    [Default Date]                   DATETIME       NULL,
    [LIMITNO]                        NVARCHAR (20)  NULL,
    [APP_ID]                         NVARCHAR (5)   NULL,
    [Cashflow Currency Code]         NVARCHAR (3)   NULL,
    [Date of Cashflow]               DATETIME       NULL,
    [Cashflow Amount: PAY_PRIN]      FLOAT          NULL,
    [Cashflow Amount: PAY_INT]       FLOAT          NULL,
    [Cashflow Amount: PAY_SUSP]      FLOAT          NULL,
    [Cash Flow Source Description 1] NVARCHAR (255) NULL,
    [Cash Flow Source Description 2] NVARCHAR (255) NULL,
    [Cash Flow Source Description 3] NVARCHAR (255) NULL,
    [Written-off / Haircut Amount]   FLOAT          NULL,
    [Collateral ID / Pledge ID]      NTEXT          NULL,
    [LIMITNO Changed]                INT            NOT NULL,
    [Previous LIMITNO]               NVARCHAR (20)  NOT NULL,
    [UPDATE_USER]                    VARCHAR (10)   NULL,
    [UPDATE_DATE]                    DATETIME       NULL
);

