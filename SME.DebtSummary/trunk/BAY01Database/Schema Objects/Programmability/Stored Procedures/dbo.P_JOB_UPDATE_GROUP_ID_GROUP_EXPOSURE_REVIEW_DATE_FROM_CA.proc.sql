

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_JOB_UPDATE_GROUP_ID_GROUP_EXPOSURE_REVIEW_DATE_FROM_CA]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
		
			-- UPDATE CUSTOMER SME DETAIL
			UPDATE [dbo].[CUSTOMER_SME]
			   SET [GROUP_ID] = F.GROUP_ID
					,[CM_CODE] = CASE WHEN LEN(ISNULL(CM_CODE_IN_CA,''))<1 THEN [CM_CODE] ELSE CM_CODE_IN_CA END
					,[OLD_CM_CODE] = CASE WHEN LEN(ISNULL(CM_CODE_IN_CA,''))<1 THEN [OLD_CM_CODE] ELSE [CM_CODE] END
					,[BRANCH_ID] = BRANCH_ID_IN_CA
					,[BUSI_RISK1_ID] = CASE WHEN LEN(BUSI_RISK1_ID_IN_CA)<1 THEN [BUSI_RISK1_ID] ELSE BUSI_RISK1_ID_IN_CA END
					,[UPDATE_DATE] = GETDATE()
					,[UPDATE_BY] = 'SMEWEB'
					,[SIZE_ID] = CASE ISNULL(CUST_SIZE_IN_CA,1) WHEN 1 THEN [SIZE_ID] ELSE CUST_SIZE_IN_CA END
					,[RATING_TYPE_KEY] = CASE WHEN RATING_TYPE_KEY_IN_CA IS NULL THEN [RATING_TYPE_KEY] ELSE RATING_TYPE_KEY_IN_CA END
					,[RATING_KEY] = CASE WHEN RATING_KEY_IN_CA IS NULL THEN [RATING_KEY] ELSE RATING_KEY_IN_CA END
					,[RATING_UPDATE_DATE] = CASE WHEN  RATING_DATE_IN_CA IS NULL THEN [RATING_UPDATE_DATE] ELSE RATING_DATE_IN_CA END
					,[EXTERNAL_SOURCE_MEMO] = CONVERT(varchar,[EXTERNAL_SOURCE_MEMO]) + ' AND P_JOB_UPDATE_GROUP_ID_GROUP_EXPOSURE_REVIEW_DATE_FROM_CA'
					,[NEXT_REVIEW_DATE] = CASE WHEN NEXT_REVIEW_DATE_IN_CA IS NULL THEN [NEXT_REVIEW_DATE] ELSE NEXT_REVIEW_DATE_IN_CA END
			  FROM [dbo].[CUSTOMER_SME] INNER JOIN (
												SELECT D.[ID]
													  ,[CIF]
													  ,[GROUP_ID]
													  ,CUST_SIZE_IN_CA
													  ,[RATING_TYPE_KEY] AS RATING_TYPE_KEY_IN_CA
													  ,RATING_KEY_IN_CA
													  ,RATING_DATE_IN_CA
													  ,BUSI_RISK1_ID_IN_CA
													  ,NEXT_REVIEW_DATE_IN_CA
													  ,CM_CODE_IN_CA
													  ,BRANCH_ID_IN_CA
													  ,[PROCESS_DATE]
													  ,[PROCESS_GROUP]
												FROM (SELECT [ID]
															  ,[CIF]
															  ,CUST_SIZE_IN_CA
															  ,RATING_KEY_IN_CA
															  ,RATING_DATE_IN_CA
															  ,BUSI_RISK1_ID_IN_CA
															  ,NEXT_REVIEW_DATE_IN_CA
															  ,CM_CODE_IN_CA
															  ,BRANCH_ID_IN_CA
															  ,[PROCESS_DATE]
															  ,[PROCESS_GROUP]
														FROM (SELECT [ANNALS_CUS_CA].[ID]
																  ,[CIF]
																  ,[Customer_Size] AS CUST_SIZE_IN_CA
																  ,[RATING_KEY] AS RATING_KEY_IN_CA
																  ,[RATING_DATE] AS RATING_DATE_IN_CA
																  ,[BUSI_RISK1_ID] AS BUSI_RISK1_ID_IN_CA
																  ,[REVIEW_DATE] AS NEXT_REVIEW_DATE_IN_CA
																  ,[EMP_CONTROL] AS CM_CODE_IN_CA
																  ,[BRANCH_ID] AS BRANCH_ID_IN_CA
																  ,[PROCESS_DATE]
																  ,[PROCESS_GROUP]
																  ,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY [PROCESS_GROUP],[PROCESS_DATE] DESC) AS SEQ
															  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN (
																												SELECT [OLD_ID]
																												  ,[PROCESS_ID]
																												  ,[PROCESS]
																												  ,[PROCESS_DATE]
																												  ,[PROCESS_GROUP]
																												  ,[LEVEL_ID]
																												  ,[LEVEL_NAME]
																												  ,[EMP_ID]
																											  FROM [CA_REPORT].[V_005_LAST_PROCESS]
																											WHERE [PROCESS_GROUP] IN ('C','D','E')
																												AND [PROCESS_DATE] > DATEADD(DAY,-1,GETDATE())
																												--AND [PROCESS_DATE] >= CONVERT(DATETIME,'01/01/2011',103)
																												--AND [PROCESS_DATE] < CONVERT(DATETIME,'02/08/2011',103)
																	) AS A ON [ANNALS_CUS_CA].ID = A.[OLD_ID] INNER JOIN [dbo].[ANNALS_CREDIT]
																			ON [ANNALS_CUS_CA].ID = [ANNALS_CREDIT].ID) AS C
														WHERE SEQ=1) AS D 
													INNER JOIN (SELECT ID,GROUP_ID
																FROM (
																		SELECT [ID]
																			  ,[ANNALS_CUS_CA].[CIF]
																			  ,[ANNALS_CUS_CA].[RATING_KEY]
																			  ,[RATING_DATE]
																			  ,[CUSTOMER_SME].GROUP_ID
																			  ,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY GROUP_ID) AS SEQ
																		  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN [dbo].[CUSTOMER_SME]
																			ON [ANNALS_CUS_CA].CIF = [CUSTOMER_SME].CIF
																		 WHERE EXISTS (SELECT GROUP_ID
																						FROM [dbo].CUSTOMER_SME_GROUP
																						WHERE [dbo].CUSTOMER_SME_GROUP.GROUP_ID = [dbo].CUSTOMER_SME.GROUP_ID)
																) AS B
																WHERE SEQ = 1) AS E
													ON D.ID = E.ID LEFT OUTER JOIN dbo.CUSTOMER_SME_RATING
													ON D.RATING_KEY_IN_CA = CUSTOMER_SME_RATING.RATING_KEY

											) AS F
					ON [CUSTOMER_SME].CIF = F.CIF

			-- UPDATE GROUP DETAIL
			UPDATE [dbo].[CUSTOMER_SME_GROUP]
			   SET [GROUP_EXPOSURE] = G.[GROUP_EXPOSURE] * 1000000
				  --,[NEXT_REVIEW_DATE] = G.[NEXT_REVIEW_DATE]
				  ,[GROUP_SIZE_ID] = CASE  
					WHEN G.[GROUP_EXPOSURE] <= 7.5 THEN 2
					WHEN G.[GROUP_EXPOSURE] <= 10 THEN 3
					WHEN G.[GROUP_EXPOSURE] <= 20 THEN 4
					WHEN G.[GROUP_EXPOSURE] <= 50 THEN 5
					WHEN G.[GROUP_EXPOSURE] <= 100 THEN 6
					WHEN G.[GROUP_EXPOSURE] <= 200 THEN 7
					WHEN G.[GROUP_EXPOSURE] <= 500 THEN 8
					WHEN G.[GROUP_EXPOSURE] <= 1000 THEN 9
					WHEN G.[GROUP_EXPOSURE] > 1000 THEN 10
					ELSE 1
					END
			  FROM [CUSTOMER_SME_GROUP] INNER JOIN (
												SELECT A.ID,GROUP_ID,[GROUP_EXPOSURE]--,[NEXT_REVIEW_DATE]
												FROM (
														SELECT [ID]
															  ,[ANNALS_CUS_CA].[CIF]
															  ,[ANNALS_CUS_CA].[RATING_KEY]
															  ,[RATING_DATE]
															  ,[CUSTOMER_SME].GROUP_ID
															  ,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY GROUP_ID) AS SEQ
														  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN [dbo].[CUSTOMER_SME]
															ON [ANNALS_CUS_CA].CIF = [CUSTOMER_SME].CIF
														 WHERE EXISTS (SELECT *
																		FROM [dbo].CUSTOMER_SME_GROUP
																		WHERE [dbo].CUSTOMER_SME_GROUP.GROUP_ID = [dbo].CUSTOMER_SME.GROUP_ID)
												) AS A INNER JOIN (SELECT [OLD_ID]
																		  ,[PROCESS_ID]
																		  ,[PROCESS]
																		  ,[PROCESS_DATE]
																		  ,[PROCESS_GROUP]
																		  ,[LEVEL_ID]
																		  ,[LEVEL_NAME]
																		  ,[EMP_ID]
																	  FROM [CA_REPORT].[V_005_LAST_PROCESS]
																	WHERE [PROCESS_GROUP] IN ('C','D','E')
																		AND [PROCESS_DATE] > DATEADD(DAY,-1,GETDATE())
																		--AND [PROCESS_DATE] >= CONVERT(DATETIME,'08/07/2011',103)
																		--AND [PROCESS_DATE] < CONVERT(DATETIME,'09/07/2011',103)
																	) AS B
													ON A.ID = B.[OLD_ID] INNER JOIN (SELECT ID
																							,[GROUP_EXPOSURE]
																							--,[REVIEW_DATE] AS [NEXT_REVIEW_DATE]
																						FROM [dbo].[ANNALS_CREDIT]
																						WHERE [GROUP_EXPOSURE] IS NOT NULL 
																							OR [REVIEW_DATE] IS NOT NULL) AS C
													ON A.ID = C.ID
												WHERE SEQ = 1) AS G	  			
					ON [CUSTOMER_SME_GROUP].GROUP_ID = G.GROUP_ID
		
		-- CLEAR NOT USE GROUP_ID
		DELETE FROM [dbo].[CUSTOMER_SME_GROUP]
		  WHERE NOT EXISTS (SELECT DISTINCT GROUP_ID
							FROM [dbo].[CUSTOMER_SME]
							WHERE [CUSTOMER_SME].GROUP_ID = [CUSTOMER_SME_GROUP].GROUP_ID)
							
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


