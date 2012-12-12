
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_JOB_UPDATE_GROUP_ID_GROUP_EXPOSURE_REVIEW_DATE]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
		
			UPDATE [dbo].[CUSTOMER_SME]
			   SET [GROUP_ID] = F.GROUP_ID
			  FROM [CUSTOMER_SME] INNER JOIN (
												SELECT [CIF]
													  ,ID,GROUP_ID
													  ,[GROUP_EXPOSURE],[REVIEW_DATE]
													  ,[PROCESS_DATE]
													  ,[PROCESS_GROUP]
												FROM (

													SELECT [CIF]
														  ,D.ID,GROUP_ID,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY [PROCESS_DATE] DESC) AS SEQ
														  ,[GROUP_EXPOSURE],[REVIEW_DATE]
														  ,[PROCESS_DATE]
														  ,[PROCESS_GROUP]
													  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN
															(
																SELECT ID,GROUP_ID,[GROUP_EXPOSURE],[REVIEW_DATE]
																FROM (
																		SELECT [ID]
																			,[CUSTOMER_SME].[CIF]
																			  ,[GROUP_ID]
																			  ,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY GROUP_ID,[CUSTOMER_SME].CIF) AS SEQ
																			  ,[GROUP_EXPOSURE]
																			,[REVIEW_DATE]
																		  FROM [dbo].[CUSTOMER_SME] INNER JOIN 
																				(SELECT [ANNALS_CUS_CA].[ID]
																					  ,[CIF]
																					  --,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY [PROCESS_DATE] DESC) AS SEQ
																					  ,[RATING_KEY]
																					  ,[RATING_DATE]
																					  ,[GROUP_EXPOSURE]
																					  ,[REVIEW_DATE]
																					  ,[PROCESS_DATE]
																					  ,[PROCESS_GROUP]
																				  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN [dbo].[ANNALS_CREDIT]
																					ON [ANNALS_CUS_CA].ID = [ANNALS_CREDIT].ID INNER JOIN [CA_REPORT].[V_005_LAST_PROCESS] V05
																					ON [ANNALS_CREDIT].ID = V05.[OLD_ID]
																				  WHERE ([GROUP_EXPOSURE] IS NOT NULL OR [REVIEW_DATE] IS NOT NULL)
																						AND [PROCESS_GROUP] IN ('C','D','E')
																						AND [PROCESS_DATE] < CONVERT(DATETIME,'6/7/2011',103)) AS B
																			ON [CUSTOMER_SME].CIF = B.CIF
																	) AS C
																WHERE SEQ = 1
															) AS D
														ON [ANNALS_CUS_CA].ID = D.ID INNER JOIN [CA_REPORT].[V_005_LAST_PROCESS] V05
														ON D.ID = V05.[OLD_ID]
													 WHERE [PROCESS_GROUP] IN ('C','D','E')
														AND [PROCESS_DATE] < CONVERT(DATETIME,'6/7/2011',103)
													) AS E
												WHERE SEQ = 1
											) AS F
					ON [CUSTOMER_SME].CIF = F.CIF

			UPDATE [dbo].[CUSTOMER_SME_GROUP]
			   SET [GROUP_EXPOSURE] = G.[GROUP_EXPOSURE] * 1000000
				  ,[NEXT_REVIEW_DATE] = G.[REVIEW_DATE]
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
												SELECT DISTINCT GROUP_ID
													  ,[GROUP_EXPOSURE]
													  ,[REVIEW_DATE]
												FROM (SELECT [CIF]
															  ,ID,GROUP_ID
															  ,[GROUP_EXPOSURE],[REVIEW_DATE]
															  ,[PROCESS_DATE]
															  ,[PROCESS_GROUP]
															  ,ROW_NUMBER() OVER(PARTITION BY GROUP_ID ORDER BY [PROCESS_DATE] DESC) AS SEQ
														FROM (

															SELECT [CIF]
																  ,D.ID,GROUP_ID,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY [PROCESS_DATE] DESC) AS SEQ
																  ,[GROUP_EXPOSURE],[REVIEW_DATE]
																  ,[PROCESS_DATE]
																  ,[PROCESS_GROUP]
															  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN
																	(
																		SELECT ID,GROUP_ID,[GROUP_EXPOSURE],[REVIEW_DATE]
																		FROM (
																				SELECT [ID]
																					,[CUSTOMER_SME].[CIF]
																					  ,[GROUP_ID]
																					  ,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY GROUP_ID,[CUSTOMER_SME].CIF) AS SEQ
																					  ,[GROUP_EXPOSURE]
																					,[REVIEW_DATE]
																				  FROM [dbo].[CUSTOMER_SME] INNER JOIN 
																						(SELECT [ANNALS_CUS_CA].[ID]
																							  ,[CIF]
																							  --,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY [PROCESS_DATE] DESC) AS SEQ
																							  ,[RATING_KEY]
																							  ,[RATING_DATE]
																							  ,[GROUP_EXPOSURE]
																							  ,[REVIEW_DATE]
																							  ,[PROCESS_DATE]
																							  ,[PROCESS_GROUP]
																						  FROM [dbo].[ANNALS_CUS_CA] INNER JOIN [dbo].[ANNALS_CREDIT]
																							ON [ANNALS_CUS_CA].ID = [ANNALS_CREDIT].ID INNER JOIN [CA_REPORT].[V_005_LAST_PROCESS] V05
																							ON [ANNALS_CREDIT].ID = V05.[OLD_ID]
																						  WHERE ([GROUP_EXPOSURE] IS NOT NULL OR [REVIEW_DATE] IS NOT NULL)
																								AND [PROCESS_GROUP] IN ('C','D','E')
																								AND [PROCESS_DATE] < CONVERT(DATETIME,'6/7/2011',103)) AS B
																					ON [CUSTOMER_SME].CIF = B.CIF
																			) AS C
																		WHERE SEQ = 1
																	) AS D
																ON [ANNALS_CUS_CA].ID = D.ID INNER JOIN [CA_REPORT].[V_005_LAST_PROCESS] V05
																ON D.ID = V05.[OLD_ID]
															 WHERE [PROCESS_GROUP] IN ('C','D','E')
																AND [PROCESS_DATE] < CONVERT(DATETIME,'6/7/2011',103)
															) AS E
														WHERE SEQ = 1
													) AS F
													WHERE SEQ = 1
															) AS G	  			
					ON [CUSTOMER_SME_GROUP].GROUP_ID = G.GROUP_ID
			
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

