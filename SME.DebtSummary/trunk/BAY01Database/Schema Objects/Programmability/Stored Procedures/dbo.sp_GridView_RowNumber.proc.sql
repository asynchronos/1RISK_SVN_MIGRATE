
-- =============================================
-- Author:		Socrate
-- Create date: 2/5/2006
-- Description:	implements ROW_NUMBER function
-- =============================================
CREATE PROCEDURE [dbo].[sp_GridView_RowNumber]
(
	@PageNum int,
	@PageSize int,
	@TotalRowsNum int output
)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Use ROW_NUMBER function
	WITH CustomerProc As
	(
		SELECT 'RowNumber' = ROW_NUMBER() OVER(ORDER BY CIF DESC)
		FROM TB_CUSTOMER_RISK 
	)


	-- Query result
	SELECT * 
	FROM CustomerProc
	WHERE RowNumber BETWEEN (@PageNum - 1) * @PageSize + 1 AND @PageNum * @PageSize             
	ORDER BY RowNumber DESC

	-- Returns total records number
	SELECT @TotalRowsNum = count(*) 
	FROM TB_CUSTOMER_RISK

END


