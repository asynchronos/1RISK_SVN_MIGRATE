-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 7 NOV 2008
-- Description:	SPLIT CHARACTER IN TEXT TO TABLE WITH DELIMITER
-- Example:
--		DECLARE @text nvarchar(MAX);
--		SET @text = '1,12,18,77,45,229046,';
--		SELECT * FROM dbo.SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@text, N',')
-- =============================================
CREATE FUNCTION [dbo].[SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER]
(
	-- Add the parameters for the function here
	@TEXT NVARCHAR(MAX),
	@DELIMITER NVARCHAR(10)
)
RETURNS 
@TEMP TABLE
(
	-- Add the column definitions for the TABLE variable here
	IN_KEY NVARCHAR(MAX),
	SEQ INT, 
	TXT NVARCHAR(255)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	DECLARE @NEXTSTRING NVARCHAR(MAX);
	DECLARE @POS INT;
	DECLARE @NEXTPOS INT;
	DECLARE @COMMACHECK NVARCHAR(1);
	DECLARE @INDEX INT;

	--INITIALIZE
	SET @NEXTSTRING = '';
	SET @COMMACHECK = RIGHT(@TEXT,1);
	SET @INDEX = 1;

	--CHECK FOR TRAILING COMMA, IF NOT EXISTS, INSERT
	IF (@COMMACHECK <> @DELIMITER )
	SET @TEXT = @TEXT + @DELIMITER;

	--GET POSITION OF FIRST COMMA
	SET @POS = CHARINDEX(@DELIMITER,@TEXT);
	SET @NEXTPOS = 1;

	--LOOP WHILE THERE IS STILL A COMMA IN THE STRING OF LEVELS
	WHILE (@POS <>  0)  
		BEGIN
			SET @NEXTSTRING = SUBSTRING(@TEXT,1,@POS - 1)

			IF LEN(@NEXTSTRING)>0
				BEGIN
					INSERT INTO @TEMP (
						IN_KEY
						,SEQ
						,TXT
					) VALUES (
						@TEXT
						,@INDEX
						,@NEXTSTRING
					)
				END

			SET @TEXT = SUBSTRING(@TEXT,@POS +1,LEN(@TEXT));

			SET @NEXTPOS = @POS;
			SET @POS  = CHARINDEX(@DELIMITER,@TEXT);
			SET @INDEX = @INDEX + 1;
		END

	RETURN 
END
