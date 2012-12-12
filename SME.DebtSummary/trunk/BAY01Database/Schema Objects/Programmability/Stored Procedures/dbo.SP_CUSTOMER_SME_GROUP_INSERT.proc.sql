
-- =============================================
-- Author:		Prakit
-- Create date: 23 Jun 2008
-- Description:	CUSTOMER_SME_GROUP_INSERT
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_GROUP_INSERT] 
	-- Add the parameters for the stored procedure here
	@GROUP_ID int OUTPUT,
	@GROUP_SIZE_ID smallint = 1,
	@UPDATE_BY nvarchar(10),
	@UPDATE_DATE datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT @GROUP_ID =  MAX(GROUP_ID)+1 FROM CUSTOMER_SME_GROUP

			INSERT INTO CUSTOMER_SME_GROUP
				   (GROUP_ID,GROUP_SIZE_ID,UPDATE_BY,UPDATE_DATE)
			 VALUES
				   (@GROUP_ID,@GROUP_SIZE_ID,@UPDATE_BY,@UPDATE_DATE)
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








