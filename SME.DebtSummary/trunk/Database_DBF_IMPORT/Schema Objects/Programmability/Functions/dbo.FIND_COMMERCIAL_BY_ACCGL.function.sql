-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION FIND_COMMERCIAL_BY_ACCGL 
(
	-- Add the parameters for the function here
	@ACCGL INT
)
RETURNS CHAR(1)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RESULT CHAR(1);
	SET @RESULT = 'C';

	-- Add the T-SQL statements to compute the return value here
	DECLARE @FIRST_TWO_DIGIT CHAR(2);
	SET @FIRST_TWO_DIGIT = SUBSTRING(RTRIM(LTRIM(@ACCGL)),1,2);
	IF @FIRST_TWO_DIGIT = '11' OR @FIRST_TWO_DIGIT = '13'
		BEGIN
			DECLARE @FIRST_FIVE_DIGIT CHAR(5);
			SET @FIRST_FIVE_DIGIT = SUBSTRING(RTRIM(LTRIM(@ACCGL)),1,5);
			IF @FIRST_FIVE_DIGIT = '13105'
				BEGIN
					SET @RESULT = 'O'
				END
			ELSE
				BEGIN
					IF (@ACCGL = 1310341)
						OR	(@ACCGL = 1310343)
						OR	(@ACCGL = 1310353)
						OR	(@ACCGL = 1310354)
						OR	(@ACCGL = 1320111)
						OR	(@ACCGL = 1320123)
						BEGIN
							SET @RESULT = 'O'
						END
				END
		END
	ELSE
		BEGIN
			SET @RESULT = 'O'
		END	

	-- Return the result of the function
	RETURN @RESULT

END
