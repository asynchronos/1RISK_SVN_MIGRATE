-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[FN_GET_CIF_IN_CA] 
(
	-- Add the parameters for the function here
	@CA_ID nvarchar(10)
)
RETURNS nvarchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RESULT nvarchar(100);

	-- Add the T-SQL statements to compute the return value here

	SELECT	@RESULT = COALESCE (@RESULT + ',', '') + CONVERT(varchar,CIF)
    FROM	REPORT07_SUMMARY
	WHERE OLD_ID = @CA_ID
	GROUP BY CIF
	ORDER BY CIF

	-- Return the result of the function
	RETURN @RESULT

END
