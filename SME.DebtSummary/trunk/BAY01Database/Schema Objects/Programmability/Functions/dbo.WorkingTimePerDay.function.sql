-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 15 Aug 2008
-- Description:	ใช้หาเวลาทำงานต่อวัน(รวมพักกลางวัน)
-- =============================================
create FUNCTION [dbo].[WorkingTimePerDay] 
(
	-- Add the parameters for the function here
	@startWorkHour varchar(2),
	@startWorkMin varchar(2),
	@finishWorkHour varchar(2),
	@finishWorkMin varchar(2)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @secPerManday int

	DECLARE @startWork datetime,@finishWork datetime
	SET @startWork = convert(datetime,'1/1/2008 '+@startWorkHour+':'+@startWorkMin+':00.000',103)
	SET @finishWork = convert(datetime,'1/1/2008 '+@finishWorkHour+':'+@finishWorkMin+':00.000',103)
	SET @secPerManday = Datediff(second,@startWork,@finishWork)

	-- Return the result of the function
	RETURN @secPerManday

END
