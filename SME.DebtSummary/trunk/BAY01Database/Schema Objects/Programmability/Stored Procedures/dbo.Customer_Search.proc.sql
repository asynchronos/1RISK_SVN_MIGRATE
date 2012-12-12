


-- =============================================
-- Author:		Prakit
-- Create date: 2008/01/15
-- Description:	Customer_Search
-- =============================================
CREATE PROCEDURE [dbo].[Customer_Search] 
	-- Add the parameters for the stored procedure here
	@CURRENT_PAGE int, -- for paging
    @PAGE_SIZE int, -- for paging
	@FIELDNAME nvarchar(100),
	@VALUE nvarchar(30),
	@TOTAL_RECORDS int output
AS
BEGIN
	DECLARE @SQLSTRING nvarchar(1000),@ParmDefinition nvarchar(200)
	DECLARE @STARTROW int,@rowsToRetrieve nvarchar(15)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @STARTROW = ((@CURRENT_PAGE-1) * @PAGE_SIZE) + 1
	SET @rowsToRetrieve = '(' + CAST((@PAGE_SIZE * @CURRENT_PAGE) as nvarChar(10)) + ')'

	--ระบุจำนวน Row ที่ต้องการ select
	SET ROWCOUNT @PAGE_SIZE

    -- Insert statements for procedure here
	SET @SQLSTRING = N'SELECT CIF, NAME 
						from (SELECT TOP ' + @rowsToRetrieve + ' ROW_NUMBER() over(order by CUSTOMER.Cif) as ROW, 
										CIF, ISNULL(CUSTOMER.CUS_TITLE, N'''') + ISNULL(CUSTOMER.CUS_FIRST, N'''') + N'' '' + ISNULL(CUSTOMER.CUS_LAST, N'''') AS NAME 
								FROM dbo.CUSTOMER AS CUSTOMER 
								WHERE ' + @FIELDNAME + ' @VALUE_IN ) AS T1
						where ROW >= @STARTROW_In 
						order by cif ASC'

	SET @ParmDefinition = N'@VALUE_IN nvarchar(30),
							@STARTROW_In int'

	EXECUTE sp_executesql
	@SQLSTRING,
	@ParmDefinition,
	@VALUE_IN = @VALUE,
	@STARTROW_In = @STARTROW

	--count records
	SET @SQLSTRING = N'SELECT @TOTAL_RECORDS_OUT = COUNT(CIF)
						FROM (SELECT TOP (100) PERCENT  CIF, ISNULL(CUSTOMER.CUS_TITLE, N'''') + ISNULL(CUSTOMER.CUS_FIRST, N'''') + N'' '' + ISNULL(CUSTOMER.CUS_LAST, N'''') AS NAME 
								FROM dbo.CUSTOMER AS CUSTOMER 
								WHERE ' + @FIELDNAME + ' @VALUE_IN ) AS T1'

	SET @ParmDefinition = N'@VALUE_IN nvarchar(30),
							@TOTAL_RECORDS_OUT int OUTPUT'

	EXECUTE sp_executesql
	@SQLSTRING,
	@ParmDefinition,
	@VALUE_IN = @VALUE,
	@TOTAL_RECORDS_OUT = @TOTAL_RECORDS OUTPUT
END



