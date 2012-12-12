-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_UPDATE_EXPO]
	-- Add the parameters for the stored procedure here
	 @EXPOSURE_ID int
	,@EXPOSURE_TYPE_ID int
	,@TOTAL_EXPOSURE numeric(20, 2)
	,@TOTAL_APPRAISAL numeric(20, 2)
	,@UPDATE_DATE datetime
	,@UPDATE_BY nvarchar(10)
	,@CIFs varchar(MAX)
	,@GROUP_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE [SME_GROUP_EXPOSURE]
			SET [EXPOSURE_TYPE_ID] = @EXPOSURE_TYPE_ID
			  ,[TOTAL_EXPOSURE] = @TOTAL_EXPOSURE
			  ,[TOTAL_APPRAISAL] = @TOTAL_APPRAISAL
			  ,[UPDATE_DATE] = @UPDATE_DATE
			  ,[UPDATE_BY] = @UPDATE_BY
			WHERE EXPOSURE_ID = @EXPOSURE_ID

			-- split ข้อมูลลง Table
			CREATE TABLE #TMP(
				CIF INT NOT NULL,
			 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
			(
				CIF ASC
			)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			) ON [PRIMARY]

			INSERT INTO #TMP
			SELECT DISTINCT CONVERT(int,TXT)
			FROM SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@CIFs,';')
			--end split ข้อมูลลง Table

			INSERT INTO [RELATION_EXPOSURE_CIF]
				   ([EXPOSURE_ID]
				   ,[CIF])
			SELECT   @EXPOSURE_ID
					,CIF
			FROM #TMP
			WHERE NOT EXISTS (
								SELECT CIF 
								FROM [RELATION_EXPOSURE_CIF] AS REF 
								WHERE #TMP.CIF=REF.CIF
									AND [EXPOSURE_ID]=@EXPOSURE_ID
							)

			DELETE FROM [RELATION_EXPOSURE_CIF]
			WHERE NOT EXISTS (SELECT CIF FROM #TMP WHERE #TMP.CIF=[RELATION_EXPOSURE_CIF].CIF)
				AND [EXPOSURE_ID]=@EXPOSURE_ID

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
