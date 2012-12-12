-- =============================================
-- Author:		Prakit
-- Create date: 23 Jun 2008
-- Description:	CUSTOMER_SME_UPDATE
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_UPDATE] 
	-- Add the parameters for the stored procedure here
	@CM_CODE nvarchar(10),
	@OLD_CM_CODE nvarchar(10),
	@BRANCH_ID smallint,
	@JUDGEMENT_ID nvarchar(5),
	@BUSI_RISK1_ID varchar(8),
	@BUSI_RISK2_ID varchar(8),
	@BUSI_RISK3_ID varchar(8),
	@UPDATE_DATE datetime,
	@UPDATE_BY nvarchar(10),
	@CIF int,
	@GROUP_ID int,
	@GROUP_SIZE_ID smallint,
	@BUSINESS_DESTINATION_ID numeric(3, 0),
	@EXPORT_WEIGHT numeric(3, 0),
	@LOCAL_WEIGHT numeric(3, 0),
	@STATUS_ID int,
	@SIZE_ID int,
	@RATING_TYPE_KEY int,
	@RATING_KEY int,
	@RATING_UPDATE_DATE datetime,
	@NEXT_REVIEW_DATE datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION

			-- เช็คว่ามี GROUP_ID นี้หรือยัง ถ้าไม่มีต้องสร้างก่อน UPDATE
			IF NOT EXISTS(SELECT GROUP_ID FROM CUSTOMER_SME_GROUP WHERE (GROUP_ID = @GROUP_ID))
				BEGIN
					-- ทำการสร้าง GROUP ใหม่
					EXEC SP_CUSTOMER_SME_GROUP_INSERT @GROUP_ID OUTPUT, @GROUP_SIZE_ID, @UPDATE_BY, @UPDATE_DATE

				END

			-- UPDATE CUSTOMER_SME_GROUP
			EXEC SP_CUSTOMER_SME_GROUP_UPDATE @GROUP_ID,@GROUP_SIZE_ID, @UPDATE_BY, @UPDATE_DATE


			-- ทำการ UPDATE CUSTOMER_SME ตามปกติ
			UPDATE CUSTOMER_SME 
			SET CM_CODE = @CM_CODE,
				OLD_CM_CODE = @OLD_CM_CODE,
				BRANCH_ID = @BRANCH_ID,
				JUDGEMENT_ID = @JUDGEMENT_ID,
				BUSI_RISK1_ID = @BUSI_RISK1_ID,
				BUSI_RISK2_ID = @BUSI_RISK2_ID,
				BUSI_RISK3_ID = @BUSI_RISK3_ID,
				UPDATE_DATE = @UPDATE_DATE,
				UPDATE_BY = @UPDATE_BY,
				GROUP_ID = @GROUP_ID,
				BUSINESS_DESTINATION_ID = @BUSINESS_DESTINATION_ID,
				EXPORT_WEIGHT = @EXPORT_WEIGHT,
				LOCAL_WEIGHT = @LOCAL_WEIGHT,
				STATUS_ID = @STATUS_ID,
				SIZE_ID = @SIZE_ID,
				RATING_TYPE_KEY = @RATING_TYPE_KEY,
				RATING_KEY = @RATING_KEY,
				RATING_UPDATE_DATE = @RATING_UPDATE_DATE,
				NEXT_REVIEW_DATE = @NEXT_REVIEW_DATE
			WHERE (CIF = @CIF)

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0

		ROLLBACK TRAN; --RollBack in case of Error

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









