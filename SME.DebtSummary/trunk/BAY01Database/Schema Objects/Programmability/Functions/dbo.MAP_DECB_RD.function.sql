-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION MAP_DECB_RD 
(
	-- Add the parameters for the function here
	@DECB_RD nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RESULT nvarchar(50);

	-- Add the T-SQL statements to compute the return value here

	IF @DECB_RD <> 'O/D' AND
		@DECB_RD <> 'F/L' AND
		@DECB_RD <> 'L/G' AND
		@DECB_RD <> 'PN' AND
		@DECB_RD <> 'TRADE FIN.'
		BEGIN
			SET @RESULT = 'OTHER';
		END
	ELSE
		BEGIN
			SET @RESULT = @DECB_RD;
		END

	-- Return the result of the function
	RETURN @RESULT

END
