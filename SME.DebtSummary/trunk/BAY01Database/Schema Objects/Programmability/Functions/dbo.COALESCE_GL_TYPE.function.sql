-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION COALESCE_GL_TYPE 
(
	-- Add the parameters for the function here
	
)
RETURNS 
@TEMP TABLE 
(
	-- Add the column definitions for the TABLE variable here
	COALESCE_GL_TYPE varchar(max)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	DECLARE @productList varchar(max);

	SELECT	@productList = COALESCE (@productList + ',', '') + '[' + DECB_RD + ']'
    FROM	BAY01.dbo.ANNALS_GL_TYPE

	INSERT INTO @TEMP
	SELECT @productList

	RETURN 
END
