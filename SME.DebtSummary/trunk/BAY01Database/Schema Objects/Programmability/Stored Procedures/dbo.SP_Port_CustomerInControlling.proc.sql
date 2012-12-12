

-- =============================================
-- Author:		Prakit
-- Create date: 2007/02/11
-- Description:	CustomerInControlling
-- =============================================
CREATE PROCEDURE [dbo].[SP_Port_CustomerInControlling] 
		-- Add the parameters for the stored procedure here
	@CURRENT_PAGE int = 1, -- for paging
    @PAGE_SIZE int = 10, -- for paging
	@EMP_ID nvarchar(max) = null,
	@CONDITION nvarchar(300) = null,
	@TOTAL_RECORDS int output
AS
BEGIN
	DECLARE @SQLSTRING nvarchar(max),@ParmDefinition nvarchar(100)
	DECLARE @STARTROW int,@rowsToRetrieve nvarchar(15)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET @STARTROW = ((@CURRENT_PAGE-1) * @PAGE_SIZE) + 1
	SET @rowsToRetrieve = '(' + CAST((@PAGE_SIZE * @CURRENT_PAGE) as nvarChar(10)) + ')'

	--ระบุจำนวน Row ที่ต้องการ select
	--SET ROWCOUNT @PAGE_SIZE

	CREATE TABLE #TMP(
		[CM_CODE] [nvarchar](10) COLLATE Thai_CI_AS NOT NULL,
	 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
	(
		[CM_CODE] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

	INSERT INTO #TMP
	SELECT DISTINCT TXT 
	FROM SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@EMP_ID,';')

	SET @SQLSTRING = N'SELECT * 
						FROM (SELECT TOP ' + @rowsToRetrieve + ' ROW_NUMBER() over(order by Detail.Cif) as ROW, Detail.Cif, Detail.Name, Detail.TDR,
										Detail.Class, Detail.AgingTxt, Detail.Branch_T, Detail.Region_Name, 
										Detail.Principal, Detail.Accru, Detail.Susp 
								FROM Detail INNER JOIN (SELECT [CIF]
														  FROM [dbo].[CUSTOMER_SME] INNER JOIN 
															#TMP AS T
															ON [CUSTOMER_SME].CM_CODE = T.[CM_CODE]
										) AS CUS ON Detail.CIF = CUS.CIF '+
								@CONDITION + ' ) AS T1
						where ROW >= @STARTROW_In 
						order by cif ASC'

	SET @ParmDefinition = N'@STARTROW_In nvarchar(10)'

	EXECUTE sp_executesql
	@SQLSTRING,
	@ParmDefinition,
	@STARTROW_In = @STARTROW

	--count records
	SET @SQLSTRING = N'SELECT @TOTAL_RECORDS_OUT = COUNT(CIF)
						FROM (SELECT TOP (100) PERCENT  Detail.Cif, Detail.Name, Detail.TDR,
									Detail.Class, Detail.AgingTxt, Detail.Branch_T, Detail.Region_Name, 
									Detail.Principal, Detail.Accru, Detail.Susp 
								FROM Detail INNER JOIN (SELECT [CIF]
														  FROM [dbo].[CUSTOMER_SME] INNER JOIN 
															#TMP AS T
															ON [CUSTOMER_SME].CM_CODE = T.[CM_CODE]
										) AS CUS ON Detail.CIF = CUS.CIF '+
								@CONDITION + ' ) AS T1'

	SET @ParmDefinition = N'@TOTAL_RECORDS_OUT int OUTPUT'

	EXECUTE sp_executesql
	@SQLSTRING,
	@ParmDefinition,
	@TOTAL_RECORDS_OUT = @TOTAL_RECORDS OUTPUT

	DROP TABLE #TMP
END


