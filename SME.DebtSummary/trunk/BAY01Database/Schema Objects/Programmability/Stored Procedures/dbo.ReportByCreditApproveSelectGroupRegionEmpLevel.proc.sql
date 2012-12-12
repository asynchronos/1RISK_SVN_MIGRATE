










-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[ReportByCreditApproveSelectGroupRegionEmpLevel]
    @Year  nvarchar(4),
    @Month nvarchar(2),
	@Day   nvarchar(2),
	@YearR  nvarchar(4),
    @MonthR nvarchar(2),
	@DayR   nvarchar(2),
	@Group nvarchar(1),	
    @RegionID nvarchar(5),
    @EmpID  nvarchar(10),
    @Level_id nvarchar(5),
    @NotFin nvarchar(5)


AS
BEGIN

-- ส่วนแรกการสร้าง temp
declare @strTableName  nvarchar(100)
declare @sql2 nvarchar(max)
--สร้างตัวแปรชื่อตารางจาก เดือน ปี ปัจจุบัน


-- แก้ไขให้ใช้ temp report chart ในวันที่ 1 เพราะ report สร้างตอนกลางคืน 
-- วันที่ 1 ยังไม่ได้สร้าง report
--declare @nday int
--set @nday = (select day(getdate()))
--if @nday =1 
  -- begin 
     set @strTableName ='TEMP_REPORT_PRODUCT'
   --end 
--else 
   --begin
    --set @strTableName ='TEMP_REPORT_PRODUCT_'  + right('0'+ convert(nvarchar(4),year(getdate())),4)+ right('0' + convert(nvarchar(2),month(getdate())),2)
   --end 


Declare @SQL  nvarchar(max)
Declare @CRI1 nvarchar(max)
Declare @CRI2 nvarchar(max)
Declare @CRI3 nvarchar(max)
Declare @CRI4 nvarchar(max)
Declare @CRI5 nvarchar(max)
Declare @CRI6 nvarchar(max)
Declare @CRI7 nvarchar(max)


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
   

if @Group ='0' 
	Begin
		SET @CRI2 =N' '  
	End	
else if @Group ='A' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''A'' ) '  
	End	
else if @Group ='B' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''B'' ) '  
	End	
else if @Group ='C' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''C'' ) '  
	End	
else if @Group ='D' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''D'' ) '  
	End	
else if @Group ='E' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''E'' ) '  
	End	

	
if @RegionID='0'
    Begin
       SET   @CRI3=N''
    End
else if @RegionID <> '0'
    Begin
	   SET @CRI3=N' AND ([REGION-ID]=' +  @RegionID +')'
	End

if @EmpID='0'
    Begin
       SET   @CRI4=''
    End
else if @EmpID <> '0'
    Begin
	   SET  @CRI4=N' AND ([EMP-ID]='+ @EmpID + ')'
	End


if @Level_id='0'
    Begin
	  SET @SQL=N''
      SET @CRI5 =N''
    End
else if @Level_id <> '0'
    Begin
          SET @SQL=N''
	      SET @CRI5 = N' AND ([EMP-ID] IN ( SELECT DISTINCT EMP_ID from FControllingLineFullDescByLevel_id('''  + @Level_id + ''')))'
    End




if @DayR  <> '0'  AND @MonthR <> '0'  AND  @YearR <>  '0'
	  begin 
		 SET @CRI7 = N' AND  year([REG-DATE])= ' + @YearR + ' and  month([REG-DATE])='+ @MonthR  + '  and day([REG-DATE])= ' + @DayR 
	 end 
else if  @MonthR <> '0'  AND  @YearR <>  '0'
	begin   
		SET @CRI7 = N' AND year([REG-DATE])= ' + @YearR + ' and  month([REG-DATE])='+ @MonthR  
	end
else if  @YearR <> '0'
    begin
		SET @CRI7 = N' AND year([REG-DATE])= ' + @YearR 
    end 
else
   begin
        SET @CRI7=N''
   end    


if  @NotFin ='False'
    Begin
       SET  @CRI6=''  
	End
else if @NotFin='True'
	Begin
       SET  @CRI1=''
	   SET  @CRI2 =''
	   SET  @CRI7=''		
       SET  @CRI6=' AND (PROCESS_GROUP not in  (''C'',''D'',''E'') or PROCESS_GROUP  is null )'

	End 


   SET @SQL = @SQL + 'SELECT * FROM ' + @strTableName  + ' WHERE 0=0 '  + @CRI1 + @CRI2 + @CRI3 + @CRI4 + @CRI5 + @CRI6 + @CRI7 + ' order by id'

    --return  @SQL
--Print @SQL 


	EXECUTE sp_executesql
	@SQL


END














