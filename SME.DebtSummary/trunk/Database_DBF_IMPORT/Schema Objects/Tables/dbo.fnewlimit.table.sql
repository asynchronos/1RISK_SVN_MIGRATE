CREATE TABLE [dbo].[fnewlimit] (
    [asof_date]  DATETIME        NOT NULL,
    [app_id]     CHAR (4)        NOT NULL,
    [limitno]    CHAR (20)       NOT NULL,
    [cif]        DECIMAL (10)    NOT NULL,
    [limit_type] CHAR (1)        NOT NULL,
    [fcy_type]   DECIMAL (3)     NOT NULL,
    [open_date]  DATETIME        NOT NULL,
    [exp_date]   DATETIME        NOT NULL,
    [limit_sign] CHAR (1)        NOT NULL,
    [limit]      DECIMAL (17, 2) NOT NULL,
    [limit_avls] CHAR (1)        NOT NULL,
    [limitavail] DECIMAL (17, 2) NOT NULL,
    [limit_uses] CHAR (1)        NOT NULL,
    [limit_use]  DECIMAL (17, 2) NOT NULL,
    [limit_actv] CHAR (1)        NOT NULL,
    [last_upd]   DATETIME        NOT NULL,
    [cash_prin]  DECIMAL (16, 2) NOT NULL,
    [ncash_prin] DECIMAL (16, 2) NOT NULL,
    [l_aval]     DECIMAL (16, 2) NOT NULL,
    [real_aval]  DECIMAL (16, 2) NOT NULL,
    [product_l]  CHAR (36)       NOT NULL
);

