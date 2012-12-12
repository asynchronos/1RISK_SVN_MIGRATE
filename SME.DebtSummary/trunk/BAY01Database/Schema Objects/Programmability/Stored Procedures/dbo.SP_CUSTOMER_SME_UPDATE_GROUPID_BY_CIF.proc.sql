


-- =============================================
-- Author:		Prakit
-- Create date: 23 Jun 2008
-- Description:	CUSTOMER_SME_UPDATE_GROUPID_BY_CIF
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_UPDATE_GROUPID_BY_CIF] 
	-- Add the parameters for the stored procedure here
	@CIF1 int,
	@CIF2 int,
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
			DECLARE @GROUP_ID1 int,@GROUP_ID2 int
			SET @GROUP_ID1 =(SELECT GROUP_ID FROM CUSTOMER_SME WHERE CIF=@CIF1)

			-- เช็คว่ามี GROUP_ID นี้หรือยัง ถ้าไม่มีต้องทำการสร้างใหม่
			IF NOT EXISTS(SELECT GROUP_ID FROM CUSTOMER_SME_GROUP WHERE (GROUP_ID = @GROUP_ID1))
				BEGIN
					-- ทำการสร้าง set new group
					EXEC SP_CUSTOMER_SME_SET_NEW_GROUPID @CIF1, @GROUP_ID1 OUTPUT, @UPDATE_BY, @UPDATE_DATE

				END

			SET @GROUP_ID2 =(SELECT GROUP_ID FROM CUSTOMER_SME WHERE CIF=@CIF2)

			-- เช็คว่ามี GROUP_ID นี้หรือยัง ถ้าไม่มีต้องทำการสร้างใหม่
			IF NOT EXISTS(SELECT GROUP_ID FROM CUSTOMER_SME_GROUP WHERE (GROUP_ID = @GROUP_ID2))
				BEGIN
					-- ทำการสร้าง set new group
					EXEC SP_CUSTOMER_SME_SET_NEW_GROUPID @CIF2, @GROUP_ID2 OUTPUT, @UPDATE_BY, @UPDATE_DATE

				END

			DECLARE @MIN_GROUP_ID int,@MAX_GROUP_ID int
			IF @GROUP_ID1 < @GROUP_ID2
				BEGIN
					SET @MIN_GROUP_ID = @GROUP_ID1
					SET @MAX_GROUP_ID = @GROUP_ID2
				END
			ELSE
				BEGIN
					SET @MIN_GROUP_ID = @GROUP_ID2
					SET @MAX_GROUP_ID = @GROUP_ID1
				END

			-- Update CUSTOMER_SME ที่มี @MAX_GROUP_ID เป็น @MIN_GROUP_ID ให้หมด
			UPDATE CUSTOMER_SME
			SET GROUP_ID = @MIN_GROUP_ID,
				UPDATE_BY = @UPDATE_BY,
				UPDATE_DATE = @UPDATE_DATE
			WHERE GROUP_ID = @MAX_GROUP_ID

			-- ทำการลบ @MAX_GROUP_ID ออกจาก CUSTOMER_SME_GROUP
			EXEC SP_CUSTOMER_SME_GROUP_DELETE @MAX_GROUP_ID

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



