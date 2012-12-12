CREATE TABLE [dbo].[EDW_SME_APPROVE_CHECK_20100731] (
    [LEADER1_SUBJECT_IDEN] NUMERIC (10)    NOT NULL,
    [LEADER1_CA_ID]        VARCHAR (10)    NULL,
    [CIF]                  NUMERIC (20)    NULL,
    [APPROVE_VALUE]        NUMERIC (20, 2) NULL,
    [APPROVE_DATE]         DATETIME        NULL,
    [SNAPPED_FLAG]         CHAR (1)        NULL,
    [DECB_RD]              VARCHAR (50)    NULL
);

