-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 7 NOV 2008
-- Description:	SPLIT CHARACTER IN TEXT TO TABLE
-- Example:
--		DECLARE @text nvarchar(MAX);
--		SET @text = '1234567890';
--		SELECT * FROM dbo.SPILT_CHAR_TEXT_TO_TABLE(@text, 2)
-- =============================================
CREATE FUNCTION [dbo].[SPILT_CHAR_TEXT_TO_TABLE]
(
	-- Add the parameters for the function here
	@TEXT nvarchar(MAX),
	@LENGTH int = 1
)
RETURNS 
@TEMP TABLE 
(
	-- Add the column definitions for the TABLE variable here
	SEQ int, 
	TXT NVARCHAR(255)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	WHILE @LENGTH <= LEN(@TEXT)
	BEGIN
		INSERT INTO @TEMP
		SELECT @LENGTH, SUBSTRING(@TEXT,@LENGTH,1)
		
		SET @LENGTH = @LENGTH+1;
	END
	
	RETURN 
END
