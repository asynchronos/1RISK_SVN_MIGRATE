-- =============================================
-- Author:		Prakit
-- Create date: 23 Jun 2008
-- Description:	CUSTOMER_SME_DELETE_BY_CIF
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_DELETE_BY_CIF] 
	-- Add the parameters for the stored procedure here
	@CIF int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			
			DECLARE @GROUP_ID int,@CIF_IN_GROUP int

			-- หา GROUP_ID ของ CIF นี้
			SELECT @GROUP_ID = GROUP_ID 
			FROM CUSTOMER_SME 
			WHERE CIF=@CIF

			-- ดูว่ามีกี่ CIF ที่อยู่ใน GROUP นี้
			SELECT @CIF_IN_GROUP = COUNT(CIF) 
			FROM CUSTOMER_SME 
			WHERE GROUP_ID = @GROUP_ID

			-- ถ้า GROUP นี้มีแค่ 1 CIF
			IF(@CIF_IN_GROUP = 1)
				BEGIN
					-- เรียก stored procedure ทำการลบ GROUP นี้ออก
					EXEC SP_CUSTOMER_SME_GROUP_DELETE @GROUP_ID
				END

			-- ทำการลบ CIF นี้ออกจาก CUSTOMER_SME
			DELETE FROM CUSTOMER_SME WHERE (CIF = @CIF)

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



