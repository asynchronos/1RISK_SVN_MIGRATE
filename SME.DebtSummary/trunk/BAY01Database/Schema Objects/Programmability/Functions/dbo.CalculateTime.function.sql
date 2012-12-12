
-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 15 AUG 2008
-- Description:	รับค่าวินาทีแล้วมาคำนวนว่าเป็นกี่วันกี่ชั่วโมงกี่นาทีกี่วินาที
-- =============================================
create FUNCTION [dbo].[CalculateTime]
(
	-- Add the parameters for the function here
	@TimePart nvarchar(5),
	@SecondInput int
)
RETURNS nvarchar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(30)

	DECLARE @startWork datetime,@finishWork datetime

	SET @startWork = convert(datetime,'1/1/1900',103)
	SET @finishWork = dateadd(second,@SecondInput,@startWork)

	DECLARE @day nvarchar(20),@hour nvarchar(2),@minute nvarchar(2),@second nvarchar(2)
	
	SET @day = convert(nvarchar(20),datediff(day,@startWork,@finishWork))
	SET @hour = convert(nvarchar(2),datepart(hour,@finishWork))
	SET @minute = convert(nvarchar(2),datepart(minute,@finishWork))
	SET @second = convert(nvarchar(2),datepart(second,@finishWork))

	IF(UPPER(@TimePart) = 'DAY') OR (UPPER(@TimePart) = 'DD') OR (UPPER(@TimePart) = 'D')
		BEGIN
			SET @Result = @day
		END
	ELSE IF(UPPER(@TimePart) = 'HOUR') OR (UPPER(@TimePart) = 'HH')
		BEGIN
			SET @Result = @hour
		END
	ELSE IF(UPPER(@TimePart) = 'MINUTE') OR (UPPER(@TimePart) = 'MI') OR (UPPER(@TimePart) = 'N')
		BEGIN
			SET @Result = @minute
		END
	ELSE IF(UPPER(@TimePart) = 'SECOND') OR (UPPER(@TimePart) = 'SS') OR (UPPER(@TimePart) = 'S')
		BEGIN
			SET @Result = @second
		END
	ELSE
		BEGIN
			SET @Result = @day +'วัน'+@hour+'ชั่วโมง'+@minute+'นาที'+@second+'วินาที'
		END

	-- Return the result of the function
	RETURN @Result

END

