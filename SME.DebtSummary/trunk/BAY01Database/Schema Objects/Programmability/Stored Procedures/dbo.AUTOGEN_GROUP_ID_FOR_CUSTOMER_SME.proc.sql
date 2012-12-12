
-- =============================================
-- Author:		PRAKIT SIRISAKSATHAPORN
-- Create date: 2008/09/03
-- Description:	ทำการสร้าง GROUP_ID ให้กับ CIF ที่ยังไม่มี GROUP_ID
-- =============================================
/*
	ใช้สำหรับหาดูว่า CIF ใดมี GROUP_ID เป็น NULL
	แล้วทำการสร้าง GROUP_ID ใหม่ให้ CIF นั้นๆ
*/
CREATE PROCEDURE [dbo].[AUTOGEN_GROUP_ID_FOR_CUSTOMER_SME] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION
		CREATE TABLE #CIF_NULL_GROUP(
			CIF int primary key
			,GROUP_ID int)

		--ทำการใส่ค่า CIF,GROUP_ID ลงในตาราง
		INSERT INTO #CIF_NULL_GROUP
			SELECT CIF
				,((SELECT MAX(GROUP_ID) FROM CUSTOMER_SME_GROUP)+ROW_NUMBER() OVER(ORDER BY CIF)) AS GROUP_ID
			FROM CUSTOMER_SME
			WHERE GROUP_ID IS NULL

		--ทำการ INSERT GROUP_ID ลงตาราง CUSTOMER_SME_GROUP
		INSERT INTO CUSTOMER_SME_GROUP
			   (GROUP_ID,GROUP_SIZE_ID,UPDATE_BY,UPDATE_DATE)
			SELECT GROUP_ID,1,N'000001',getdate()
			FROM #CIF_NULL_GROUP

		--นำค่า GROUP_ID ที่ GEN จาก #CIF_NULL_GROUP มาอัพเดตลงตาราง [CUSTOMER_SME]
		UPDATE [CUSTOMER_SME] 
		   SET [GROUP_ID] = #CIF_NULL_GROUP.GROUP_ID
		  FROM [CUSTOMER_SME] INNER JOIN #CIF_NULL_GROUP
			ON [CUSTOMER_SME].CIF = #CIF_NULL_GROUP.CIF
			
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

	DROP TABLE #CIF_NULL_GROUP
END

