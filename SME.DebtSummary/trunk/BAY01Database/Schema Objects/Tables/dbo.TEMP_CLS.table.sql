CREATE TABLE [dbo].[TEMP_CLS] (
    [LIMIT_NO]                     NUMERIC (18)    NULL,
    [LIMIT_TYPE]                   VARCHAR (1)     NULL,
    [LIMIT_STATUS]                 VARCHAR (1)     NULL,
    [PRODUCT_NAME]                 VARCHAR (50)    NULL,
    [CIF_LIST]                     VARCHAR (1000)  NULL,
    [LIMIT_AMOUNT]                 NUMERIC (20, 2) NULL,
    [LIMIT_CHANGE]                 NUMERIC (20, 2) NULL,
    [LIMIT_CHANGE_DATE]            DATETIME        NULL,
    [LIMIT_NO_ROOT]                NUMERIC (18)    NULL,
    [LIMIT_PRODUCT_EFFECT_DATE]    DATETIME        NULL,
    [LIMIT_PRODUCT_EXPIRE_DATE]    DATETIME        NULL,
    [PRIORITY]                     NVARCHAR (MAX)  NULL,
    [LIMIT_PRODUCT_CA_NO]          NVARCHAR (40)   NULL,
    [LIMIT_PRODUCT_CA_DATE]        DATETIME        NULL,
    [LIMIT_PRODUCT_APPV_DATE]      DATETIME        NULL,
    [LIMIT_PRODUCT_APPV_AUTH_UNIT] NVARCHAR (100)  NULL,
    [LIMIT_PRODUCT_PREVIOUS_CA_NO] NVARCHAR (40)   NULL,
    [MAPPING_STATUS]               NVARCHAR (1)    NULL,
    [ACCOUNT_NO]                   VARCHAR (100)   NULL
);

