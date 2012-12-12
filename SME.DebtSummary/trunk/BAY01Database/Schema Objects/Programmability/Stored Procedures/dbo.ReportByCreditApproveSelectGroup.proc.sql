
CREATE PROCEDURE [dbo].[ReportByCreditApproveSelectGroup]
    @Year  nvarchar(4),
    @Month nvarchar(2),
	@Day   nvarchar(2),
	@Group nvarchar(1)	

AS
BEGIN

Declare @SQL  nvarchar(max)
Declare @CRI1 nvarchar(max)
Declare @CRI2 nvarchar(max)

if @Day  <> '0'  AND @Month <> '0'  AND  @Year <>  '0'
	  begin 
		 SET @CRI1 = N' WHERE  year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  + '  and day([APP-DATE])= ' + @Day 
	 end 
else if  @Month <> '0'  AND  @Year <>  '0'
	begin   
		SET @CRI1 = N' WHERE year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  
	end
else if  @Year <> '0'
    begin
		SET @CRI1 = N' WHERE year([APP-DATE])= ' + @Year 
    end 
   

if @Group ='0' 
	Begin
		SET @CRI2 =N' '  
	End	
if @Group ='A' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''A'' OR  (PROCESS_GROUP_BOARD=''A'' AND SEND_TO_BOARD =''1''))'  
	End	
if @Group ='B' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''B'' OR  (PROCESS_GROUP_BOARD=''B'' AND SEND_TO_BOARD=''1''))'  
	End	
if @Group ='C' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''C'' OR  (PROCESS_GROUP_BOARD=''C'' AND SEND_TO_BOARD=''1''))'  
	End	
if @Group ='D' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''D'' OR  (PROCESS_GROUP_BOARD=''D'' AND SEND_TO_BOARD=''1''))'  
	End	
if @Group ='E' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''E'' OR  (PROCESS_GROUP_BOARD=''E'' AND SEND_TO_BOARD=''1''))'  
	End	
	
SET @SQL=N'SELECT * FROM   v_report_product ' + @CRI1 + @CRI2 + ' order by id'


	EXECUTE sp_executesql
	@SQL
	
END
