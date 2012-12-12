-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 20 NOV 2008
-- Description:	หาค่าลิมิตเฉลี่ยโดยที่ไม่นับค่าลิมิตที่เป็น0
-- =============================================
CREATE FUNCTION [GetLimitAvg]
(
	-- Add the parameters for the function here
	@ACCNO varchar(18)
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result money;

	DECLARE @CNT int;
	DECLARE @SUM money;

	-- Add the T-SQL statements to compute the return value here
	DECLARE @TEMP TABLE(
		seq int,
		limit money
	)

	INSERT INTO @TEMP
	SELECT 12, LIMIT12
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 11, LIMIT11
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 10, LIMIT10
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 9, LIMIT09
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 8, LIMIT08
		FROM REP_OD WHERE ACCNO=@ACCNO


	INSERT INTO @TEMP
	SELECT 7, LIMIT07
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 6, LIMIT06
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 5, LIMIT05
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 4, LIMIT04
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 3, LIMIT03
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 2, LIMIT02
		FROM REP_OD WHERE ACCNO=@ACCNO

	INSERT INTO @TEMP
	SELECT 1, LIMIT01
		FROM REP_OD WHERE ACCNO=@ACCNO

	SELECT @Result = (SUM(LIMIT)/COUNT(LIMIT))
	FROM @TEMP
	WHERE LIMIT>0

	-- Return the result of the function
	RETURN @Result

END
