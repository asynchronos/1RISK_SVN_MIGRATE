-- =============================================
-- Author:		Pichaya	
-- Create date: 15/06/2011
-- Description:	Back up all database to data.bak
-- =============================================
CREATE PROCEDURE [dbo].[P_BACK_UP_ALL_DATABASE]

AS 

DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 

SET @path = 'D:\BackUpData\'  

EXECUTE master.dbo.xp_delete_file 0,@path,N'bak'  -- ลบไฟล์ใน folder ที่กำหนด

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 

DECLARE db_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases 
--WHERE name NOT IN ('Northwind','AdventureWorks','AdventureWorksDW','ReportServerTempDB')  
WHERE name NOT IN ('tempdb','REDSHIRT','ASSET','ASSET_DB','Appraisal','Appraisal_Test','Bay01_test','Northwind','AdventureWorks','AdventureWorksDW','ReportServer','ReportServerTempDB')  

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   

WHILE @@FETCH_STATUS = 0   
BEGIN   
       --SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
       SET @fileName = @path + @name +  '.BAK'  
       BACKUP DATABASE @name TO DISK = @fileName  

       FETCH NEXT FROM db_cursor INTO @name   
END   

CLOSE db_cursor   
DEALLOCATE db_cursor 





