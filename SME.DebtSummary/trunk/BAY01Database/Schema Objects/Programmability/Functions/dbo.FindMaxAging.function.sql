-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[FindMaxAging] 
(
	-- Add the parameters for the function here
	@A money,
	@B money,
	@C money,
	@D money,
	@E money,
	@F money,
	@G money,
	@H money
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result money;

	-- Add the T-SQL statements to compute the return value here
	SELECT @result = dbo.CompareAging(
						dbo.CompareAging(
							dbo.CompareAging(
								dbo.CompareAging(@A,@B)
								,dbo.CompareAging(@C,@D)
							 ),dbo.CompareAging(@E,@F)
						),dbo.CompareAging(@G,@H)
					)

	-- Return the result of the function
	RETURN @result

END

