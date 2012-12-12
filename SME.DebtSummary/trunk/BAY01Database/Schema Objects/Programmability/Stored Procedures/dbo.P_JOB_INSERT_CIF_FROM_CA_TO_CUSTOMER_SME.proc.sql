-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_JOB_INSERT_CIF_FROM_CA_TO_CUSTOMER_SME]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
		
			--นำ CIF ที่มีใน CA และอนุมัติในวันนี้แต่ยังไม่มีใน PORT ไปใส่ใน CUSTOMER_SME
			INSERT INTO [CUSTOMER_SME]
			   ([CIF]
			   ,[CM_CODE]
			   ,[SIZE_ID]
			   ,[UPDATE_DATE]
			   ,[EXTERNAL_SOURCE_MEMO]
			   ,[RATING_KEY]
			   ,[RATING_UPDATE_DATE]
			   ,[STATUS_ID])
			(
				SELECT CIF, EMP_ID AS [CM_CODE], SIZE_ID, GETDATE() AS [UPDATE_DATE], 'INSERT FROM CA TO PORT' AS[EXTERNAL_SOURCE_MEMO],[RATING_KEY]
		  ,[RATING_DATE], 1 AS [STATUS_ID]
				FROM  (SELECT LAST_PROCESS.ID, LAST_PROCESS.PROCESS_GROUP, LAST_PROCESS.PROCESS_DATE,LAST_PROCESS.SIZE_ID, LAST_PROCESS.SIZE_DETAIL, 
							   LAST_PROCESS.EMP_ID, dbo.ANNALS_CUS_CA.CIF,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ,[RATING_KEY]
		  ,[RATING_DATE]
						FROM  dbo.ANNALS_CUS_CA INNER JOIN
								   (SELECT dbo.ANNALS_CREDIT.ID, LP.PROCESS_GROUP, LP.PROCESS_DATE, 
												   dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, LP.EMP_ID,dbo.CUSTOMER_SME_SIZE.SIZE_ID
									FROM   CA_REPORT.V_005_LAST_PROCESS LP INNER JOIN
												   dbo.ANNALS_CREDIT ON LP.OLD_ID = dbo.ANNALS_CREDIT.ID INNER JOIN
												   dbo.CUSTOMER_SME_SIZE ON dbo.ANNALS_CREDIT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID
									WHERE PROCESS_GROUP = 'D') AS LAST_PROCESS ON 
							   dbo.ANNALS_CUS_CA.ID = LAST_PROCESS.ID
						WHERE CIF <> 0 
							AND LAST_PROCESS.PROCESS_DATE > DATEADD(DAY,-1,GETDATE())
							AND NOT EXISTS (SELECT CIF FROM CUSTOMER_SME WHERE CUSTOMER_SME.CIF = ANNALS_CUS_CA.CIF)) AS L
				WHERE SEQ =1
			 )   

			/*
				ใช้สำหรับ update ค่า cm_code ในตาราง CUSTOMER_SME ที่มีค่าเป็น null
				โดยจะไปหาค่า cm_code มาจาก CA ที่ Process สุดท้ายเป็น D
			*/
			UPDATE CUSTOMER_SME
			SET [CM_CODE] =	A.EMP_ID
				,[OLD_CM_CODE] = [CM_CODE]
				,[SIZE_ID] = A.SIZE_ID
				,[UPDATE_DATE] = GETDATE()
				,[UPDATE_BY] = 'SMEWEB'
				,[EXTERNAL_SOURCE_MEMO] = 'UPDATE CM&SIZE FROM CA'
				,[RATING_KEY] = A.[RATING_KEY]
				,[RATING_UPDATE_DATE] = A.[RATING_DATE]
				,[STATUS_ID] = 1
			FROM CUSTOMER_SME INNER JOIN (SELECT ID, PROCESS_GROUP, PROCESS_DATE,SIZE_ID, SIZE_DETAIL, 
												EMP_ID, CIF,[RATING_KEY],[RATING_DATE]
											FROM  (SELECT LAST_PROCESS.ID, LAST_PROCESS.PROCESS_GROUP, LAST_PROCESS.PROCESS_DATE,LAST_PROCESS.SIZE_ID, LAST_PROCESS.SIZE_DETAIL, 
														LAST_PROCESS.EMP_ID, dbo.ANNALS_CUS_CA.CIF,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ,[RATING_KEY]
														,[RATING_DATE]
													FROM  dbo.ANNALS_CUS_CA INNER JOIN
														   (SELECT dbo.ANNALS_CREDIT.ID, LP.PROCESS_GROUP, LP.PROCESS_DATE, 
																		   dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, LP.EMP_ID,dbo.CUSTOMER_SME_SIZE.SIZE_ID
															FROM   CA_REPORT.V_005_LAST_PROCESS LP INNER JOIN
																		   dbo.ANNALS_CREDIT ON LP.OLD_ID = dbo.ANNALS_CREDIT.ID INNER JOIN
																		   dbo.CUSTOMER_SME_SIZE ON dbo.ANNALS_CREDIT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID
															WHERE PROCESS_GROUP = 'D') AS LAST_PROCESS ON 
														   dbo.ANNALS_CUS_CA.ID = LAST_PROCESS.ID
													WHERE CIF <> 0 ) AS L
											WHERE SEQ =1) AS A
				ON A.CIF = CUSTOMER_SME.CIF
			WHERE (CUSTOMER_SME.CM_CODE IS NULL OR CUSTOMER_SME.CM_CODE = 0 OR CUSTOMER_SME.[RATING_KEY] IS NULL)
				AND STATUS_ID = 1 AND (A.[RATING_KEY] NOT IN (1,24,25))

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
