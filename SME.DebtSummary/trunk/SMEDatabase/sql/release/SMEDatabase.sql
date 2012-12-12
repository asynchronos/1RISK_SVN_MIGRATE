/*
Deployment script for SME
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SME"
:setvar DefaultDataPath "D:\DATA\"
:setvar DefaultLogPath "D:\DATA\"

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

IF NOT EXISTS (SELECT 1 FROM [master].[dbo].[sysdatabases] WHERE [name] = N'$(DatabaseName)')
BEGIN
    RAISERROR(N'You cannot deploy this update script to target D745N0019. The database for which this script was built, SME, does not exist on this server.', 16, 127) WITH NOWAIT
    RETURN
END

GO

IF (@@servername != 'D745N0019')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'D745N0019',@@servername) WITH NOWAIT
    RETURN
END

GO

IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'You cannot deploy this update script because the database for which it was built, %s , is set to READ_ONLY.', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY CHECKSUM 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)]

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
