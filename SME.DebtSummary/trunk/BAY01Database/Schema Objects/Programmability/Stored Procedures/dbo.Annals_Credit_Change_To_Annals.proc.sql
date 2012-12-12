
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[Annals_Credit_Change_To_Annals]
@ID nvarchar(5),
@Year nvarchar(4),
@SUBJECT nvarchar(100),
@DETAIL nvarchar(MAX)

AS
BEGIN
  
Declare @AnnalsID nvarchar(10)
SET @AnnalsID = '1' + @ID + @Year; 

BEGIN TRY
	 
     BEGIN TRANSACTION

		Delete annals_credit where id=@AnnalsID
		Delete annals_credit_account where id=@AnnalsID
		Delete annals_credit_process where id=@AnnalsID
		Delete upload_file where id=@AnnalsID

		INSERT INTO ANNALS_CHANGE_TO_COMMON(ID,CHANGE_DATE,SUBJECT,DETAIL) values (@AnnalsID,Getdate(),@SUBJECT,@DETAIL)

		UPDATE [ANNALS]
		SET [HEADER] = @SUBJECT
		  ,[DETAIL] = @DETAIL
		WHERE [ANNALS_TYPE]='1'
			AND [ANNALS_YEAR] = @Year
			AND [ANNALS_SEQ_NO] = @ID

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

