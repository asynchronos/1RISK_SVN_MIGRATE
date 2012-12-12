-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetNameEng] 
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
	IF (@Title IS NULL) OR (@Title = '')
		BEGIN
			SET @Result = ISNULL(@FirstName,'') + ' ' + ISNULL(@LastName,'');
		END
	ELSE
		BEGIN
			IF (@Title LIKE 'MR%') OR (@Title LIKE 'MISS%') OR (@Title LIKE 'MRS%') 
				BEGIN
					SET @Result = ISNULL(@Title,'') + ' ' + ISNULL(@FirstName,'') + ' ' + ISNULL(@LastName,'');
				END
			ELSE IF (@Title LIKE '%CO.,LTD.') OR (@Title LIKE '%L.P.')
				BEGIN
					SET @Result = ISNULL(@FirstName,'') + ' ' + ISNULL(@LastName,'') + ISNULL(@Title,'');
				END
			ELSE
				BEGIN
					SET @Result = ISNULL(@FirstName,'') + ' ' + ISNULL(@LastName,'') + '[' + ISNULL(@Title,'') + ']';
				END
		END
	

	-- Return the result of the function
	RETURN @Result

END
