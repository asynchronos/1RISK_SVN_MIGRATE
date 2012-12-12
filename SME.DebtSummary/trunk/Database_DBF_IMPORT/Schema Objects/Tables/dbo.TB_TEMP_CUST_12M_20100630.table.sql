﻿CREATE TABLE [dbo].[TB_TEMP_CUST_12M_20100630] (
    [cif]        INT             NOT NULL,
    [custname]   CHAR (50)       NULL,
    [sing_lim]   NUMERIC (15, 2) NULL,
    [cash_com]   NUMERIC (15, 2) NULL,
    [principal]  NUMERIC (16, 2) NULL,
    [unearnprin] NUMERIC (15, 2) NULL,
    [accru]      NUMERIC (16, 2) NULL,
    [unearnint]  NUMERIC (15, 2) NULL,
    [non_cash]   NUMERIC (15, 2) NULL,
    [n_cash_nfx] NUMERIC (15, 2) NULL,
    [bay_rate]   CHAR (2)        NULL,
    [adjclass]   CHAR (1)        NULL,
    [class_h]    CHAR (24)       NULL,
    [m_aging]    NUMERIC (5, 2)  NULL,
    [age_grp]    CHAR (20)       NULL,
    [aging_h]    CHAR (24)       NULL,
    [tdr]        BIT             NULL,
    [cm_code]    NUMERIC (10)    NULL,
    [cm_name]    CHAR (45)       NULL,
    [cm_grp]     CHAR (5)        NULL,
    [main_br]    NUMERIC (5)     NULL,
    [ctrl_area]  NUMERIC (4)     NULL,
    [org_ctrl]   NUMERIC (4)     NULL,
    [org_flag]   NUMERIC (1)     NULL,
    [rm_port]    CHAR (5)        NULL,
    [port_adj]   CHAR (10)       NULL,
    [mcif]       NUMERIC (10)    NULL,
    [numcust]    NUMERIC (3)     NULL,
    [grp_lim]    NUMERIC (15, 2) NULL,
    [grp_size]   CHAR (30)       NULL,
    [grp_coll]   NUMERIC (15, 2) NULL,
    [grp_ltv]    NUMERIC (11, 2) NULL,
    [gsing_lim]  NUMERIC (15, 2) NULL,
    [busi_type]  NUMERIC (7)     NULL,
    [risk_busi]  NUMERIC (10)    NULL,
    [busi_risk1] NUMERIC (10)    NULL,
    [busi_risk2] NUMERIC (10)    NULL,
    [busi_risk3] NUMERIC (10)    NULL,
    [custsize]   CHAR (30)       NULL,
    [totresv]    NUMERIC (16, 2) NULL,
    [joint_line] CHAR (1)        NULL,
    [mix_line]   CHAR (1)        NULL,
    [coll_co]    CHAR (1)        NULL,
    [g_coll]     NUMERIC (1)     NULL,
    [od_flag]    CHAR (1)        NULL,
    [prn_sugar]  NUMERIC (15, 2) NULL,
    [labor]      NUMERIC (15, 2) NULL,
    [ggrp_size]  CHAR (30)       NULL,
    [ciftype]    NUMERIC (1)     NULL,
    [leader_grp] CHAR (35)       NULL,
    [newbusi]    CHAR (25)       NULL,
    [cust_sta]   CHAR (35)       NULL,
    [cons_ltv]   NUMERIC (11, 2) NULL
);

