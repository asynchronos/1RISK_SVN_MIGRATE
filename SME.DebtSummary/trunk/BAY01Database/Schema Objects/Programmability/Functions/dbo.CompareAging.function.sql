-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [CompareAging] 
(
	-- Add the parameters for the function here
	@A money,
	@B money
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result money

	-- Add the T-SQL statements to compute the return value here
	SELECT @result = CASE 
						WHEN @A > @B THEN @A
						ELSE @B
					END

	-- Return the result of the function
	RETURN @result

END
