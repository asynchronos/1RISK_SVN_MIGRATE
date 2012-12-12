

-- =============================================
-- Author:		Prakit
-- Create date: 2008/02/11
-- Description:	CustomerInControllingSummary
-- =============================================
CREATE PROCEDURE [dbo].[SP_Port_CustomerInControllingSummary]
	-- Add the parameters for the stored procedure here
	--@CURRENT_PAGE int = 1, -- for paging
    --@PAGE_SIZE int = 10, -- for paging
	@EMP_IDs nvarchar(max) = null,
	@SELECT_COLUMN nvarchar(700) = null,
	@GROUP_BY nvarchar(300) = null,
	@ORDER_BY nvarchar(300) = null
AS
BEGIN
	DECLARE @SQLSTRING nvarchar(2000)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	-- Create Table EMP_ID
	CREATE TABLE #TMP(
		[CM_CODE] [nvarchar](10) COLLATE Thai_CI_AS NOT NULL,
	 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
	(
		[CM_CODE] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

	INSERT INTO #TMP
	SELECT DISTINCT TXT 
	FROM SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@EMP_IDs,';')

	SET @SQLSTRING = N'SELECT TOP (100) PERCENT ' +
				@SELECT_COLUMN +
				'COUNT(Detail.Cif) AS CountCIF, SUM(Detail.Principal) AS Principal, 
				SUM(Detail.Accru) AS Accru, SUM(Detail.Susp) AS Susp 
				FROM Detail INNER JOIN (SELECT [CIF]
										  FROM [dbo].[CUSTOMER_SME] INNER JOIN 
											#TMP AS T
											ON [CUSTOMER_SME].CM_CODE = T.[CM_CODE]
										) AS CUS ON Detail.CIF = CUS.CIF ' +
		@GROUP_BY +
		@ORDER_BY

	EXECUTE sp_executesql
	@SQLSTRING

	DROP TABLE #TMP

END


