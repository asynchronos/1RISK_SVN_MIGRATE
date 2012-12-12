
CREATE PROCEDURE [dbo].[REPORT_EDW_PASS_DEFEND]
  @name nvarchar(100),
  @lastname nvarchar(100)
AS
BEGIN
   
declare @sql_str nvarchar(max)
-- ส่วนแรกดึงข้อมูลจาก db2 ยังไม่มีการ case เนื่องจากไม่สามารถใช้คำสั่ง sql ได้
SET @sql_str = '
SELECT DASOF,COURT_TYPE,CASE_NO,LETTER_CASE,PERSON_TYPE,PERSON_NO
      ,EXTEND_FLAG,TITLE,DEFENDANT_NAME,DEFENDANT_SURNAME,DEFENDANT_FLAG
      ,CONFIS_FLAG
FROM DB2DB.BL_DEFEND_PLAIN
where DEFENDANT_NAME   like ''%' + @name  + '%''
and   DEFENDANT_SURNAME like ''%' + @lastname + '%''
'

SET @sql_str = 'Select * from OPENQUERY(DB2DB, ''' + REPLACE(@sql_str, '''', '''''') + ''')'
--PRINT @sql_str
-- ใช้คำสัง case หลังจากได้ข้อมูลมาแล้ว
SET @sql_str= N'Select q1.*,
      case when [PERSON_TYPE]=''1'' then ''โจทย์'' 
           when [PERSON_TYPE]=''2'' then ''จำเลย'' 
           else ''ไม่ระบุ'' 
      end as ''PERSON_DESC'',
      case when [DEFENDANT_FLAG]=''1'' then ''พิทักษ์ทรัพย์'' 
           when [DEFENDANT_FLAG]=''2'' then ''ล้มละลาย'' 
           when [DEFENDANT_FLAG]=''3'' then ''ยกเลิกล้มละลาย'' 
           when [DEFENDANT_FLAG]=''4'' then ''ยึดทรัพย์'' 
           else ''ไม่ระบุ'' 
      end as ''DEFENDANT_DESC'',
      case when [CONFIS_FLAG]=''y'' then ''ยึดทรัพย์'' 
           else ''อื่น ๆ'' 
      end as ''CONFIS_DESC''
from ( ' + @sql_str + ') as q1
'
--PRINT @sql_str
EXEC (@sql_str)
END








