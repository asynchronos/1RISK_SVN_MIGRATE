

CREATE PROCEDURE [dbo].[REPORT_EDW_PASS_BLACKLIST]
  @name nvarchar(100),
  @lastname nvarchar(100)
AS
BEGIN
   
declare @sql_str nvarchar(max)
-- ส่วนแรกดึงข้อมูลจาก db2 ยังไม่มีการ group เนื่องจากไม่สามารถใช้คำสั่ง substring ได้
SET @sql_str = '
SELECT  TITLE, ACCOUNT_NAME , OWNER_NAME, ADDRESS, BANK_CODE, BANK_NAME, BRANCH_CODE, BRANCH_NAME ,CLOSE_DATE
FROM  DB2DB.BL_CLOSE_ACT
where (ACCOUNT_NAME like ''%' + @name  + '%'' and ACCOUNT_NAME like  ''%' + @lastname + '%'')
or     (OWNER_NAME like  ''%' + @name  + '%'' and OWNER_NAME like  ''%' + @lastname + '%'')
'

-- นำมาต่อกับคำสั่งการดึงข้อมูลจาก sql ที่มีการ substring closedate ได้ 
-- สามารถทดสอบโปรแกรมโดยการเอา remark ที่ --PRINT @sql_str ออก
SET @sql_str = 'Select * from OPENQUERY(DB2DB, ''' + REPLACE(@sql_str, '''', '''''') + ''')'
--PRINT @sql_str
SET @sql_str= N'Select TITLE, ACCOUNT_NAME, OWNER_NAME, ADDRESS, BANK_CODE, BANK_NAME, BRANCH_CODE, BRANCH_NAME
,substring(CLOSE_DATE,6,2) + ''-'' + substring(CLOSE_DATE,2,4)  AS  CLOSE_DATE
from ( ' + @sql_str + ') as q1
GROUP BY   TITLE, ACCOUNT_NAME, OWNER_NAME, ADDRESS, BANK_CODE, BANK_NAME, BRANCH_CODE, BRANCH_NAME ,CLOSE_DATE
'
--PRINT @sql_str
EXEC (@sql_str)



END










