CREATE TABLE [dbo].[Query] (
    [PROCESS_DATE]      DATETIME        NOT NULL,
    [BRANCH]            NVARCHAR (3)    NOT NULL,
    [ACCT_NO]           NVARCHAR (10)   NOT NULL,
    [YEAR_MONTH]        NVARCHAR (7)    NOT NULL,
    [NO_DAY_OV_LMT]     INT             NULL,
    [FROM_YMD_COMM]     DATETIME        NULL,
    [TO_YMD_COMM]       DATETIME        NULL,
    [ACC_COMM_BAL]      DECIMAL (13, 2) NULL,
    [MAX_BAL]           DECIMAL (13, 2) NULL,
    [MIN_BAL]           DECIMAL (13, 2) NULL,
    [NO_DAY_MOVEMT]     SMALLINT        NULL,
    [ACCU_DEBIT_AMT]    DECIMAL (13, 2) NULL,
    [NO_DEBIT_SLIP]     INT             NULL,
    [ACCU_CREDIT_AMT]   DECIMAL (13, 2) NULL,
    [NO_CREDIT_SLIP]    INT             NULL,
    [ACCU_POST_BAL]     DECIMAL (13, 2) NULL,
    [NO_DAY_POST_BAL]   SMALLINT        NULL,
    [ACCU_NEGT_BAL]     DECIMAL (13, 2) NULL,
    [NO_DAY_NEGT_BAL]   SMALLINT        NULL,
    [NO_OUTCLR_CHQ_RET] INT             NULL,
    [TOT_AMT_OUT_CHQ]   DECIMAL (13, 2) NULL,
    [NO_INCL_CHQ_RS1]   INT             NULL,
    [AMT_INCL_CHQ_RS1]  DECIMAL (13, 2) NULL,
    [NO_INCL_CHQ_RS2]   INT             NULL,
    [AMT_INCL_CHQ_RS2]  DECIMAL (13, 2) NULL,
    [NO_INCL_CHQ_RS3]   INT             NULL,
    [AMT_INCL_CHQ_RS3]  DECIMAL (13, 2) NULL,
    [NO_INCL_CHQ_RS5]   INT             NULL,
    [AMT_INCL_CHQ_RS5]  DECIMAL (13, 2) NULL,
    [NO_INCL_CHQ_RS0]   INT             NULL,
    [AMT_INCL_CHQ_RS0]  DECIMAL (13, 2) NULL,
    [TOT_PENALTY_AMT]   DECIMAL (11, 2) NULL,
    [INTEREST]          DECIMAL (11, 2) NULL,
    [AVG_BAL]           DECIMAL (13, 2) NULL,
    [AVG_BAL_FOR_COMM]  DECIMAL (13, 2) NULL
);

