



CREATE  PROCEDURE [dbo].[P_CREATE_TEMP_MAX_AGING_EDW]
AS
BEGIN
	SET NOCOUNT ON;
		 
     BEGIN TRY
	 BEGIN TRANSACTION

	IF EXISTS(select * from sysobjects where name='TEMP_MAX_AGING_EDW')
	Begin
	   Drop table TEMP_MAX_AGING_EDW
	End
	SELECT * INTO TEMP_MAX_AGING_EDW
	FROM [EDW]..[DWHADMIN].[RISK_MAXAGING_DAILY_FACT]
	where date_id_key = 
	(select max(date_id_key) from   [EDW]..[DWHADMIN].[RISK_MAXAGING_DAILY_FACT])

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



