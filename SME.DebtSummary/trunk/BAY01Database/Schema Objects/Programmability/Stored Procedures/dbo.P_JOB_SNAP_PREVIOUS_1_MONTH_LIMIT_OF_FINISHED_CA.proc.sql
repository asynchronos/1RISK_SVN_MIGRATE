-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_JOB_SNAP_PREVIOUS_1_MONTH_LIMIT_OF_FINISHED_CA]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
		
			-- Delete Limit Same month key
			DELETE [BAY01].[CA_REPORT].[PREVIOUS_1_MONTH_LIMIT_OF_FINISHED_CA]
			WHERE [MONTH_KEY] = (SELECT ([MONTH_KEY]-1) AS [MONTH_KEY]
								  FROM [EDW]..[DWHADMIN].[MONTH]
								WHERE [YEAR] = YEAR(GETDATE()) AND [MONTH_NUMBER] = MONTH(GETDATE()));
								
			-- Insert Previous 1 month limit form edw link server
			INSERT INTO [BAY01].[CA_REPORT].[PREVIOUS_1_MONTH_LIMIT_OF_FINISHED_CA]
					   ([MONTH_KEY]
					   ,[CIF]
					   ,[LEADER1_CA_OLD_ID]
					   ,[CLS_LIMIT_ROOT_ID_KEY]
					   ,[CLS_LIMIT_L1_ID_KEY]
					   ,[CLS_LIMIT_L2_ID_KEY]
					   ,[CLS_LIMIT_L3_ID_KEY]
					   ,[CLS_LIMIT_L4_ID_KEY]
					   ,[CLS_LIMIT_L5_ID_KEY]
					   ,[CLS_LIMIT_L6_ID_KEY]
					   ,[CLS_LIMIT_L7_ID_KEY]
					   ,[CLS_LIMIT_L8_ID_KEY]
					   ,[CLS_LIMIT_PRODUCT_ID_KEY]
					   ,[PRODUCT_KEY]
					   ,[CLS_PRODUCT_ID_KEY]
					   ,[LIMIT_STATUS_ID_KEY]
					   ,[CLS_CURRENCY_ID_KEY]
					   ,[LIMIT_PURPOSE_ID_KEY]
					   ,[BUSINESS_RISK_ID_KEY]
					   ,[CA_KEY]
					   ,[CREATED_BY_USER_CODE]
					   ,[CREATED_BY_USER_NAME]
					   ,[UPDATED_BY_USER_CODE]
					   ,[UPDATED_BY_USER_NAME]
					   ,[UPDATED_STATUS_BY_USER_CODE]
					   ,[UPDATED_STATUS_BY_USER_NAME]
					   ,[LIMIT_NO_ROOT]
					   ,[LIMIT_NO_L1]
					   ,[LIMIT_NO_L2]
					   ,[LIMIT_NO_L3]
					   ,[LIMIT_NO_L4]
					   ,[LIMIT_NO_L5]
					   ,[LIMIT_NO_L6]
					   ,[LIMIT_NO_L7]
					   ,[LIMIT_NO_L8]
					   ,[LIMIT_NO_PRODUCT]
					   ,[LIMIT_ROOT_STATUS]
					   ,[LIMIT_L1_STATUS]
					   ,[LIMIT_L2_STATUS]
					   ,[LIMIT_L3_STATUS]
					   ,[LIMIT_L4_STATUS]
					   ,[LIMIT_L5_STATUS]
					   ,[LIMIT_L6_STATUS]
					   ,[LIMIT_L7_STATUS]
					   ,[LIMIT_L8_STATUS]
					   ,[LIMIT_PRODUCT_STATUS]
					   ,[LIMIT_REVOLVING_TYPE]
					   ,[APPL_KEY]
					   ,[APPL_ID]
					   ,[PRODUCT_CODE]
					   ,[PRODUCT_NAME]
					   ,[ACCOUNT_NO]
					   ,[CIF_LIST_CA_NO]
					   ,[CIF_LIST_ROOT]
					   ,[CIF_LIST_PRODUCT]
					   ,[NO_OF_CIF_CANO]
					   ,[LIMIT_AMOUNT_ROOT_THB]
					   ,[LIMIT_AMOUNT_ROOT_CCY]
					   ,[LIMIT_AMOUNT_L1_THB]
					   ,[LIMIT_AMOUNT_L1_CCY]
					   ,[LIMIT_AMOUNT_L2_THB]
					   ,[LIMIT_AMOUNT_L2_CCY]
					   ,[LIMIT_AMOUNT_L3_THB]
					   ,[LIMIT_AMOUNT_L3_CCY]
					   ,[LIMIT_AMOUNT_L4_THB]
					   ,[LIMIT_AMOUNT_L4_CCY]
					   ,[LIMIT_AMOUNT_L5_THB]
					   ,[LIMIT_AMOUNT_L5_CCY]
					   ,[LIMIT_AMOUNT_L6_THB]
					   ,[LIMIT_AMOUNT_L6_CCY]
					   ,[LIMIT_AMOUNT_L7_THB]
					   ,[LIMIT_AMOUNT_L7_CCY]
					   ,[LIMIT_AMOUNT_L8_THB]
					   ,[LIMIT_AMOUNT_L8_CCY]
					   ,[LIMIT_AMOUNT_PRODUCT_THB]
					   ,[LIMIT_AMOUNT_PRODUCT_CCY]
					   ,[LIMIT_USED_ROOT_THB]
					   ,[LIMIT_USED_ROOT_CCY]
					   ,[LIMIT_USED_L1_THB]
					   ,[LIMIT_USED_L1_CCY]
					   ,[LIMIT_USED_L2_THB]
					   ,[LIMIT_USED_L2_CCY]
					   ,[LIMIT_USED_L3_THB]
					   ,[LIMIT_USED_L3_CCY]
					   ,[LIMIT_USED_L4_THB]
					   ,[LIMIT_USED_L4_CCY]
					   ,[LIMIT_USED_L5_THB]
					   ,[LIMIT_USED_L5_CCY]
					   ,[LIMIT_USED_L6_THB]
					   ,[LIMIT_USED_L6_CCY]
					   ,[LIMIT_USED_L7_THB]
					   ,[LIMIT_USED_L7_CCY]
					   ,[LIMIT_USED_L8_THB]
					   ,[LIMIT_USED_L8_CCY]
					   ,[LIMIT_USED_PRODUCT_THB]
					   ,[LIMIT_USED_PRODUCT_CCY]
					   ,[LIMIT_AVAILABLE_ROOT_THB]
					   ,[LIMIT_AVAILABLE_L1_THB]
					   ,[LIMIT_AVAILABLE_L2_THB]
					   ,[LIMIT_AVAILABLE_L3_THB]
					   ,[LIMIT_AVAILABLE_L4_THB]
					   ,[LIMIT_AVAILABLE_L5_THB]
					   ,[LIMIT_AVAILABLE_L6_THB]
					   ,[LIMIT_AVAILABLE_L7_THB]
					   ,[LIMIT_AVAILABLE_L8_THB]
					   ,[LIMIT_AVAILABLE_PRODUCT_THB]
					   ,[LIMIT_AVAI_RATIO_L1_THB]
					   ,[LIMIT_AVAI_RATIO_L2_THB]
					   ,[LIMIT_AVAI_RATIO_L3_THB]
					   ,[LIMIT_AVAI_RATIO_L4_THB]
					   ,[LIMIT_AVAI_RATIO_L5_THB]
					   ,[LIMIT_AVAI_RATIO_L6_THB]
					   ,[LIMIT_AVAI_RATIO_L7_THB]
					   ,[LIMIT_AVAI_RATIO_L8_THB]
					   ,[LIMIT_AVAI_RATIO_PRODUCT_THB]
					   ,[HOLD_AMOUNT_THB]
					   ,[HOLD_AMOUNT_CCY]
					   ,[LIMIT_AMOUNT_CA_THB]
					   ,[LIMIT_USED_CA_THB]
					   ,[LIMIT_AVAILABLE_CA_THB]
					   ,[GECID]
					   ,[CREATED_DATE]
					   ,[UPDATE_DATE]
					   ,[UPDATE_STATUS_DATE]
					   ,[ASOFDATE]
					   ,[ETL_DT]
					   ,[LIMIT_PRODUCT_CA_NO]
					   ,[LIMIT_PRODUCT_CA_DATE]
					   ,[LIMIT_PRODUCT_APPV_DATE]
					   ,[LIMIT_PRODUCT_APPV_AUTH_UNIT]
					   ,[LIMIT_PRODUCT_PREVIOUS_CA_NO]
					   ,[LIMIT_PRODUCT_EFFECT_DATE]
					   ,[LIMIT_PRODUCT_EXPIRE_DATE]
					   ,[LIMIT_PRODUCT_SIGN_DATE]
					   ,[LEADER1_CREATED_DATE])
			     
			SELECT C.[MONTH_KEY],
				   R.CIF
				  ,R.LEADER1_CA_OLD_ID
				  ,L.[CLS_LIMIT_ROOT_ID_KEY]
				  ,L.[CLS_LIMIT_L1_ID_KEY]
				  ,L.[CLS_LIMIT_L2_ID_KEY]
				  ,L.[CLS_LIMIT_L3_ID_KEY]
				  ,L.[CLS_LIMIT_L4_ID_KEY]
				  ,L.[CLS_LIMIT_L5_ID_KEY]
				  ,L.[CLS_LIMIT_L6_ID_KEY]
				  ,L.[CLS_LIMIT_L7_ID_KEY]
				  ,L.[CLS_LIMIT_L8_ID_KEY]
				  ,L.[CLS_LIMIT_PRODUCT_ID_KEY]
				  ,L.[PRODUCT_KEY]
				  ,L.[CLS_PRODUCT_ID_KEY]
				  ,L.[LIMIT_STATUS_ID_KEY]
				  ,L.[CLS_CURRENCY_ID_KEY]
				  ,L.[LIMIT_PURPOSE_ID_KEY]
				  ,L.[BUSINESS_RISK_ID_KEY]
				  ,L.[CA_KEY]
				  ,L.[CREATED_BY_USER_CODE]
				  ,L.[CREATED_BY_USER_NAME]
				  ,L.[UPDATED_BY_USER_CODE]
				  ,L.[UPDATED_BY_USER_NAME]
				  ,L.[UPDATED_STATUS_BY_USER_CODE]
				  ,L.[UPDATED_STATUS_BY_USER_NAME]
				  ,L.[LIMIT_NO_ROOT]
				  ,L.[LIMIT_NO_L1]
				  ,L.[LIMIT_NO_L2]
				  ,L.[LIMIT_NO_L3]
				  ,L.[LIMIT_NO_L4]
				  ,L.[LIMIT_NO_L5]
				  ,L.[LIMIT_NO_L6]
				  ,L.[LIMIT_NO_L7]
				  ,L.[LIMIT_NO_L8]
				  ,L.[LIMIT_NO_PRODUCT]
				  ,L.[LIMIT_ROOT_STATUS]
				  ,L.[LIMIT_L1_STATUS]
				  ,L.[LIMIT_L2_STATUS]
				  ,L.[LIMIT_L3_STATUS]
				  ,L.[LIMIT_L4_STATUS]
				  ,L.[LIMIT_L5_STATUS]
				  ,L.[LIMIT_L6_STATUS]
				  ,L.[LIMIT_L7_STATUS]
				  ,L.[LIMIT_L8_STATUS]
				  ,L.[LIMIT_PRODUCT_STATUS]
				  ,L.[LIMIT_REVOLVING_TYPE]
				  ,L.[APPL_KEY]
				  ,L.[APPL_ID]
				  ,L.[PRODUCT_CODE]
				  ,L.[PRODUCT_NAME]
				  ,L.[ACCOUNT_NO]
				  ,L.[CIF_LIST_CA_NO]
				  ,L.[CIF_LIST_ROOT]
				  ,L.[CIF_LIST_PRODUCT]
				  ,L.[NO_OF_CIF_CANO]
				  ,L.[LIMIT_AMOUNT_ROOT_THB]
				  ,L.[LIMIT_AMOUNT_ROOT_CCY]
				  ,L.[LIMIT_AMOUNT_L1_THB]
				  ,L.[LIMIT_AMOUNT_L1_CCY]
				  ,L.[LIMIT_AMOUNT_L2_THB]
				  ,L.[LIMIT_AMOUNT_L2_CCY]
				  ,L.[LIMIT_AMOUNT_L3_THB]
				  ,L.[LIMIT_AMOUNT_L3_CCY]
				  ,L.[LIMIT_AMOUNT_L4_THB]
				  ,L.[LIMIT_AMOUNT_L4_CCY]
				  ,L.[LIMIT_AMOUNT_L5_THB]
				  ,L.[LIMIT_AMOUNT_L5_CCY]
				  ,L.[LIMIT_AMOUNT_L6_THB]
				  ,L.[LIMIT_AMOUNT_L6_CCY]
				  ,L.[LIMIT_AMOUNT_L7_THB]
				  ,L.[LIMIT_AMOUNT_L7_CCY]
				  ,L.[LIMIT_AMOUNT_L8_THB]
				  ,L.[LIMIT_AMOUNT_L8_CCY]
				  ,L.[LIMIT_AMOUNT_PRODUCT_THB]
				  ,L.[LIMIT_AMOUNT_PRODUCT_CCY]
				  ,L.[LIMIT_USED_ROOT_THB]
				  ,L.[LIMIT_USED_ROOT_CCY]
				  ,L.[LIMIT_USED_L1_THB]
				  ,L.[LIMIT_USED_L1_CCY]
				  ,L.[LIMIT_USED_L2_THB]
				  ,L.[LIMIT_USED_L2_CCY]
				  ,L.[LIMIT_USED_L3_THB]
				  ,L.[LIMIT_USED_L3_CCY]
				  ,L.[LIMIT_USED_L4_THB]
				  ,L.[LIMIT_USED_L4_CCY]
				  ,L.[LIMIT_USED_L5_THB]
				  ,L.[LIMIT_USED_L5_CCY]
				  ,L.[LIMIT_USED_L6_THB]
				  ,L.[LIMIT_USED_L6_CCY]
				  ,L.[LIMIT_USED_L7_THB]
				  ,L.[LIMIT_USED_L7_CCY]
				  ,L.[LIMIT_USED_L8_THB]
				  ,L.[LIMIT_USED_L8_CCY]
				  ,L.[LIMIT_USED_PRODUCT_THB]
				  ,L.[LIMIT_USED_PRODUCT_CCY]
				  ,L.[LIMIT_AVAILABLE_ROOT_THB]
				  ,L.[LIMIT_AVAILABLE_L1_THB]
				  ,L.[LIMIT_AVAILABLE_L2_THB]
				  ,L.[LIMIT_AVAILABLE_L3_THB]
				  ,L.[LIMIT_AVAILABLE_L4_THB]
				  ,L.[LIMIT_AVAILABLE_L5_THB]
				  ,L.[LIMIT_AVAILABLE_L6_THB]
				  ,L.[LIMIT_AVAILABLE_L7_THB]
				  ,L.[LIMIT_AVAILABLE_L8_THB]
				  ,L.[LIMIT_AVAILABLE_PRODUCT_THB]
				  ,L.[LIMIT_AVAI_RATIO_L1_THB]
				  ,L.[LIMIT_AVAI_RATIO_L2_THB]
				  ,L.[LIMIT_AVAI_RATIO_L3_THB]
				  ,L.[LIMIT_AVAI_RATIO_L4_THB]
				  ,L.[LIMIT_AVAI_RATIO_L5_THB]
				  ,L.[LIMIT_AVAI_RATIO_L6_THB]
				  ,L.[LIMIT_AVAI_RATIO_L7_THB]
				  ,L.[LIMIT_AVAI_RATIO_L8_THB]
				  ,L.[LIMIT_AVAI_RATIO_PRODUCT_THB]
				  ,L.[HOLD_AMOUNT_THB]
				  ,L.[HOLD_AMOUNT_CCY]
				  ,L.[LIMIT_AMOUNT_CA_THB]
				  ,L.[LIMIT_USED_CA_THB]
				  ,L.[LIMIT_AVAILABLE_CA_THB]
				  ,L.[GECID]
				  ,L.[CREATED_DATE]
				  ,L.[UPDATE_DATE]
				  ,L.[UPDATE_STATUS_DATE]
				  ,L.[ASOFDATE]
				  ,L.[ETL_DT]
				,CA.CA_NO AS LIMIT_PRODUCT_CA_NO
				,CA.CA_DATE AS LIMIT_PRODUCT_CA_DATE
				,CA.APPV_DATE AS LIMIT_PRODUCT_APPV_DATE
				,CA.APPV_AUTH_UNIT AS LIMIT_PRODUCT_APPV_AUTH_UNIT
				,CA.PREVIOUS_CA_NO AS LIMIT_PRODUCT_PREVIOUS_CA_NO
				,LIM.EFFECT_DATE AS LIMIT_PRODUCT_EFFECT_DATE
				,LIM.EXPIRE_DATE AS LIMIT_PRODUCT_EXPIRE_DATE
				,LIM.SIGN_DATE AS LIMIT_PRODUCT_SIGN_DATE
				,getdate() AS LEADER1_CREATED_DATE
			 
			  FROM	[EDW]..[DWHADMIN].[CLS_LIMIT_RELATION_FACT] L INNER JOIN
					[EDW]..[DWHADMIN].[CLS_CIF_PRODUCT_FACT] C 
					ON L.LIMIT_NO_PRODUCT = C.LIMIT_NO_PRODUCT INNER JOIN
					[EDW]..[DWHADMIN].[DIM_CLS_CA] CA
					ON L.CA_KEY = CA.CA_KEY INNER JOIN
					[EDW]..[DWHADMIN].[DIM_CLS_LIMIT] LIM
					ON L.CLS_LIMIT_PRODUCT_ID_KEY = LIM.CLS_LIMIT_ID_KEY INNER JOIN
					(SELECT DISTINCT [CIF],[OLD_ID] AS LEADER1_CA_OLD_ID
						  FROM [BAY01].[CA_REPORT].[V_006_CA_SUBJECT_SUMMARY]
						WHERE [LAST_PROCESS_DATE] > CONVERT(DATETIME, '1/' + CONVERT(varchar, MONTH(GETDATE())) + '/' + CONVERT(varchar, YEAR(GETDATE())), 103)
							AND [LAST_PROCESS_DATE] <= getdate()
							AND ([LAST_PROCESS_GROUP] = 'C' OR [LAST_PROCESS_GROUP] = 'D' OR [LAST_PROCESS_GROUP] = 'E')
					) R
					ON R.CIF = C.CIF
			WHERE C.MONTH_KEY = (SELECT ([MONTH_KEY]-1) AS [MONTH_KEY]
								  FROM [EDW]..[DWHADMIN].[MONTH]
								WHERE [YEAR] = YEAR(GETDATE()) AND [MONTH_NUMBER] = MONTH(GETDATE()))
				AND L.MONTH_KEY = (SELECT ([MONTH_KEY]-1) AS [MONTH_KEY]
								  FROM [EDW]..[DWHADMIN].[MONTH]
								WHERE [YEAR] = YEAR(GETDATE()) AND [MONTH_NUMBER] = MONTH(GETDATE()))
	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0

		ROLLBACK; --RollBack in case of Error

		-- you can Raise ERROR with RAISEERROR() Statement including the details of the exception

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return 
		-- error information about the original error that 
		-- caused execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );

	END CATCH
END
