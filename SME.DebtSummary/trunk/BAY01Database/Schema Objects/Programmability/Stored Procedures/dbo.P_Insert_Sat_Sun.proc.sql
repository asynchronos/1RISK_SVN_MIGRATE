-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE P_Insert_Sat_Sun 
	-- Add the parameters for the stored procedure here
	@startYear varchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @firstDateOfYear datetime;
	SET @firstDateOfYear = CONVERT(datetime,'01/01/'+@startYear,103);

	DECLARE @endDateOfYear datetime;
	SET @endDateOfYear = CONVERT(datetime,'31/12/'+@startYear,103);

	DECLARE @firstSat datetime;
	SET @firstSat = DATEADD(day,7-DATEPART(weekday,@firstDateOfYear),@firstDateOfYear);

	DECLARE @firstSun datetime;
	SET @firstSun = DATEADD(day,1,@firstSat);

	DECLARE @runningSat datetime;
	SET @runningSat = @firstSat;

	DECLARE @runningSun datetime;

	CREATE TABLE #TMP(
		Days datetime,
		Days_Name nvarchar(50)
	)

	WHILE @runningSat<=@endDateOfYear
		BEGIN
			INSERT INTO #TMP
			SELECT @runningSat,'Saturday'

			SET @runningSun = DATEADD(day,1,@runningSat);

			IF @runningSun<=@endDateOfYear
				BEGIN
					INSERT INTO #TMP
					SELECT @runningSun,'Sunday'
				END

			SET @runningSat = DATEADD(day,7,@runningSat);
		END

	INSERT INTO [TB_Holiday]
			   ([Days]
			   ,[Days_Name])
		SELECT Days,Days_Name
		FROM #TMP
		WHERE NOT EXISTS (SELECT Days FROM TB_Holiday H WHERE H.Days=#TMP.Days)

	DROP TABLE #TMP
END
