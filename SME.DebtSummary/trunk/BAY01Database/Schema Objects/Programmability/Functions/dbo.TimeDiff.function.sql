-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 15 Nov 2008
-- Description:	ใช้หาผลต่างของเวลาโดยไม่อิงวันที่เป็นหน่วย second
-- =============================================
create FUNCTION [dbo].[TimeDiff]
(
	-- Add the parameters for the function here
	@StartTime datetime,
	@FinishTime datetime
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	DECLARE @TempStart datetime,@TempFinish datetime
	SET @TempStart = @StartTime
	SET @TempFinish = DateAdd(day,DateDiff(day,@FinishTime,@StartTime),@FinishTime)

	SET @Result = Datediff(second,@TempStart,@TempFinish)

	-- Return the result of the function
	RETURN @Result

END
