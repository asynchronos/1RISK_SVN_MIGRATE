﻿CREATE TABLE [dbo].[cust_12m_20100831] (
    [cif]        DECIMAL (9)     NOT NULL,
    [custname]   CHAR (50)       NOT NULL,
    [sing_lim]   DECIMAL (15, 2) NOT NULL,
    [cash_com]   DECIMAL (15, 2) NOT NULL,
    [principal]  DECIMAL (16, 2) NOT NULL,
    [unearnprin] DECIMAL (15, 2) NOT NULL,
    [accru]      DECIMAL (16, 2) NOT NULL,
    [unearnint]  DECIMAL (15, 2) NOT NULL,
    [non_cash]   DECIMAL (15, 2) NOT NULL,
    [n_cash_nfx] DECIMAL (15, 2) NOT NULL,
    [bay_rate]   CHAR (2)        NOT NULL,
    [adjclass]   CHAR (1)        NOT NULL,
    [class_h]    CHAR (24)       NOT NULL,
    [m_aging]    DECIMAL (5, 2)  NOT NULL,
    [age_grp]    CHAR (20)       NOT NULL,
    [aging_h]    CHAR (24)       NOT NULL,
    [tdr]        BIT             NOT NULL,
    [cm_code]    DECIMAL (10)    NOT NULL,
    [cm_name]    CHAR (45)       NOT NULL,
    [cm_grp]     CHAR (5)        NOT NULL,
    [dept_ctrl]  DECIMAL (4)     NOT NULL,
    [main_br]    DECIMAL (5)     NOT NULL,
    [ctrl_area]  DECIMAL (4)     NOT NULL,
    [org_ctrl]   DECIMAL (4)     NOT NULL,
    [org_flag]   DECIMAL (1)     NOT NULL,
    [rm_port]    CHAR (5)        NOT NULL,
    [port_adj]   CHAR (10)       NOT NULL,
    [mcif]       DECIMAL (10)    NOT NULL,
    [numcust]    DECIMAL (3)     NOT NULL,
    [grp_lim]    DECIMAL (15, 2) NOT NULL,
    [grp_size]   CHAR (30)       NOT NULL,
    [grp_coll]   DECIMAL (15, 2) NOT NULL,
    [grp_ltv]    DECIMAL (9, 2)  NOT NULL,
    [gsing_lim]  DECIMAL (15, 2) NOT NULL,
    [busi_type]  DECIMAL (7)     NOT NULL,
    [risk_busi]  DECIMAL (10)    NOT NULL,
    [busi_risk1] DECIMAL (10)    NOT NULL,
    [busi_risk2] DECIMAL (10)    NOT NULL,
    [busi_risk3] DECIMAL (10)    NOT NULL,
    [custsize]   CHAR (30)       NOT NULL,
    [totresv]    DECIMAL (16, 2) NOT NULL,
    [joint_line] CHAR (1)        NOT NULL,
    [mix_line]   CHAR (1)        NOT NULL,
    [coll_co]    CHAR (1)        NOT NULL,
    [g_coll]     DECIMAL (1)     NOT NULL,
    [od_flag]    CHAR (1)        NOT NULL,
    [prn_sugar]  DECIMAL (15, 2) NOT NULL,
    [labor]      DECIMAL (15, 2) NOT NULL,
    [ggrp_size]  CHAR (30)       NOT NULL,
    [ciftype]    DECIMAL (1)     NOT NULL,
    [leader_grp] CHAR (35)       NOT NULL,
    [newbusi]    CHAR (25)       NOT NULL,
    [cust_sta]   CHAR (35)       NOT NULL,
    [cons_ltv]   DECIMAL (9, 2)  NOT NULL
);
