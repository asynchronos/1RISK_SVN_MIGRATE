
-- =============================================
-- Author:		Prakit
-- Create date: 14 Jul 2008
-- Description:	CUSTOMER_SME_SET_NEW_GROUPID
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_SET_NEW_GROUPID] 
	-- Add the parameters for the stored procedure here
	@CIF int,
	@GROUP_ID smallint OUTPUT,
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
			-- สร้าง GROUP ใหม่
			EXEC SP_CUSTOMER_SME_GROUP_INSERT @GROUP_ID OUTPUT,1,@UPDATE_BY,@UPDATE_DATE

			-- ทำการ UPDATE GROUP CUSTOMER_SME ตามปกติ
			UPDATE CUSTOMER_SME 
			SET GROUP_ID = @GROUP_ID,
				UPDATE_BY = @UPDATE_BY,
				UPDATE_DATE = @UPDATE_DATE
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









