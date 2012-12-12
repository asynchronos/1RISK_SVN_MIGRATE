-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 15 Aug 2008
-- Description:	หาเวลาทำงานของเวลาเริ่มต้น-เวลาสิ้นสุดใดๆ
-- =============================================
CREATE FUNCTION [dbo].[FindWorkingTime] 
(
	-- Add the parameters for the function here
	@StartTime datetime,
	@FinishTime datetime,
	@WorkingHourStart varchar(2),
	@WorkingMinuteStart varchar(2),
	@WorkingHourEnd varchar(2),
	@WorkingMinuteEnd varchar(2)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int; -- sec
	DECLARE @timeInRigisterDate int,@timeInApproveDate int,@timeInMiddle int; -- sec,sec,sec

	DECLARE @startWorkingHour datetime,@endWorkingHour datetime;
	SET @startWorkingHour = convert(datetime,'1/1/2008 '+@WorkingHourStart+':'+@WorkingMinuteStart+':00.000',103);
	SET @endWorkingHour = convert(datetime,'1/1/2008 '+@WorkingHourEnd+':'+@WorkingMinuteEnd+':00.000',103);

	DECLARE @secPerManday int; -- sec
	SET @secPerManday = Datediff(second,@startWorkingHour,@endWorkingHour)-(60*60); -- default 8 ชั่วโมง
	
	DECLARE @totalMiddleDay int; -- day
	SET @totalMiddleDay = DATEDIFF(day, @StartTime, @FinishTime) - 1;

	-- (DateDiff(second,วันที่processแรก,วันที่processสุดท้าย) - [DateDiff(day,วันที่processแรก,วันที่processสุดท้าย)*เวลาที่ไม่ใช่เวลางานต่อ1วัน] - เวลางานในวันหยุด
--	SET @Result = DATEDIFF(second, @StartTime, @FinishTime)
--					- (DATEDIFF(day, @StartTime, @FinishTime)*(24*60*60-@secPerManday))
--					- ((SELECT COUNT(days) FROM TB_HOLIDAY WHERE days > @StartTime AND DATEADD(day,1,days) < @FinishTime)*@secPerManday )

	IF (@totalMiddleDay > 0)
		BEGIN
			DECLARE @timeInHoliday int; --sec
			SET @timeInHoliday = ((SELECT COUNT(days) FROM TB_HOLIDAY WHERE days > @StartTime AND DATEADD(day,1,days) < @FinishTime) *@secPerManday )

			SET @timeInMiddle = @totalMiddleDay*@secPerManday;
			SET @timeInMiddle = @timeInMiddle - @timeInHoliday;
		END
	ELSE
		BEGIN
			SET @timeInMiddle = 0;
		END

	DECLARE @fullTimeInRigisterDate int,@fullTimeInApproveDate int; -- sec,sec
	SET @fullTimeInRigisterDate = dbo.TimeDiff(@StartTime, @endWorkingHour);
	SET @fullTimeInApproveDate = dbo.TimeDiff(@startWorkingHour, @FinishTime);

	IF (@fullTimeInRigisterDate <= 0)
		BEGIN
			SET @timeInRigisterDate = 0;
		END
	ELSE
		BEGIN
			DECLARE @DateDiffBefore12 int
			SET @DateDiffBefore12 = dbo.TimeDiff(@StartTime,convert(datetime,'1/1/2008 12:00:00.000',103));

			IF (@DateDiffBefore12 >= 0)
				BEGIN
					SET @timeInRigisterDate = @fullTimeInRigisterDate - (60*60);
				END
			ELSE
				BEGIN
					DECLARE @DateDiffIn12_13 int;
					SET @DateDiffIn12_13 = dbo.TimeDiff(@StartTime,convert(datetime,'1/1/2008 13:00:00.000',103));

					IF (@DateDiffIn12_13 >= 0)
						BEGIN
							SET @timeInRigisterDate = @fullTimeInRigisterDate - @DateDiffIn12_13;
						END
					ELSE
						BEGIN
							SET @timeInRigisterDate = @fullTimeInRigisterDate;
						END
				END
		END

		IF (@fullTimeInApproveDate <= 0)
			BEGIN
				SET @timeInApproveDate = 0;
			END
		ELSE
			BEGIN
				DECLARE @DateDiffAfter12 int
				SET @DateDiffAfter12 = dbo.TimeDiff(convert(datetime,'1/1/2008 12:00:00.000',103),@FinishTime);

				IF (@DateDiffAfter12 > 0)
					BEGIN
						DECLARE @DateDiffBefore_13 int;
						SET @DateDiffBefore_13 = dbo.TimeDiff(@FinishTime,convert(datetime,'1/1/2008 13:00:00.000',103));

						IF (@DateDiffBefore_13 > 0)
							BEGIN
								SET @timeInApproveDate = @fullTimeInApproveDate - ((60*60)-@DateDiffBefore_13);
							END
						ELSE
							BEGIN
								SET @timeInApproveDate = @fullTimeInApproveDate - (60*60);
							END
					END
				ELSE
					BEGIN
						SET @timeInApproveDate = @fullTimeInApproveDate;
					END
			END

	SET @Result = @timeInRigisterDate + @timeInMiddle +  @timeInApproveDate;

	-- ถ้าวันที่หนังสือเข้ากับวันที่หนังสือออกเป็นวันเดียวกันต้องลบเวลาไปอีก 1 Manday(ไม่รวมพักกลางวัน)
	IF day(@StartTime) = day(@FinishTime)
		BEGIN
			SET @Result = @Result - (DateDiff(second,@startWorkingHour,@endWorkingHour) - (60*60))
		END

	-- Return the result of the function
	RETURN @Result

END

