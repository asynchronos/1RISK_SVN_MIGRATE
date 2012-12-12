-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_HOLIDAYS_SAT_SUN_TO_TB_HOLIDAYS]
AS
BEGIN

	declare @year int
	declare @firstSaturdayOfYear datetime
	-- ระบุวันเสาร์แรกของปีด้วย
	SET @firstSaturdayOfYear = convert(datetime,'7/1/2012',103)
	SET	@year = year(@firstSaturdayOfYear)

	--PRINT @firstSaturdayOfYear
	--PRINT Dateadd(day,1,@firstSaturdayOfYear)

	 INSERT INTO [Bay01].[dbo].[TB_Holiday]
			   ([Days])
		 VALUES
			   (@firstSaturdayOfYear)

	 INSERT INTO [Bay01].[dbo].[TB_Holiday]
			   ([Days])
		 VALUES
			   (Dateadd(day,1,@firstSaturdayOfYear))


		  WHILE YEAR(Dateadd(day,7,@firstSaturdayOfYear)) = @year
			BEGIN
				SET @firstSaturdayOfYear = Dateadd(day,7,@firstSaturdayOfYear)
				--PRINT @firstSaturdayOfYear
				--PRINT Dateadd(day,1,@firstSaturdayOfYear)

				INSERT INTO [Bay01].[dbo].[TB_Holiday]
						   ([Days])
					 VALUES
						   (@firstSaturdayOfYear)

				INSERT INTO [Bay01].[dbo].[TB_Holiday]
						   ([Days])
					 VALUES
						   (Dateadd(day,1,@firstSaturdayOfYear))

			END

END
