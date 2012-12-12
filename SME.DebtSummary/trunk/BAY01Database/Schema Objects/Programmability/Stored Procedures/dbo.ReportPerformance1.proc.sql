







CREATE  PROCEDURE [dbo].[ReportPerformance1]
@Day nvarchar(2),
@Month nvarchar(2),
@Year nvarchar(4),
@Lead_id nvarchar(10)

AS
BEGIN

Declare @SQL  nvarchar(max)
Declare @CRI1 nvarchar(max)
Declare @CRI2 nvarchar(max)
Declare @strGroup nvarchar(max)
Declare @strEPS nvarchar(max)
Declare @strOrder nvarchar(max)
Declare @strTableName nvarchar(max)



--set @strTableName ='Temp_Report_Product' + right('0' + convert(nvarchar(2),month(getdate())),2) +  right('0'+ convert(nvarchar(4),year(getdate())),4)
set @strTableName ='Temp_Report_Chart' 

if @Day  <> '0'  AND @Month <> '0'  AND  @Year <>  '0'
	  begin 
		 SET @CRI1 = N' AND  year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  + '  and day([APP-DATE])= ' + @Day 
	 end 
else if  @Month <> '0'  AND  @Year <>  '0'
	begin   
		SET @CRI1 = N' AND year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  
	end
else if  @Year <> '0'
    begin
		SET @CRI1 = N' AND year([APP-DATE])= ' + @Year 
    end 
else
   begin
        SET @CRI1=N''
   end


if @Lead_id='0'
    Begin
      SET @SQL= ''
	  SET @CRI2 =N''
    End
else if @Lead_id <> '0'
    Begin
       SET @SQL= ''
      SET @CRI2 = N' AND ([EMP-ID] IN ( SELECT DISTINCT EMP_ID from FControllingLineFullDescByEMP_id('''  + @Lead_id + ''')))'
    End


SET @SQL = @SQL + 'select  CASE WHEN [Process_Head]=''คืนเรื่อง'' THEN ''Return'' 
								WHEN [Process_Head]=''ไม่อนุมัติ'' THEN ''Reject'' 
								WHEN [Process_Head]=''อนุมัติ'' THEN ''Approve'' 
								WHEN [Process_Head]=''ระหว่างขั้นตอนการปฎิบัติงาน'' THEN ''In Process'' 
                                ELSE [Process_Head] END as ''Process_Head''
         ,count(id) as ''TOTAL'',sum(net) as  ''NET'',sum(APPROVE) as ''CREDIT''
         ,sum(EXCEPTION) as ''OTHER'',sum(REVIEW) as ''REVIEW''
         ,sum(TTY) as ''TTY'',sum(PAT) as ''PAT''
'       
SET @strGroup=' group by [Process_Head]
'
SET @strEPS =''
SET  @strOrder =' order by [Process_Head]'
  
SET @SQL = @SQL + 'from ' + @strTableName  + ' WHERE 0=0 '  + @CRI1 + @CRI2  + @strGroup + @strEPS + @strOrder

EXECUTE sp_executesql
	@SQL
--SELECT @SQL
    

END









