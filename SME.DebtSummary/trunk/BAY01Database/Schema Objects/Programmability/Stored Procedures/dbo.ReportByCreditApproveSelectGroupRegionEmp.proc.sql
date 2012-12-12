
Create  PROCEDURE [dbo].[ReportByCreditApproveSelectGroupRegionEmp]
    @Year  nvarchar(4),
    @Month nvarchar(2),
	@Day   nvarchar(2),
	@Group nvarchar(1),	
    @RegionID nvarchar(5),
    @EmpID  nvarchar(10)

AS
BEGIN

Declare @SQL  nvarchar(max)
Declare @CRI1 nvarchar(max)
Declare @CRI2 nvarchar(max)
Declare @CRI3 nvarchar(max)
Declare @CRI4 nvarchar(max)

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
else if @Group ='A' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''A'' OR  (PROCESS_GROUP_BOARD=''A'' AND SEND_TO_BOARD =''1''))'  
	End	
else if @Group ='B' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''B'' OR  (PROCESS_GROUP_BOARD=''B'' AND SEND_TO_BOARD=''1''))'  
	End	
else if @Group ='C' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''C'' OR  (PROCESS_GROUP_BOARD=''C'' AND SEND_TO_BOARD=''1''))'  
	End	
else if @Group ='D' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''D'' OR  (PROCESS_GROUP_BOARD=''D'' AND SEND_TO_BOARD=''1''))'  
	End	
else if @Group ='E' 
	Begin
		SET @CRI2 =N'  AND (PROCESS_GROUP=''E'' OR  (PROCESS_GROUP_BOARD=''E'' AND SEND_TO_BOARD=''1''))'  
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


SET @SQL=N'SELECT * FROM   v_report_product ' + @CRI1 + @CRI2 + @CRI3 + @CRI4 + ' order by id'


	EXECUTE sp_executesql
	@SQL
	
END
