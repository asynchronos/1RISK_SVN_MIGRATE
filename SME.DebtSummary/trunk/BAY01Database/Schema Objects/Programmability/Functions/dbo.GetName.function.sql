-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetName] 
(
	-- Add the parameters for the function here
	@Title nvarchar(20), 
	@FirstName nvarchar(50), 
	@LastName nvarchar(50)
)
RETURNS nvarchar(120)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(120);

	-- Add the T-SQL statements to compute the return value here
	SET @Result = ISNULL(@Title,'') + ' ' + ISNULL(@FirstName,'') + ' ' + ISNULL(@LastName,'');

	-- Return the result of the function
	RETURN @Result

END
