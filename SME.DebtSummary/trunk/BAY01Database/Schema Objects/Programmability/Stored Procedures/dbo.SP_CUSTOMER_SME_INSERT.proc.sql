
-- =============================================
-- Author:		Prakit
-- Create date: 20 Jun 2008
-- Description:	CUSTOMER_SME_INSERT
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_INSERT] 
	-- Add the parameters for the stored procedure here
	@CIF int,
	@CM_CODE nvarchar(10),
	@OLD_CM_CODE nvarchar(10),
	@BRANCH_ID smallint,
	@JUDGEMENT_ID nvarchar(5),
	@BUSI_RISK1_ID varchar(8),
	@BUSI_RISK2_ID varchar(8),
	@BUSI_RISK3_ID varchar(8),
	@UPDATE_DATE datetime,
	@UPDATE_BY nvarchar(10),
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
			DECLARE @NEW_GROUP_ID int 
			EXEC SP_CUSTOMER_SME_GROUP_INSERT @NEW_GROUP_ID OUTPUT, @GROUP_SIZE_ID, @UPDATE_BY, @UPDATE_DATE

			INSERT INTO CUSTOMER_SME (
				CIF, 
				CM_CODE,
				OLD_CM_CODE,
				BRANCH_ID, 
				JUDGEMENT_ID, 
				BUSI_RISK1_ID, 
				BUSI_RISK2_ID,	
				BUSI_RISK3_ID,
				UPDATE_DATE, 
				UPDATE_BY,
				GROUP_ID,
				BUSINESS_DESTINATION_ID,
				EXPORT_WEIGHT,
				LOCAL_WEIGHT,
				STATUS_ID,
				SIZE_ID,
				RATING_TYPE_KEY,
				RATING_KEY,
				RATING_UPDATE_DATE,
				NEXT_REVIEW_DATE) 
			VALUES (
				@CIF,
				@CM_CODE,
				@OLD_CM_CODE,
				@BRANCH_ID,
				@JUDGEMENT_ID,
				@BUSI_RISK1_ID,
				@BUSI_RISK2_ID,
				@BUSI_RISK3_ID,
				@UPDATE_DATE, 
				@UPDATE_BY,
				@NEW_GROUP_ID,
				@BUSINESS_DESTINATION_ID,
				@EXPORT_WEIGHT,
				@LOCAL_WEIGHT,
				@STATUS_ID,
				@SIZE_ID,
				@RATING_TYPE_KEY,
				@RATING_KEY,
				@RATING_UPDATE_DATE,
				@NEXT_REVIEW_DATE)

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








