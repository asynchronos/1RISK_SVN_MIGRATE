
-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 29 OCT 2008
-- Description:	REP_OD_RISK_TABLE
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_RISK_TABLE]
	-- Add the parameters for the stored procedure here
	@accno nvarchar(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--DECLARE all result
	DECLARE @riskMovementAvg smallmoney, @riskMovementLast smallmoney;
	DECLARE @riskUtilizationAvg smallmoney, @riskUtilizationLast smallmoney;
	DECLARE @riskWithdrawCheque smallmoney, @riskDepositCheque smallmoney;

	--DECLARE variable use
	DECLARE @withdrawMovementAvg money, @depositMovementAvg money;
	DECLARE @withdrawMovementLast money, @depositMovementLast money;
	DECLARE @utilizationAvg money, @utilizationLast money;
	DECLARE @chequeReWithdraw money, @chequeReDeposit money;
	DECLARE @limitAvg money,@limitLast money;

	SELECT @limitAvg = [LIM_AVG]
			,@limitLast = [limit01]
			,@withdrawMovementAvg = [mvmdr_avg]
			,@depositMovementAvg = [mvmcr_avg]
			,@withdrawMovementLast = [mvmdam01]
			,@depositMovementLast = [mvmcam01]
			,@utilizationAvg = [utiliz_avg]
			,@utilizationLast = [utineg01]
			,@chequeReWithdraw = CASE WHEN nmonth_cur<>0 THEN [chqre_daca]/(nmonth_cur) ELSE 0 END
			,@chequeReDeposit = CASE WHEN nmonth_cur<>0 THEN [chqre_caca]/(nmonth_cur) ELSE 0 END
	  FROM [REP_OD]
	  WHERE accno = @accno

	IF @limitAvg <> 0
		BEGIN
			SET @riskMovementAvg = ((@withdrawMovementAvg+@depositMovementAvg)*100/(2*@limitAvg));
			SET @riskMovementLast = ((@withdrawMovementLast+@depositMovementLast)*100/(2*@limitAvg));
			SET @riskUtilizationAvg = @utilizationAvg*100/@limitAvg;
		END
	ELSE
		BEGIN
			SET @riskMovementAvg = 0;
			SET @riskMovementLast = 0;
			SET @riskUtilizationAvg = 0;
		END

	IF @limitLast <> 0
		BEGIN
			SET @riskUtilizationLast = @utilizationLast*100/@limitLast;
		END
	ELSE
		BEGIN
			SET @riskUtilizationLast = 0;
		END

	IF @withdrawMovementAvg <> 0
		BEGIN
			SET @riskWithdrawCheque = @chequeReWithdraw*100/@withdrawMovementAvg;
		END
	ELSE
		BEGIN
			SET @riskWithdrawCheque = 0;
		END
	
	IF @depositMovementAvg <> 0
		BEGIN
			SET @riskDepositCheque = @chequeReDeposit*100/@depositMovementAvg;
		END
	ELSE
		BEGIN
			SET @riskDepositCheque = 0;
		END
	

	DECLARE @criteria1_1 int, @criteria1_2 int, @criteria1_3 int;
	DECLARE @criteria2_1 int, @criteria2_2 int, @criteria2_3 int;

	SET @criteria1_1 = 70;
	SET @criteria1_2 = 30;

	SET @criteria2_1 = 5;
	SET @criteria2_2 = 10;

	SELECT '>' + CONVERT(NVARCHAR(3),@criteria1_1) + '%' AS CriteriaMovement
			,CASE WHEN @riskMovementAvg>@criteria1_1 THEN LTRIM(STR(@riskMovementAvg,6,2))+'%' ELSE '' END AS [Movement(Avg)]
			,CASE WHEN @riskMovementLast>@criteria1_1 THEN LTRIM(STR(@riskMovementLast,6,2))+'%' ELSE '' END AS [Movement(Last)]
			,'<' + CONVERT(NVARCHAR(3),@criteria1_2) + '%' AS CriteriaUtilize
			,CASE WHEN @riskUtilizationAvg<@criteria1_2 THEN LTRIM(STR(@riskUtilizationAvg,6,2))+'%' ELSE '' END AS [Utilization(Avg)]
			,CASE WHEN @riskUtilizationLast<@criteria1_2 THEN LTRIM(STR(@riskUtilizationLast,6,2))+'%' ELSE '' END AS [Utilization(Last)]
			,'<' + CONVERT(NVARCHAR(3),@criteria2_1) + '%' AS CriteriaCheque
			,CASE WHEN @riskWithdrawCheque<@criteria2_1 THEN LTRIM(STR(@riskWithdrawCheque,6,2))+'%' ELSE '' END AS [Withdraw]
			,CASE WHEN @riskDepositCheque<@criteria2_1 THEN LTRIM(STR(@riskDepositCheque,6,2))+'%' ELSE '' END AS [Deposit]
	UNION ALL
	SELECT CONVERT(NVARCHAR(3),@criteria1_2)+'-'+CONVERT(NVARCHAR(3),@criteria1_1)+'%' AS CriteriaMovement
			,CASE WHEN @riskMovementAvg>=@criteria1_2 AND @riskMovementAvg<@criteria1_1 THEN LTRIM(STR(@riskMovementAvg,6,2))+'%' ELSE '' END AS [Movement(Avg)]
			,CASE WHEN @riskMovementLast>=@criteria1_2 AND @riskMovementLast<@criteria1_1 THEN LTRIM(STR(@riskMovementLast,6,2))+'%' ELSE '' END AS [Movement(Last)]
			,CONVERT(NVARCHAR(3),@criteria1_2)+'-'+CONVERT(NVARCHAR(3),@criteria1_1) + '%' AS CriteriaUtilize
			,CASE WHEN @riskUtilizationAvg>=@criteria1_2 AND @riskUtilizationAvg<@criteria1_1 THEN LTRIM(STR(@riskUtilizationAvg,6,2))+'%' ELSE '' END AS [Utilization(Avg)]
			,CASE WHEN @riskUtilizationLast>=@criteria1_2 AND @riskUtilizationLast<@criteria1_1 THEN LTRIM(STR(@riskUtilizationLast,6,2))+'%' ELSE '' END AS [Utilization(Last)]
			,CONVERT(NVARCHAR(3),@criteria2_1)+'-'+CONVERT(NVARCHAR(3),@criteria2_2) + '%' AS CriteriaCheque
			,CASE WHEN @riskWithdrawCheque>=@criteria2_1 AND @riskWithdrawCheque<@criteria2_2 THEN LTRIM(STR(@riskWithdrawCheque,6,2))+'%' ELSE '' END AS [Withdraw]
			,CASE WHEN @riskDepositCheque>=@criteria2_1 AND @riskDepositCheque<@criteria2_2 THEN LTRIM(STR(@riskDepositCheque,6,2))+'%' ELSE '' END AS [Deposit]
	UNION ALL
	SELECT '<' + CONVERT(NVARCHAR(3),@criteria1_2) + '%' AS CriteriaMovement
			,CASE WHEN @riskMovementAvg<@criteria1_2 THEN LTRIM(STR(@riskMovementAvg,6,2))+'%' ELSE '' END AS [Movement(Avg)]
			,CASE WHEN @riskMovementLast<@criteria1_2 THEN LTRIM(STR(@riskMovementLast,6,2))+'%' ELSE '' END AS [Movement(Last)]
			,'>' + CONVERT(NVARCHAR(3),@criteria1_1) + '%' AS CriteriaUtilize
			,CASE WHEN @riskUtilizationAvg>@criteria1_1 THEN LTRIM(STR(@riskUtilizationAvg,6,2))+'%' ELSE '' END AS [Utilization(Avg)]
			,CASE WHEN @riskUtilizationLast>@criteria1_1 THEN LTRIM(STR(@riskUtilizationLast,6,2))+'%' ELSE '' END AS [Utilization(Last)]
			,'>' + CONVERT(NVARCHAR(3),@criteria2_2) + '%' AS CriteriaCheque
			,CASE WHEN @riskWithdrawCheque>@criteria2_2 THEN LTRIM(STR(@riskWithdrawCheque,6,2))+'%' ELSE '' END AS [Withdraw]
			,CASE WHEN @riskDepositCheque>@criteria2_2 THEN LTRIM(STR(@riskDepositCheque,6,2))+'%' ELSE '' END AS [Deposit]

 --for debug
--	SELECT @riskMovementAvg as riskMovementAvg,@riskMovementLast as riskMovementLast,@riskUtilizationAvg as riskUtilizationAvg
--			,@riskUtilizationLast as riskUtilizationLast,@riskWithdrawCheque as riskWithdrawCheque,@riskDepositCheque as riskDepositCheque
			
END

