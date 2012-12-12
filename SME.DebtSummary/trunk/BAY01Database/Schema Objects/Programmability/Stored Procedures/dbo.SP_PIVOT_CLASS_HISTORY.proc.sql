-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PIVOT_CLASS_HISTORY]
	-- Add the parameters for the stored procedure here
	@startDate datetime,
	@monthStep int,
	@historyValue nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	CREATE TABLE #CLASS_HIS(
		-- Add the column definitions for the TABLE variable here
		ID int,
		MONTH_VALUE datetime, 
		CLASS_VALUE nvarchar(1)
	)

		declare @cnt int;

		set @cnt = 0;

		WHILE @cnt < @monthStep
		BEGIN
			-- วันที่ที่ถูกลบเดือนตามลูปแล้ว
			declare @dateSteped datetime;
			set @dateSteped = dateadd(month,(-1)*@cnt,@startDate);

			declare @endOfMonth datetime;
			set @endOfMonth = dateadd(month,1,@dateSteped) - datepart(day,@dateSteped);
			
			INSERT INTO #CLASS_HIS
					(
						ID,
						MONTH_VALUE, 
						CLASS_VALUE
					)
			VALUES
					(
						@cnt + 1,
						@endOfMonth,
						substring(@historyValue,@cnt+1,1)
					)

			SET @cnt = @cnt + 1;
		END

	CREATE TABLE #UN_PIVOT(
		[MONTH] varchar(10), 
		CLASS_VALUE nvarchar(1)
	)

	INSERT INTO #UN_PIVOT
	SELECT SUBSTRING(CONVERT(varchar,MONTH_VALUE,106),4,len(CONVERT(varchar,MONTH_VALUE,106))) AS [MONTH], CLASS_VALUE
	FROM #CLASS_HIS

	DECLARE @MONTH_LIST varchar(max);

	SELECT @MONTH_LIST = COALESCE(@MONTH_LIST +',','')+'['+ [MONTH] +']'
	FROM #UN_PIVOT


	EXEC ('SELECT ' + @MONTH_LIST + 
			' FROM #UN_PIVOT' +
			' PIVOT (
					MAX(CLASS_VALUE)
					FOR [MONTH] IN (' + @MONTH_LIST + ')
				) AS PVT
			')

	DROP TABLE #CLASS_HIS
	DROP TABLE #UN_PIVOT
END
