/*
Deployment script for SME
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SME"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL)
	BEGIN
		DECLARE @rc      int,                       -- return code
				@fn      nvarchar(4000),            -- file name to back up to
				@dir     nvarchar(4000)             -- backup directory

		EXEC @rc = [master].[dbo].[xp_instance_regread] N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'BackupDirectory', @dir output, 'no_output'

		IF (@dir IS NULL)
		BEGIN 
			EXEC @rc = [master].[dbo].[xp_instance_regread] N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultData', @dir output, 'no_output'
		END

		IF (@dir IS NULL)
		BEGIN
			EXEC @rc = [master].[dbo].[xp_instance_regread] N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\Setup', N'SQLDataRoot', @dir output, 'no_output'
			SELECT @dir = @dir + N'\Backup'
		END

		SELECT  @fn = @dir + N'\' + N'$(DatabaseName)' + N'-' + 
				CONVERT(nchar(8), GETDATE(), 112) + N'-' + 
				RIGHT(N'0' + RTRIM(CONVERT(nchar(2), DATEPART(hh, GETDATE()))), 2) + 
				RIGHT(N'0' + RTRIM(CONVERT(nchar(2), DATEPART(mi, getdate()))), 2) + 
				RIGHT(N'0' + RTRIM(CONVERT(nchar(2), DATEPART(ss, getdate()))), 2) + 
				N'.bak' 
				BACKUP DATABASE [$(DatabaseName)] TO DISK = @fn
	END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE Thai_CI_AS
GO
EXECUTE sp_dbcmptlevel [$(DatabaseName)], 100;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY CHECKSUM,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)]

GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Creating [CLASSIFY]...';


GO
CREATE SCHEMA [CLASSIFY]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [COMMON]...';


GO
CREATE SCHEMA [COMMON]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [CUSTOMER]...';


GO
CREATE SCHEMA [CUSTOMER]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [EMPLOYEE]...';


GO
CREATE SCHEMA [EMPLOYEE]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [SS]...';


GO
CREATE SCHEMA [SS]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [CLASSIFY].[APP_PROFILE]...';


GO
CREATE TABLE [CLASSIFY].[APP_PROFILE] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [APP_KEY]            INT           NULL,
    [EMP_ID]             VARCHAR (10)  NULL,
    [CREATE_DATE]        DATETIME      NULL,
    [EXPIRE_DATE]        DATETIME      NULL,
    [LAST_ACTIVITY]      NVARCHAR (50) NULL,
    [LAST_ACTIVITY_DATE] DATETIME      NULL,
    [IS_AUTHENTICATED]   BIT           NULL,
    [DEL_FLAG]           BIT           NULL
);


GO
PRINT N'Creating PK_APP_PROFILE...';


GO
ALTER TABLE [CLASSIFY].[APP_PROFILE]
    ADD CONSTRAINT [PK_APP_PROFILE] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[APP_PROFILE].[IX_APP_PROFILE]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_APP_PROFILE]
    ON [CLASSIFY].[APP_PROFILE]([APP_KEY] ASC, [EMP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = ON, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[APPLICATION]...';


GO
CREATE TABLE [CLASSIFY].[APPLICATION] (
    [APP_KEY]  INT           IDENTITY (1, 1) NOT NULL,
    [APP_DESC] NVARCHAR (50) NOT NULL,
    [PRIORITY] INT           NULL,
    [DEL_FLAG] BIT           NULL
);


GO
PRINT N'Creating PK_APPLICATION...';


GO
ALTER TABLE [CLASSIFY].[APPLICATION]
    ADD CONSTRAINT [PK_APPLICATION] PRIMARY KEY CLUSTERED ([APP_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_CUS]...';


GO
CREATE TABLE [CLASSIFY].[CATE_AND_CUS] (
    [ID]           INT IDENTITY (1, 1) NOT NULL,
    [CATEGORY_KEY] INT NOT NULL,
    [CIF]          INT NOT NULL,
    [DEL_FLAG]     BIT NULL
);


GO
PRINT N'Creating PK_CATE_AND_CUS...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_CUS]
    ADD CONSTRAINT [PK_CATE_AND_CUS] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_CUS].[IX_CATE_AND_CUS]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CATE_AND_CUS]
    ON [CLASSIFY].[CATE_AND_CUS]([CATEGORY_KEY] ASC, [CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_EMP]...';


GO
CREATE TABLE [CLASSIFY].[CATE_AND_EMP] (
    [ID]            INT          IDENTITY (1, 1) NOT NULL,
    [CATEGORY_KEY]  INT          NOT NULL,
    [EMP_ID]        VARCHAR (10) NOT NULL,
    [HEAD_PRIORITY] INT          NULL,
    [DEL_FLAG]      BIT          NULL
);


GO
PRINT N'Creating PK_CATE_AND_EMP...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_EMP]
    ADD CONSTRAINT [PK_CATE_AND_EMP] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_EMP].[IX_CATE_AND_EMP]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CATE_AND_EMP]
    ON [CLASSIFY].[CATE_AND_EMP]([CATEGORY_KEY] ASC, [EMP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_MENU]...';


GO
CREATE TABLE [CLASSIFY].[CATE_AND_MENU] (
    [ID]           INT IDENTITY (1, 1) NOT NULL,
    [CATEGORY_KEY] INT NULL,
    [MENU_KEY]     INT NULL,
    [DEL_FLAG]     BIT NULL
);


GO
PRINT N'Creating PK_CATE_AND_MENU...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_MENU]
    ADD CONSTRAINT [PK_CATE_AND_MENU] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_AND_MENU].[IX_CATE_AND_MENU]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CATE_AND_MENU]
    ON [CLASSIFY].[CATE_AND_MENU]([CATEGORY_KEY] ASC, [MENU_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_LINK_CATE]...';


GO
CREATE TABLE [CLASSIFY].[CATE_LINK_CATE] (
    [ID]                   INT IDENTITY (1, 1) NOT NULL,
    [CATEGORY_KEY]         INT NOT NULL,
    [LINK_TO_CATEGORY_KEY] INT NOT NULL,
    [LINKED_TYPE_KEY]      INT NOT NULL,
    [DEL_FLAG]             BIT NULL
);


GO
PRINT N'Creating PK_CATE_LINK_CATE...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE]
    ADD CONSTRAINT [PK_CATE_LINK_CATE] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_LINK_CATE].[IX_CATE_LINK_CATE]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CATE_LINK_CATE]
    ON [CLASSIFY].[CATE_LINK_CATE]([CATEGORY_KEY] ASC, [LINK_TO_CATEGORY_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATE_LINK_CATE_TYPE]...';


GO
CREATE TABLE [CLASSIFY].[CATE_LINK_CATE_TYPE] (
    [LINKED_TYPE_KEY] INT          IDENTITY (1, 1) NOT NULL,
    [DESCRIPTION]     VARCHAR (50) NOT NULL,
    [DEL_FLAG]        BIT          NULL
);


GO
PRINT N'Creating PK_CATE_LINK_CATE_TYPE...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE_TYPE]
    ADD CONSTRAINT [PK_CATE_LINK_CATE_TYPE] PRIMARY KEY CLUSTERED ([LINKED_TYPE_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATEGORY]...';


GO
CREATE TABLE [CLASSIFY].[CATEGORY] (
    [CATEGORY_KEY]      INT            IDENTITY (1, 1) NOT NULL,
    [CATEGORY_DESC]     VARCHAR (100)  NULL,
    [CATEGORY_DESC_TH]  NVARCHAR (100) NULL,
    [CATEGORY_VALUE]    NVARCHAR (20)  NULL,
    [CATEGORY_TYPE_KEY] INT            NULL,
    [PRIORITY]          INT            NULL,
    [DEL_FLAG]          BIT            NULL
);


GO
PRINT N'Creating PK_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATEGORY]
    ADD CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED ([CATEGORY_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[CATEGORY_TYPE]...';


GO
CREATE TABLE [CLASSIFY].[CATEGORY_TYPE] (
    [CATEGORY_TYPE_KEY]     INT           IDENTITY (1, 1) NOT NULL,
    [CATEGORY_TYPE_DESC]    VARCHAR (50)  NULL,
    [CATEGORY_TYPE_DESC_TH] NVARCHAR (50) NULL,
    [CATEGORY_TYPE_VALUE]   NVARCHAR (20) NULL,
    [PRIORITY]              INT           NULL,
    [DEL_FLAG]              BIT           NULL
);


GO
PRINT N'Creating PK_CATEGORY_TYPE...';


GO
ALTER TABLE [CLASSIFY].[CATEGORY_TYPE]
    ADD CONSTRAINT [PK_CATEGORY_TYPE] PRIMARY KEY CLUSTERED ([CATEGORY_TYPE_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CLASSIFY].[MENU_MASTER]...';


GO
CREATE TABLE [CLASSIFY].[MENU_MASTER] (
    [MENU_KEY]        INT           IDENTITY (1, 1) NOT NULL,
    [MENU_TITLE]      NVARCHAR (50) NULL,
    [MENU_URL]        NVARCHAR (50) NULL,
    [MENU_POPUP_OPT]  NVARCHAR (50) NULL,
    [MENU_REL]        NVARCHAR (50) NULL,
    [MENU_TOOLTIP]    NVARCHAR (50) NULL,
    [MENU_PRIORITY]   INT           NULL,
    [MENU_DEL_FLAG]   BIT           NULL,
    [MENU_PARENT_KEY] INT           NULL
);


GO
PRINT N'Creating PK_MENU_MASTER...';


GO
ALTER TABLE [CLASSIFY].[MENU_MASTER]
    ADD CONSTRAINT [PK_MENU_MASTER] PRIMARY KEY CLUSTERED ([MENU_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[BUSINESS_DESTINATION]...';


GO
CREATE TABLE [CUSTOMER].[BUSINESS_DESTINATION] (
    [BUSINESS_DESTINATION_ID]   NUMERIC (3)    IDENTITY (1, 1) NOT NULL,
    [BUSINESS_DESTINATION_DESC] NVARCHAR (100) NULL,
    [PRIORITY]                  INT            NULL
);


GO
PRINT N'Creating PK_BUSINESS_DESTINATION...';


GO
ALTER TABLE [CUSTOMER].[BUSINESS_DESTINATION]
    ADD CONSTRAINT [PK_BUSINESS_DESTINATION] PRIMARY KEY CLUSTERED ([BUSINESS_DESTINATION_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[ByCus_CIF]...';


GO
CREATE TABLE [CUSTOMER].[ByCus_CIF] (
    [Cif]             INT           NOT NULL,
    [Name]            NVARCHAR (80) NULL,
    [BOTID]           INT           NULL,
    [BaySize]         NVARCHAR (16) NULL,
    [BaySizeNo]       TINYINT       NULL,
    [Rating]          NVARCHAR (3)  NULL,
    [BizTypeE]        NVARCHAR (30) NULL,
    [Busi_Type]       INT           NULL,
    [BranchMaxPrin]   SMALLINT      NULL,
    [AgingOK]         MONEY         NULL,
    [AgingMax]        MONEY         NULL,
    [Class]           NVARCHAR (1)  NULL,
    [ClassE]          NVARCHAR (4)  NULL,
    [PrincipalFull]   MONEY         NULL,
    [Principal]       MONEY         NULL,
    [PrinCom]         MONEY         NULL,
    [PrinRetail]      MONEY         NULL,
    [Cont]            MONEY         NULL,
    [ContIAS]         MONEY         NULL,
    [Contingent]      MONEY         NULL,
    [Contingent_EFW]  MONEY         NULL,
    [AccruFull]       MONEY         NULL,
    [Accru]           MONEY         NULL,
    [SuspOri]         MONEY         NULL,
    [Susp]            MONEY         NULL,
    [UNEARNPRIN]      MONEY         NULL,
    [UNEARNINT]       MONEY         NULL,
    [UNCLEAPRIN]      MONEY         NULL,
    [UNCLEAINT]       MONEY         NULL,
    [DEFER]           MONEY         NULL,
    [UseValue]        MONEY         NULL,
    [BAfterC]         MONEY         NULL,
    [TdrLoss]         MONEY         NULL,
    [Reserve]         MONEY         NULL,
    [PVLOSS]          MONEY         NULL,
    [AddResv]         MONEY         NULL,
    [Totresv]         MONEY         NULL,
    [Full_IAS39]      MONEY         NULL,
    [AddResv_IAS39]   MONEY         NULL,
    [ResvFull]        MONEY         NULL,
    [CusDeptFlag]     TINYINT       NULL,
    [CusDeptTran]     INT           NULL,
    [Office_Id_CIM]   FLOAT         NULL,
    [AO_SME]          FLOAT         NULL,
    [Office_Id]       FLOAT         NULL,
    [Affiliate]       BIT           NOT NULL,
    [NplFlag]         NVARCHAR (3)  NULL,
    [FirstSMHistory]  DATETIME      NULL,
    [FirstSMDate]     DATETIME      NULL,
    [FirstSMYear]     INT           NULL,
    [FirstSMYear1]    INT           NULL,
    [LastSMCount]     INT           NULL,
    [LastSMDate]      DATETIME      NULL,
    [LastSMYear]      INT           NULL,
    [LastSMYear1]     INT           NULL,
    [SMMonthFirst]    INT           NULL,
    [SMMonthLast]     INT           NULL,
    [FirstNplHistory] DATETIME      NULL,
    [FirstNplDate]    DATETIME      NULL,
    [FirstNplYear]    INT           NULL,
    [FirstNplYear1]   INT           NULL,
    [LastNplCount]    INT           NULL,
    [LastNplDate]     DATETIME      NULL,
    [LastNplYear]     INT           NULL,
    [LastNplYear1]    INT           NULL,
    [NplMonthFirst]   INT           NULL,
    [NplMonthLast]    INT           NULL,
    [TdrFlag]         NVARCHAR (6)  NULL,
    [GDR]             NVARCHAR (1)  NULL,
    [TdrFirst]        INT           NULL,
    [Count]           TINYINT       NULL,
    [Date_Report]     INT           NULL,
    [DateReport]      NVARCHAR (7)  NULL,
    [DateRegister]    NVARCHAR (7)  NULL,
    [BOT]             NVARCHAR (10) NULL,
    [BOTYear]         NVARCHAR (15) NULL,
    [BOTClassAfter]   NVARCHAR (1)  NULL,
    [BOT1]            NVARCHAR (3)  NULL,
    [BOTYear1]        NVARCHAR (10) NULL,
    [BOTClass1]       NVARCHAR (1)  NULL,
    [CDR]             NVARCHAR (3)  NULL,
    [CDRYear]         NVARCHAR (10) NULL,
    [CDRClass]        NVARCHAR (1)  NULL,
    [CM_Dep]          NVARCHAR (10) NULL,
    [CM_Flag]         NVARCHAR (15) NULL,
    [CM_Group]        NVARCHAR (15) NULL,
    [CM_Temp]         NVARCHAR (15) NULL,
    [CM_Id_Ao]        FLOAT         NULL,
    [CM_Ao]           NVARCHAR (15) NULL,
    [CM_AoTel]        NVARCHAR (15) NULL,
    [RM_Dep]          NVARCHAR (10) NULL,
    [RM_Group]        NVARCHAR (15) NULL,
    [RM_Temp]         NVARCHAR (15) NULL,
    [RM_Id_Ao]        FLOAT         NULL,
    [RM_Ao]           NVARCHAR (15) NULL,
    [RM_AoTel]        NVARCHAR (15) NULL
);


GO
PRINT N'Creating PK_ByCus_CIF...';


GO
ALTER TABLE [CUSTOMER].[ByCus_CIF]
    ADD CONSTRAINT [PK_ByCus_CIF] PRIMARY KEY CLUSTERED ([Cif] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER] (
    [CIF]        INT            NOT NULL,
    [CUS_TITLE]  NVARCHAR (10)  NULL,
    [CUS_FIRST]  NVARCHAR (30)  NULL,
    [CUS_LAST]   NVARCHAR (30)  NULL,
    [CUS1_TITLE] NVARCHAR (10)  NULL,
    [CUS1_FIRST] NVARCHAR (30)  NULL,
    [CUS1_LAST]  NVARCHAR (30)  NULL,
    [CUS2_TITLE] NVARCHAR (10)  NULL,
    [CUS2_FIRST] NVARCHAR (30)  NULL,
    [CUS2_LAST]  NVARCHAR (30)  NULL,
    [CUS3_TITLE] NVARCHAR (10)  NULL,
    [CUS3_FIRST] NVARCHAR (30)  NULL,
    [CUS3_LAST]  NVARCHAR (30)  NULL,
    [CTITLE_E]   NVARCHAR (15)  NULL,
    [CFIRST_E]   NVARCHAR (40)  NULL,
    [CLAST_E]    NVARCHAR (40)  NULL,
    [CifType]    NVARCHAR (1)   NULL,
    [BOTID]      INT            NULL,
    [MAIN_CUST]  INT            NULL,
    [GROUP_CUST] NVARCHAR (1)   NULL,
    [GROUPCIF]   INT            NULL,
    [BAYDATE]    DATETIME       NULL,
    [TYP_RATE]   NVARCHAR (1)   NULL,
    [BAYRATING]  NVARCHAR (2)   NULL,
    [RATING]     NVARCHAR (5)   NULL,
    [ADDR1]      NVARCHAR (110) NULL,
    [ADDR2]      NVARCHAR (70)  NULL,
    [PROV]       NVARCHAR (2)   NULL,
    [PROV_DESC]  NVARCHAR (30)  NULL,
    [ZIPCODE]    INT            NULL,
    [TEL_HOME]   NVARCHAR (20)  NULL,
    [ADDRWORK1]  NVARCHAR (110) NULL,
    [ADDRWORK2]  NVARCHAR (70)  NULL,
    [PROVSHOP]   NVARCHAR (2)   NULL,
    [PROVSHOP_D] NVARCHAR (30)  NULL,
    [ZIPSHOP]    INT            NULL,
    [TEL_OFF]    NVARCHAR (20)  NULL,
    [TAX_NO]     NVARCHAR (10)  NULL,
    [CUS_TYPE]   NVARCHAR (4)   NULL,
    [BUSI_TYPE]  NVARCHAR (6)   NULL,
    [NETFAS]     INT            NULL,
    [AUTHOCAP]   INT            NULL,
    [PAIDUP]     INT            NULL,
    [LANDVAL]    INT            NULL,
    [CLASS]      NVARCHAR (1)   NULL,
    [IDCARD]     NVARCHAR (13)  NULL,
    [CITIZEN]    NVARCHAR (3)   NULL,
    [OFFICR_ID]  BIGINT         NULL,
    [DATEFAS]    DATETIME       NULL,
    [BEINGCUST]  DATETIME       NULL,
    [BTHDATE]    DATETIME       NULL,
    [DEPTFLAGH]  TINYINT        NULL,
    [DEPTHIST]   INT            NULL,
    [DEPTFLAG]   TINYINT        NULL,
    [DEPTTRAN]   INT            NULL,
    [CIF0]       INT            NULL,
    [CIF1]       INT            NULL,
    [CIF2]       INT            NULL,
    [CIF3]       INT            NULL,
    [CIF4]       INT            NULL,
    [CIF5]       INT            NULL,
    [CIF6]       INT            NULL,
    [CIF7]       INT            NULL,
    [CIF8]       INT            NULL,
    [CIF9]       INT            NULL,
    [TDR_AGING]  INT            NULL,
    [TDR_DATE]   NVARCHAR (6)   NULL,
    [AO_SME]     NVARCHAR (10)  NULL,
    [CIFSUGAR]   INT            NULL,
    [REV_CLASS]  NVARCHAR (1)   NULL,
    [BOT_CLASS]  NVARCHAR (1)   NULL,
    [ACC_CLASS]  NVARCHAR (1)   NULL,
    [STOPACCRU]  NVARCHAR (1)   NULL,
    [SEX]        CHAR (1)       NULL,
    [CARDTYPE]   NVARCHAR (10)  NULL,
    [CARDNO]     NVARCHAR (10)  NULL
);


GO
PRINT N'Creating PK_CUSTOMER...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER]
    ADD CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED ([CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_SME]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_SME] (
    [CIF]                     INT           NOT NULL,
    [GROUP_ID]                INT           NULL,
    [CM_CODE]                 NVARCHAR (10) NULL,
    [OLD_CM_CODE]             NVARCHAR (10) NULL,
    [BRANCH_ID]               SMALLINT      NULL,
    [JUDGEMENT_ID]            NVARCHAR (5)  NULL,
    [BUSI_RISK1_ID]           VARCHAR (8)   NULL,
    [BUSI_RISK2_ID]           VARCHAR (8)   NULL,
    [BUSI_RISK3_ID]           VARCHAR (8)   NULL,
    [BUSINESS_DESTINATION_ID] NUMERIC (3)   NULL,
    [EXPORT_WEIGHT]           NUMERIC (3)   NULL,
    [LOCAL_WEIGHT]            NUMERIC (3)   NULL,
    [STATUS_ID]               INT           NULL,
    [SIZE_ID]                 INT           NULL,
    [UPDATE_DATE]             DATETIME      NOT NULL,
    [UPDATE_BY]               NVARCHAR (10) NULL,
    [RATING_TYPE_KEY]         INT           NULL,
    [RATING_KEY]              INT           NULL,
    [RATING_UPDATE_DATE]      DATETIME      NULL,
    [EXTERNAL_SOURCE_MEMO]    NTEXT         NULL,
    [NEXT_REVIEW_DATE]        DATETIME      NULL
);


GO
PRINT N'Creating PK_CUSTOMER_SME...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [PK_CUSTOMER_SME] PRIMARY KEY CLUSTERED ([CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_SME_GROUP]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_SME_GROUP] (
    [GROUP_ID]         INT           NOT NULL,
    [GROUP_SIZE_ID]    SMALLINT      NOT NULL,
    [UPDATE_DATE]      DATETIME      NOT NULL,
    [UPDATE_BY]        NVARCHAR (10) NOT NULL,
    [GROUP_EXPOSURE]   MONEY         NULL,
    [NEXT_REVIEW_DATE] DATETIME      NULL
);


GO
PRINT N'Creating PK_CUSTOMER_SME_GROUP...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_GROUP]
    ADD CONSTRAINT [PK_CUSTOMER_SME_GROUP] PRIMARY KEY CLUSTERED ([GROUP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_SME_RATING]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_SME_RATING] (
    [RATING_KEY]      INT           IDENTITY (1, 1) NOT NULL,
    [RATING_CODE]     NVARCHAR (10) NULL,
    [RATING_TYPE_KEY] INT           NOT NULL,
    [RATING_DESC]     NVARCHAR (50) NULL,
    [PRIORITY]        INT           NULL
);


GO
PRINT N'Creating PK_CUSTOMER_SME_RATING...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING]
    ADD CONSTRAINT [PK_CUSTOMER_SME_RATING] PRIMARY KEY CLUSTERED ([RATING_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_SME_RATING_TYPE]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_SME_RATING_TYPE] (
    [RATING_TYPE_KEY]  INT           IDENTITY (1, 1) NOT NULL,
    [RATING_TYPE_CODE] NVARCHAR (10) NULL,
    [RATING_TYPE_DESC] NVARCHAR (50) NULL,
    [PRIORITY]         INT           NULL
);


GO
PRINT N'Creating PK_CUSTOMER_SME_RATING_TYPE...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING_TYPE]
    ADD CONSTRAINT [PK_CUSTOMER_SME_RATING_TYPE] PRIMARY KEY CLUSTERED ([RATING_TYPE_KEY] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_SME_SIZE]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_SME_SIZE] (
    [SIZE_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [SIZE_DETAIL] NVARCHAR (50) NULL,
    [PRIORITY]    INT           NULL
);


GO
PRINT N'Creating PK_CUSTOMER_SME_SIZE...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_SIZE]
    ADD CONSTRAINT [PK_CUSTOMER_SME_SIZE] PRIMARY KEY CLUSTERED ([SIZE_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [CUSTOMER].[CUSTOMER_STATUS]...';


GO
CREATE TABLE [CUSTOMER].[CUSTOMER_STATUS] (
    [STATUS_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [STATUS_DETAIL] NVARCHAR (50) NULL,
    [PRIORITY]      INT           NULL
);


GO
PRINT N'Creating PK_CUSTOMER_STATUS...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_STATUS]
    ADD CONSTRAINT [PK_CUSTOMER_STATUS] PRIMARY KEY CLUSTERED ([STATUS_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [EMPLOYEE].[TB_EMPLOYEE]...';


GO
CREATE TABLE [EMPLOYEE].[TB_EMPLOYEE] (
    [EMP_ID]          VARCHAR (10)   NOT NULL,
    [TITLE_CODE]      TINYINT        NULL,
    [EMPNAME]         VARCHAR (50)   NULL,
    [EMPSURNAME]      VARCHAR (50)   NULL,
    [EMPNAME_E]       NVARCHAR (50)  NULL,
    [EMPSURNAME_E]    NVARCHAR (50)  NULL,
    [EMAIL]           VARCHAR (50)   NULL,
    [IDCARD]          VARCHAR (50)   NULL,
    [TAX_NO]          VARCHAR (50)   NULL,
    [ACCNO]           VARCHAR (16)   NULL,
    [ADDRESS]         VARCHAR (30)   NULL,
    [SOI]             VARCHAR (20)   NULL,
    [ROAD]            VARCHAR (30)   NULL,
    [LOCALITY]        VARCHAR (30)   NULL,
    [DISTRINCT]       VARCHAR (30)   NULL,
    [PROV_CODE]       VARCHAR (2)    NULL,
    [ZIPCODE]         VARCHAR (50)   NULL,
    [TEL_HOME]        VARCHAR (30)   NULL,
    [TEL_MOBILE]      VARCHAR (20)   NULL,
    [TEL_INDOOR]      VARCHAR (30)   NULL,
    [DATEOFBIRTH]     DATETIME       NULL,
    [IMAGENAME]       VARCHAR (20)   NULL,
    [DATEOFSTART]     DATETIME       NULL,
    [STATUS]          CHAR (1)       NULL,
    [TEAM_ID]         NVARCHAR (10)  NULL,
    [GROUP_HEAD]      CHAR (1)       NULL,
    [ROLE]            TINYINT        NULL,
    [PERMIT]          CHAR (1)       NULL,
    [USERNAME]        NVARCHAR (10)  NULL,
    [PASSWD]          NVARCHAR (20)  NULL,
    [UP_DT]           DATETIME       NULL,
    [Dept]            SMALLINT       NULL,
    [Id_Region]       SMALLINT       NULL,
    [Id_Branch]       SMALLINT       NULL,
    [POSITION_CODE]   VARCHAR (50)   NULL,
    [Id_Region_Group] NVARCHAR (255) NULL,
    [Id_Branch_Group] NVARCHAR (255) NULL,
    [Id_Group_Group]  NTEXT          NULL,
    [level_id]        NCHAR (1)      NULL
);


GO
PRINT N'Creating PK_TB_EMPLOYEE...';


GO
ALTER TABLE [EMPLOYEE].[TB_EMPLOYEE]
    ADD CONSTRAINT [PK_TB_EMPLOYEE] PRIMARY KEY CLUSTERED ([EMP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [EMPLOYEE].[TB_TITLE]...';


GO
CREATE TABLE [EMPLOYEE].[TB_TITLE] (
    [TITLE_CODE]   TINYINT      NOT NULL,
    [TITLE_NAME]   VARCHAR (20) NOT NULL,
    [TITLE_NAME_E] VARCHAR (20) NULL
);


GO
PRINT N'Creating PK_TB_TITLE...';


GO
ALTER TABLE [EMPLOYEE].[TB_TITLE]
    ADD CONSTRAINT [PK_TB_TITLE] PRIMARY KEY CLUSTERED ([TITLE_CODE] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [EMPLOYEE].[USER_DATA]...';


GO
CREATE TABLE [EMPLOYEE].[USER_DATA] (
    [EMP_ID]                VARCHAR (10)  NOT NULL,
    [EMP_TITLE]             NVARCHAR (20) NOT NULL,
    [EMP_NAME]              NVARCHAR (50) NOT NULL,
    [EMP_SURNAME]           NVARCHAR (50) NOT NULL,
    [EMP_TITLE_E]           NVARCHAR (20) NULL,
    [EMP_NAME_E]            NVARCHAR (50) NULL,
    [EMP_SURNAME_E]         NVARCHAR (50) NULL,
    [PASSWD]                NVARCHAR (20) NULL,
    [EMAIL]                 NVARCHAR (50) NULL,
    [CREATE_DATE]           DATETIME      NULL,
    [UPDATE_DATE]           DATETIME      NULL,
    [LAST_SIGN_ON_DATE]     DATETIME      NULL,
    [LAST_CHANGE_PASS_DATE] DATETIME      NULL,
    [DEL_FLAG]              BIT           NULL
);


GO
PRINT N'Creating PK_USER_DATA...';


GO
ALTER TABLE [EMPLOYEE].[USER_DATA]
    ADD CONSTRAINT [PK_USER_DATA] PRIMARY KEY CLUSTERED ([EMP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[BUSINESS_GROUP]...';


GO
CREATE TABLE [SS].[BUSINESS_GROUP] (
    [BUSINESS_GROUP_ID]   INT           NOT NULL,
    [BUSINESS_GROUP_NAME] NVARCHAR (50) NULL
);


GO
PRINT N'Creating PK_BUSINESS_GROUP...';


GO
ALTER TABLE [SS].[BUSINESS_GROUP]
    ADD CONSTRAINT [PK_BUSINESS_GROUP] PRIMARY KEY CLUSTERED ([BUSINESS_GROUP_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[BUSINESS_TYPE]...';


GO
CREATE TABLE [SS].[BUSINESS_TYPE] (
    [BUSINESS_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [BUSINESS_CODE]     FLOAT          NULL,
    [BUSINESS_NAME]     NVARCHAR (255) NULL,
    [BUSINESS_GROUP_ID] FLOAT          NULL,
    [MARGIN]            FLOAT          NULL,
    [DSCR]              FLOAT          NULL,
    [AP]                FLOAT          NULL,
    [AR]                FLOAT          NULL,
    [STOCK]             FLOAT          NULL,
    [LTV]               FLOAT          NULL,
    [WORKING_CAPITAL]   FLOAT          NULL,
    [RATE]              FLOAT          NULL,
    [CONTRACT]          FLOAT          NULL
);


GO
PRINT N'Creating PK_BUSINESS_TYPE...';


GO
ALTER TABLE [SS].[BUSINESS_TYPE]
    ADD CONSTRAINT [PK_BUSINESS_TYPE] PRIMARY KEY CLUSTERED ([BUSINESS_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[BUSINESS_TYPE_SS]...';


GO
CREATE TABLE [SS].[BUSINESS_TYPE_SS] (
    [BUSINESS_ID]       FLOAT          NOT NULL,
    [BUSINESS_NAME]     NVARCHAR (255) NULL,
    [BUSINESS_GROUP_ID] FLOAT          NULL,
    [MARGIN]            FLOAT          NULL,
    [DSCR]              FLOAT          NULL,
    [AP]                FLOAT          NULL,
    [AR]                FLOAT          NULL,
    [STOCK]             FLOAT          NULL,
    [LTV]               FLOAT          NULL,
    [WORKING_CAPITAL]   FLOAT          NULL,
    [RATE]              FLOAT          NULL,
    [CONTRACT]          FLOAT          NULL
);


GO
PRINT N'Creating PK_BUSINESS_TYPE_SS...';


GO
ALTER TABLE [SS].[BUSINESS_TYPE_SS]
    ADD CONSTRAINT [PK_BUSINESS_TYPE_SS] PRIMARY KEY CLUSTERED ([BUSINESS_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[COLLATERAL_TYPE]...';


GO
CREATE TABLE [SS].[COLLATERAL_TYPE] (
    [COL_TYPE_ID]   INT           NOT NULL,
    [COL_TYPE_NAME] NVARCHAR (50) NULL,
    [USE_VALUE]     INT           NULL,
    [TOTAL_AMOUNT]  INT           NULL
);


GO
PRINT N'Creating PK_COLLATERAL_TYPE...';


GO
ALTER TABLE [SS].[COLLATERAL_TYPE]
    ADD CONSTRAINT [PK_COLLATERAL_TYPE] PRIMARY KEY CLUSTERED ([COL_TYPE_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_CIF]...';


GO
CREATE TABLE [SS].[FINANCIAL_CIF] (
    [SMES_ID]  INT           NOT NULL,
    [CIF]      INT           NULL,
    [BUS_CODE] NVARCHAR (10) NULL
);


GO
PRINT N'Creating PK_FINANCIAL_CIF...';


GO
ALTER TABLE [SS].[FINANCIAL_CIF]
    ADD CONSTRAINT [PK_FINANCIAL_CIF] PRIMARY KEY CLUSTERED ([SMES_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_CUSTOMER]...';


GO
CREATE TABLE [SS].[FINANCIAL_CUSTOMER] (
    [SMES_ID]              INT           NOT NULL,
    [CREATE_USER]          NVARCHAR (10) NULL,
    [CREATE_DATE]          DATETIME      NULL,
    [UPDATE_USER]          NVARCHAR (10) NULL,
    [UPDATE_DATE]          DATETIME      NULL,
    [CIF]                  INT           NULL,
    [CUSTOMER_TYPE]        NVARCHAR (4)  NULL,
    [BIRTH_DATE]           DATETIME      NULL,
    [NATIONALITY_LIST_ID]  NVARCHAR (4)  NULL,
    [EXPERIENCE]           INT           NULL,
    [JURISTIC_LIST_ID]     NVARCHAR (4)  NULL,
    [REGISTER_DATE]        DATETIME      NULL,
    [OPERATE_DATE]         DATETIME      NULL,
    [BLACKLIST_LIST_ID]    NVARCHAR (4)  NULL,
    [NCB_LIST_ID]          NVARCHAR (4)  NULL,
    [NCB_CODE]             NVARCHAR (4)  NULL,
    [TDR_LIST_ID]          NVARCHAR (4)  NULL,
    [RATING_LISt_ID]       NVARCHAR (4)  NULL,
    [LEGAL_LIST_ID]        NVARCHAR (4)  NULL,
    [REGIS_DOC_LIST_ID]    NVARCHAR (4)  NULL,
    [SHAREHOLDER_LIST_ID]  NVARCHAR (4)  NULL,
    [BNATIONALITY_LIST_ID] NVARCHAR (4)  NULL
);


GO
PRINT N'Creating PK_FINANCIAL_CUSTOMER...';


GO
ALTER TABLE [SS].[FINANCIAL_CUSTOMER]
    ADD CONSTRAINT [PK_FINANCIAL_CUSTOMER] PRIMARY KEY CLUSTERED ([SMES_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_DATA]...';


GO
CREATE TABLE [SS].[FINANCIAL_DATA] (
    [SMES_DATA_ID]                        INT           IDENTITY (1, 1) NOT NULL,
    [SMES_ID]                             INT           NOT NULL,
    [SMES_TYPE]                           INT           NOT NULL,
    [CREATE_USER]                         NVARCHAR (10) NULL,
    [CREATE_DATE]                         DATETIME      NULL,
    [UPDATE_USER]                         NVARCHAR (10) NULL,
    [UPDATE_DATE]                         DATETIME      NULL,
    [SALES]                               FLOAT         NULL,
    [COST_OF_SALES]                       FLOAT         NULL,
    [COST_OF_SALES_PERCENT]               FLOAT         NULL,
    [CREDIT_SALE]                         FLOAT         NULL,
    [CREDIT_TERM]                         INT           NULL,
    [PURCHASE]                            FLOAT         NULL,
    [CREDIT_PURCHASE]                     FLOAT         NULL,
    [TERM_PURCHASE]                       INT           NULL,
    [OPERATING_EXPENSES]                  FLOAT         NULL,
    [OPERATING_EXPENSES_PERCENT]          FLOAT         NULL,
    [DEFAULT_MARGIN]                      FLOAT         NULL,
    [GROSS_PROFIT]                        FLOAT         NULL,
    [TAX]                                 FLOAT         NULL,
    [INVENTORY_INTERVIEW]                 FLOAT         NULL,
    [INVENTORY_VISIT]                     FLOAT         NULL,
    [ACCOUNT_RECEIVABLE]                  FLOAT         NULL,
    [MACHINERY_EQUIPMENT]                 FLOAT         NULL,
    [CORE_ASSETS]                         FLOAT         NULL,
    [OTHER_FIXED_ASSETS_OTHER_BANK]       FLOAT         NULL,
    [OTHER_FIXED_ASSETS]                  FLOAT         NULL,
    [CASH_BOND]                           FLOAT         NULL,
    [CALCULATE_RATE]                      FLOAT         NULL,
    [ACCOUNT_PAYABLE]                     FLOAT         NULL,
    [CURRENT_LIABILITY_BAY]               FLOAT         NULL,
    [CURRENT_LIABILITY_OTHER_BANK]        FLOAT         NULL,
    [OTHER_CURRENT_LIABILITY]             FLOAT         NULL,
    [LONG_TERM_LIABILITY_BAY]             FLOAT         NULL,
    [LONG_TERM_LIABILITY_BAY_REPAYMENT]   FLOAT         NULL,
    [LONG_TERM_LIABILITY_OTHER_BANK]      FLOAT         NULL,
    [LONG_TERM_LIABILITY_OTHER_REPAYMENT] FLOAT         NULL,
    [LONG_TERM_OTHER_LIABILITY]           FLOAT         NULL,
    [LONG_TERM_OTHER_REPAYMENT]           FLOAT         NULL,
    [LOANS_REL_CO_DIRECTORS]              FLOAT         NULL,
    [LG_AVAL_BAY]                         FLOAT         NULL,
    [REFINANCE_WORKING_CAPITAL_OTHER]     FLOAT         NULL,
    [REFINANCE_WORKING_LOAN_OTHER]        FLOAT         NULL,
    [REFINANCE_REPAYMENT]                 FLOAT         NULL,
    [WORKING_CAPITAL]                     FLOAT         NULL,
    [LOAN]                                FLOAT         NULL,
    [LG_AVAL]                             FLOAT         NULL,
    [ASSETS_INCREASE_LOAN]                FLOAT         NULL,
    [BOND_DEPOSIT_PLEDGE_PERSON]          FLOAT         NULL,
    [APPRAISAL_VALUE_ZONE_A]              FLOAT         NULL,
    [APPRAISAL_VALUE_ZONE_B]              FLOAT         NULL,
    [APPRAISAL_VALUE_ZONE_C]              FLOAT         NULL,
    [APPRAISAL_VALUE_ZONE_D]              FLOAT         NULL,
    [APPRAISAL_VALUE_ZONE_E]              FLOAT         NULL,
    [BOND_DEPOSIT_PLEDGE]                 FLOAT         NULL,
    [CASH_BOND_CAL]                       FLOAT         NULL,
    [ACCOUNT_RECEIVABLE_CAL]              FLOAT         NULL,
    [INVENTORY_CAL]                       FLOAT         NULL,
    [TOTAL_CURRENT_ASSETS_CAL]            FLOAT         NULL,
    [MACHINERY_EQUIPMENT_CAL]             FLOAT         NULL,
    [PROPERTY_PLANT_BUILDING_CAL]         FLOAT         NULL,
    [OTHER_FIXED_ASSETS_OTHER_BANK_CAL]   FLOAT         NULL,
    [OTHER_FIXED_ASSETS_CAL]              FLOAT         NULL,
    [ASSETS_FROM_CREDIT_CAL]              FLOAT         NULL,
    [TOTAL_FIXED_ASSETS_CAL]              FLOAT         NULL,
    [TOTAL_ASSETS_CAL]                    FLOAT         NULL,
    [ACCOUNT_PAYABLE_CAL]                 FLOAT         NULL,
    [CURRENT_LIABILITY_BAY_CAL]           FLOAT         NULL,
    [OTHER_CURRENT_LIABILITY_CAL]         FLOAT         NULL,
    [TOTAL_CURRENT_LIABILITY_CAL]         FLOAT         NULL,
    [LONG_TERM_LIABILITY_BAY_CAL]         FLOAT         NULL,
    [OTHER_LONG_TERM_LIABILITY_CAL]       FLOAT         NULL,
    [TOTAL_LIABILITY_CAL]                 FLOAT         NULL,
    [LOANS_REL_CO_DIRECTORS_CAL]          FLOAT         NULL,
    [EQUITY_CAL]                          FLOAT         NULL,
    [LIABILITY_EQUITY_CAL]                FLOAT         NULL,
    [EBIDA_PERCENT_CAL]                   FLOAT         NULL,
    [EBIDA_CAL]                           FLOAT         NULL,
    [DE_BEFORE_LOAN_CAL]                  FLOAT         NULL,
    [DSCR_BEFORE_LOAN_CAL]                FLOAT         NULL,
    [AR_DAY_CAL]                          FLOAT         NULL,
    [INVENTORY_DAY_CAL]                   FLOAT         NULL,
    [WORKING_CAPITAL_NEED_CAL]            FLOAT         NULL,
    [LOAN_NEED_CAL]                       FLOAT         NULL,
    [OWNERS_EQUITY_PERCENT_CAL]           FLOAT         NULL,
    [OWNERS_EQUITY_CAL]                   FLOAT         NULL,
    [FIXED_INTEREST_PERCENT_CAL]          FLOAT         NULL,
    [PAYMENT_PERIOD_CAL]                  INT           NULL,
    [AVERAGE_PAYMENT_PERIOD_CAL]          INT           NULL,
    [WORKING_CAPITAL_APPROVE_CAL]         FLOAT         NULL,
    [LOAN_APPROVE_CAL]                    FLOAT         NULL,
    [INTEREST_RATE_PERCENT]               FLOAT         NULL,
    [INTEREST_RATE_PERCENT_USED]          FLOAT         NULL,
    [CONTRACT_YEAR]                       INT           NULL,
    [DSCR_THIS_TIME]                      FLOAT         NULL,
    [DSCR_THIS_TIME_PERCENT]              FLOAT         NULL,
    [DE_THIS_TIME]                        FLOAT         NULL,
    [LTV_THIS_TIME]                       FLOAT         NULL,
    [LTV_THIS_TIME_PERCENT]               FLOAT         NULL,
    [WORKING_CAPITAL_DEFAULT]             FLOAT         NULL,
    [LOAN_DEFAULT]                        FLOAT         NULL,
    [WORKING_CAPITAL_DEFAULT_APPROVE]     FLOAT         NULL,
    [LOAN_DEFAULT_APPROVE]                FLOAT         NULL
);


GO
PRINT N'Creating PK_FINANCIAL_DATA...';


GO
ALTER TABLE [SS].[FINANCIAL_DATA]
    ADD CONSTRAINT [PK_FINANCIAL_DATA] PRIMARY KEY CLUSTERED ([SMES_DATA_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_DATA_EXCELL]...';


GO
CREATE TABLE [SS].[FINANCIAL_DATA_EXCELL] (
    [IDEN]                 INT            IDENTITY (1, 1) NOT NULL,
    [FILE_NAME]            NVARCHAR (255) NULL,
    [CIF]                  INT            NOT NULL,
    [CIF_NAME]             NVARCHAR (100) NULL,
    [BUS_Code]             NVARCHAR (10)  NULL,
    [BUS_GRP]              NVARCHAR (50)  NULL,
    [RM_I_GROSS_PROFIT]    MONEY          NULL,
    [CM_I_GROSS_PROFIT]    MONEY          NULL,
    [RM_C_EBIDA_PERCENT]   MONEY          NULL,
    [CM_C_EBIDA_PERCENT]   MONEY          NULL,
    [RM_C_EBIDA]           MONEY          NULL,
    [CM_C_EBIDA]           MONEY          NULL,
    [RM_C_WORKING_CAPITAL] MONEY          NULL,
    [CM_C_WORKING_CAPITAL] MONEY          NULL,
    [RM_C_LOAN]            MONEY          NULL,
    [CM_C_LOAN]            MONEY          NULL,
    [RM_A_WORKING_CAPITAL] MONEY          NULL,
    [CM_A_WORKING_CAPITAL] MONEY          NULL,
    [RM_A_LOAN]            MONEY          NULL,
    [CM_A_LOAN]            MONEY          NULL,
    [RM_I_WORKING_CAPITAL] MONEY          NULL,
    [CM_I_WORKING_CAPITAL] MONEY          NULL,
    [RM_I_LOAN]            MONEY          NULL,
    [CM_I_LOAN]            MONEY          NULL,
    [RM_I_DSCR]            MONEY          NULL,
    [CM_I_DSCR]            MONEY          NULL,
    [UPDATE_DATE]          DATETIME       NULL
);


GO
PRINT N'Creating PK_FINANCIAL_DATA_EXCELL...';


GO
ALTER TABLE [SS].[FINANCIAL_DATA_EXCELL]
    ADD CONSTRAINT [PK_FINANCIAL_DATA_EXCELL] PRIMARY KEY CLUSTERED ([CIF] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_LIST]...';


GO
CREATE TABLE [SS].[FINANCIAL_LIST] (
    [LIST_TYPE]     NVARCHAR (20)  NULL,
    [LIST_ID]       NVARCHAR (4)   NOT NULL,
    [LIST_NAME]     NVARCHAR (255) NULL,
    [LIST_NAME_ENG] NVARCHAR (255) NULL,
    [LIST_RESULT]   NVARCHAR (2)   NULL,
    [DEL_FLAG]      INT            NULL
);


GO
PRINT N'Creating PK_FINANCIAL_LIST...';


GO
ALTER TABLE [SS].[FINANCIAL_LIST]
    ADD CONSTRAINT [PK_FINANCIAL_LIST] PRIMARY KEY CLUSTERED ([LIST_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_MAIN]...';


GO
CREATE TABLE [SS].[FINANCIAL_MAIN] (
    [SMES_ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [SMES_STATUS]             INT            NULL,
    [CREATE_USER]             NVARCHAR (10)  NULL,
    [CREATE_DATE]             DATETIME       NULL,
    [UPDATE_USER]             NVARCHAR (10)  NULL,
    [UPDATE_DATE]             DATETIME       NULL,
    [REF_ID]                  INT            NULL,
    [BUSINESS_ID_TABLE]       FLOAT          NULL,
    [MARGIN_TABLE]            FLOAT          NULL,
    [DSCR_TABLE]              FLOAT          NULL,
    [AP_TABLE]                FLOAT          NULL,
    [AR_TABLE]                FLOAT          NULL,
    [STOCK_TABLE]             FLOAT          NULL,
    [LTV_TABLE]               FLOAT          NULL,
    [WORKING_CAPITAL_TABLE]   FLOAT          NULL,
    [RATE_TABLE]              FLOAT          NULL,
    [CONTRACT_TABLE]          FLOAT          NULL,
    [BUSINESS_GROUP_ID]       INT            NULL,
    [PURPOSE_LIST_ID]         NVARCHAR (4)   NULL,
    [INVEST_IN]               INT            NULL,
    [TENOR_LIST_ID]           NVARCHAR (4)   NULL,
    [COLLATERAL_TYPE_LIST_ID] NVARCHAR (4)   NULL,
    [LTV_PERCENT]             FLOAT          NULL,
    [INDUS_WATH_LIST_ID]      NVARCHAR (4)   NULL,
    [NET_PROFIT_LIST_ID]      NVARCHAR (4)   NULL,
    [DEBT_EBITDA]             FLOAT          NULL,
    [DEBT_EQUITY]             FLOAT          NULL,
    [DSCR]                    FLOAT          NULL,
    [RESULT_PROCESS]          NVARCHAR (10)  NULL,
    [RESULT_REMARK]           NVARCHAR (500) NULL
);


GO
PRINT N'Creating PK_FINANCIAL_MAIN...';


GO
ALTER TABLE [SS].[FINANCIAL_MAIN]
    ADD CONSTRAINT [PK_FINANCIAL_MAIN] PRIMARY KEY CLUSTERED ([SMES_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_ROLE]...';


GO
CREATE TABLE [SS].[FINANCIAL_ROLE] (
    [ROLE_ID]    INT            NOT NULL,
    [ROLE_GROUP] NVARCHAR (255) NULL
);


GO
PRINT N'Creating PK_ROLE_ID...';


GO
ALTER TABLE [SS].[FINANCIAL_ROLE]
    ADD CONSTRAINT [PK_ROLE_ID] PRIMARY KEY CLUSTERED ([ROLE_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating [SS].[FINANCIAL_STATUS]...';


GO
CREATE TABLE [SS].[FINANCIAL_STATUS] (
    [STATUS_ID]   INT           NOT NULL,
    [STATUS_NAME] NVARCHAR (50) NULL
);


GO
PRINT N'Creating PK_FINANCIAL_STATUS...';


GO
ALTER TABLE [SS].[FINANCIAL_STATUS]
    ADD CONSTRAINT [PK_FINANCIAL_STATUS] PRIMARY KEY CLUSTERED ([STATUS_ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
PRINT N'Creating DF_APP_PROFILE_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[APP_PROFILE]
    ADD CONSTRAINT [DF_APP_PROFILE_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_APPLICATION_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[APPLICATION]
    ADD CONSTRAINT [DF_APPLICATION_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATE_AND_CUS_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_CUS]
    ADD CONSTRAINT [DF_CATE_AND_CUS_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATE_AND_EMP_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_EMP]
    ADD CONSTRAINT [DF_CATE_AND_EMP_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATE_AND_MENU_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_MENU]
    ADD CONSTRAINT [DF_CATE_AND_MENU_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATE_LINK_CATE_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE]
    ADD CONSTRAINT [DF_CATE_LINK_CATE_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATE_LINK_CATE_TYPE_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE_TYPE]
    ADD CONSTRAINT [DF_CATE_LINK_CATE_TYPE_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CLASSIFY_CATEGORY_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATEGORY]
    ADD CONSTRAINT [DF_CLASSIFY_CATEGORY_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_CATEGORY_TYPE_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[CATEGORY_TYPE]
    ADD CONSTRAINT [DF_CATEGORY_TYPE_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_MENU_MASTER_MENU_DEL_FLAG...';


GO
ALTER TABLE [CLASSIFY].[MENU_MASTER]
    ADD CONSTRAINT [DF_MENU_MASTER_MENU_DEL_FLAG] DEFAULT 0 FOR [MENU_DEL_FLAG];


GO
PRINT N'Creating DF_CUSTOMER_SME_BUSINESS_DESTINATION_ID...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_BUSINESS_DESTINATION_ID] DEFAULT 1 FOR [BUSINESS_DESTINATION_ID];


GO
PRINT N'Creating DF_CUSTOMER_SME_RATING_KEY...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_RATING_KEY] DEFAULT 1 FOR [RATING_KEY];


GO
PRINT N'Creating DF_CUSTOMER_SME_RATING_TYPE_KEY...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_RATING_TYPE_KEY] DEFAULT 1 FOR [RATING_TYPE_KEY];


GO
PRINT N'Creating DF_CUSTOMER_SME_SIZE_ID...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_SIZE_ID] DEFAULT 1 FOR [SIZE_ID];


GO
PRINT N'Creating DF_CUSTOMER_SME_STATUS_ID...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME]
    ADD CONSTRAINT [DF_CUSTOMER_SME_STATUS_ID] DEFAULT 1 FOR [STATUS_ID];


GO
PRINT N'Creating DF_CUSTOMER_SME_GROUP_GROUP_SIZE_ID...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_GROUP]
    ADD CONSTRAINT [DF_CUSTOMER_SME_GROUP_GROUP_SIZE_ID] DEFAULT 1 FOR [GROUP_SIZE_ID];


GO
PRINT N'Creating DF_CUSTOMER_SME_GROUP_UPDATE_DATE...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_GROUP]
    ADD CONSTRAINT [DF_CUSTOMER_SME_GROUP_UPDATE_DATE] DEFAULT GETDATE() FOR [UPDATE_DATE];


GO
PRINT N'Creating DF_USER_DATA_CREATE_DATE...';


GO
ALTER TABLE [EMPLOYEE].[USER_DATA]
    ADD CONSTRAINT [DF_USER_DATA_CREATE_DATE] DEFAULT GETDATE() FOR [CREATE_DATE];


GO
PRINT N'Creating DF_USER_DATA_DEL_FLAG...';


GO
ALTER TABLE [EMPLOYEE].[USER_DATA]
    ADD CONSTRAINT [DF_USER_DATA_DEL_FLAG] DEFAULT 0 FOR [DEL_FLAG];


GO
PRINT N'Creating DF_USER_DATA_UPDATE_DATE...';


GO
ALTER TABLE [EMPLOYEE].[USER_DATA]
    ADD CONSTRAINT [DF_USER_DATA_UPDATE_DATE] DEFAULT GETDATE() FOR [UPDATE_DATE];


GO
PRINT N'Creating FK_APP_PROFILE_APPLICATION...';


GO
ALTER TABLE [CLASSIFY].[APP_PROFILE] WITH NOCHECK
    ADD CONSTRAINT [FK_APP_PROFILE_APPLICATION] FOREIGN KEY ([APP_KEY]) REFERENCES [CLASSIFY].[APPLICATION] ([APP_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_APP_PROFILE_USER_DATA...';


GO
ALTER TABLE [CLASSIFY].[APP_PROFILE] WITH NOCHECK
    ADD CONSTRAINT [FK_APP_PROFILE_USER_DATA] FOREIGN KEY ([EMP_ID]) REFERENCES [EMPLOYEE].[USER_DATA] ([EMP_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_AND_CUS_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_CUS] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_AND_CUS_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_AND_EMP_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_EMP] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_AND_EMP_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_AND_EMP_USER_DATA...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_EMP] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_AND_EMP_USER_DATA] FOREIGN KEY ([EMP_ID]) REFERENCES [EMPLOYEE].[USER_DATA] ([EMP_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_AND_MENU_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_MENU] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_AND_MENU_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_AND_MENU_MENU_MASTER...';


GO
ALTER TABLE [CLASSIFY].[CATE_AND_MENU] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_AND_MENU_MENU_MASTER] FOREIGN KEY ([MENU_KEY]) REFERENCES [CLASSIFY].[MENU_MASTER] ([MENU_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_LINK_CATE_CATE_LINK_CATE_TYPE...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_LINK_CATE_CATE_LINK_CATE_TYPE] FOREIGN KEY ([LINKED_TYPE_KEY]) REFERENCES [CLASSIFY].[CATE_LINK_CATE_TYPE] ([LINKED_TYPE_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_LINK_CATE_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_LINK_CATE_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATE_LINKED_CATE_CATEGORY...';


GO
ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH NOCHECK
    ADD CONSTRAINT [FK_CATE_LINKED_CATE_CATEGORY] FOREIGN KEY ([CATEGORY_KEY]) REFERENCES [CLASSIFY].[CATEGORY] ([CATEGORY_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CATEGORY_CATEGORY_TYPE...';


GO
ALTER TABLE [CLASSIFY].[CATEGORY] WITH NOCHECK
    ADD CONSTRAINT [FK_CATEGORY_CATEGORY_TYPE] FOREIGN KEY ([CATEGORY_TYPE_KEY]) REFERENCES [CLASSIFY].[CATEGORY_TYPE] ([CATEGORY_TYPE_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_MENU_MASTER_MENU_MASTER...';


GO
ALTER TABLE [CLASSIFY].[MENU_MASTER] WITH NOCHECK
    ADD CONSTRAINT [FK_MENU_MASTER_MENU_MASTER] FOREIGN KEY ([MENU_PARENT_KEY]) REFERENCES [CLASSIFY].[MENU_MASTER] ([MENU_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CUSTOMER_SME_BUSINESS_DESTINATION...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH NOCHECK
    ADD CONSTRAINT [FK_CUSTOMER_SME_BUSINESS_DESTINATION] FOREIGN KEY ([BUSINESS_DESTINATION_ID]) REFERENCES [CUSTOMER].[BUSINESS_DESTINATION] ([BUSINESS_DESTINATION_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CUSTOMER_SME_CUSTOMER_SME_GROUP...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH NOCHECK
    ADD CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_SME_GROUP] FOREIGN KEY ([GROUP_ID]) REFERENCES [CUSTOMER].[CUSTOMER_SME_GROUP] ([GROUP_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CUSTOMER_SME_CUSTOMER_SME_SIZE...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH NOCHECK
    ADD CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_SME_SIZE] FOREIGN KEY ([SIZE_ID]) REFERENCES [CUSTOMER].[CUSTOMER_SME_SIZE] ([SIZE_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CUSTOMER_SME_CUSTOMER_STATUS...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH NOCHECK
    ADD CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_STATUS] FOREIGN KEY ([STATUS_ID]) REFERENCES [CUSTOMER].[CUSTOMER_STATUS] ([STATUS_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CUSTOMER_SME_RATING_CUSTOMER_SME_RATING_TYPE...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING] WITH NOCHECK
    ADD CONSTRAINT [FK_CUSTOMER_SME_RATING_CUSTOMER_SME_RATING_TYPE] FOREIGN KEY ([RATING_TYPE_KEY]) REFERENCES [CUSTOMER].[CUSTOMER_SME_RATING_TYPE] ([RATING_TYPE_KEY]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating CK_EXPORT_WEIGHT...';


GO
ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH NOCHECK
    ADD CONSTRAINT [CK_EXPORT_WEIGHT] CHECK ((([EXPORT_WEIGHT]+[LOCAL_WEIGHT])<=(100)));


GO
PRINT N'Creating [SS].[FINANCIAL_MAIN].[SMES_STATUS].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0:ยกเลิก;1:Customer save;2:Rm save;3:Cm Save', @level0type = N'SCHEMA', @level0name = N'SS', @level1type = N'TABLE', @level1name = N'FINANCIAL_MAIN', @level2type = N'COLUMN', @level2name = N'SMES_STATUS';


GO
-- Refactoring step to update target server with deployed transaction logs
CREATE TABLE  [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
GO
sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [CLASSIFY].[APP_PROFILE] WITH CHECK CHECK CONSTRAINT [FK_APP_PROFILE_APPLICATION];

ALTER TABLE [CLASSIFY].[APP_PROFILE] WITH CHECK CHECK CONSTRAINT [FK_APP_PROFILE_USER_DATA];

ALTER TABLE [CLASSIFY].[CATE_AND_CUS] WITH CHECK CHECK CONSTRAINT [FK_CATE_AND_CUS_CATEGORY];

ALTER TABLE [CLASSIFY].[CATE_AND_EMP] WITH CHECK CHECK CONSTRAINT [FK_CATE_AND_EMP_CATEGORY];

ALTER TABLE [CLASSIFY].[CATE_AND_EMP] WITH CHECK CHECK CONSTRAINT [FK_CATE_AND_EMP_USER_DATA];

ALTER TABLE [CLASSIFY].[CATE_AND_MENU] WITH CHECK CHECK CONSTRAINT [FK_CATE_AND_MENU_CATEGORY];

ALTER TABLE [CLASSIFY].[CATE_AND_MENU] WITH CHECK CHECK CONSTRAINT [FK_CATE_AND_MENU_MENU_MASTER];

ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH CHECK CHECK CONSTRAINT [FK_CATE_LINK_CATE_CATE_LINK_CATE_TYPE];

ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH CHECK CHECK CONSTRAINT [FK_CATE_LINK_CATE_CATEGORY];

ALTER TABLE [CLASSIFY].[CATE_LINK_CATE] WITH CHECK CHECK CONSTRAINT [FK_CATE_LINKED_CATE_CATEGORY];

ALTER TABLE [CLASSIFY].[CATEGORY] WITH CHECK CHECK CONSTRAINT [FK_CATEGORY_CATEGORY_TYPE];

ALTER TABLE [CLASSIFY].[MENU_MASTER] WITH CHECK CHECK CONSTRAINT [FK_MENU_MASTER_MENU_MASTER];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH CHECK CHECK CONSTRAINT [FK_CUSTOMER_SME_BUSINESS_DESTINATION];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH CHECK CHECK CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_SME_GROUP];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH CHECK CHECK CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_SME_SIZE];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH CHECK CHECK CONSTRAINT [FK_CUSTOMER_SME_CUSTOMER_STATUS];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME_RATING] WITH CHECK CHECK CONSTRAINT [FK_CUSTOMER_SME_RATING_CUSTOMER_SME_RATING_TYPE];

ALTER TABLE [CUSTOMER].[CUSTOMER_SME] WITH CHECK CHECK CONSTRAINT [CK_EXPORT_WEIGHT];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
