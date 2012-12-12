CREATE TABLE [dbo].[Temp_Report_LciDaily_New] (
    [Last_Date_In]     DATETIME       NULL,
    [PROCESS]          NVARCHAR (200) NULL,
    [judgement_detail] NVARCHAR (50)  NULL,
    [cm_code]          NVARCHAR (10)  NULL,
    [cm_name]          NVARCHAR (120) NULL,
    [level_name]       NVARCHAR (255) NULL,
    [controlling_unit] NVARCHAR (70)  NULL,
    [>3 in 6 Month]    INT            NULL,
    [cif]              NUMERIC (10)   NOT NULL,
    [custname]         NVARCHAR (71)  NULL,
    [aging]            NUMERIC (6, 2) NULL,
    [class_h]          VARCHAR (24)   NULL,
    [busi_type]        NVARCHAR (6)   NULL,
    [busi_desc]        VARCHAR (35)   NULL,
    [aging_h]          VARCHAR (24)   NULL
);

