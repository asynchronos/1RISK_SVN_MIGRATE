


CREATE  PROCEDURE [dbo].[ReportByCreditApproveGroupByEmp]
    @Year  nvarchar(4),
    @Month nvarchar(2),
	@Day   nvarchar(2)
 

AS
BEGIN

Declare @SQL nvarchar(max)
Declare @ex1 nvarchar(max)

     if @Day  <> '0'  AND @Month <> '0'  AND  @Year <>  '0'
  begin 
   SET @ex1 = N' year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  + '  and day([APP-DATE])= ' + @Day 
  end 
else if  @Month <> '0'  AND  @Year <>  '0'
   begin   
    SET @ex1 = N' year([APP-DATE])= ' + @Year + ' and  month([APP-DATE])='+ @Month  
   end
else if  @Year <> '0'
   begin
     SET @ex1 = N' year([APP-DATE])= ' + @Year 
   end 

  SET @SQL =  N'SELECT     [EMP-ID], EMPLOYEE, SUM(NEW) AS NEW, SUM(OLD) AS OLD, SUM(REVIEW) AS REVIEW, SUM(EXCEPTION) AS EXCEPTION, SUM([O-D]) AS [O-D], 
                      SUM([(O-D)]) AS [(O-D)], SUM([F-L]) AS [F-L], SUM([(F-L)]) AS [(F-L)], SUM([L-G]) AS [L-G], SUM([(L-G)]) AS [(L-G)], SUM([STL-PN]) AS [STL-PN], 
                      SUM([(STL-PN)]) AS [(STL-PN)], SUM([TRADE-FIN]) AS [TRADE-FIN], SUM([(TRADE-FIN)]) AS [(TRADE-FIN)], SUM(OTHERS) AS OTHERS, SUM([(OTHERS)]) 
                      AS [(OTHERS)] FROM   dbo.V_Report_product WHERE '  + @ex1 +  ' GROUP BY [EMP-ID], EMPLOYEE'

	EXECUTE sp_executesql
	@SQL
	
END


