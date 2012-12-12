
-- สร้างตารางทุกวัน ถ้าเป็นเดือนใหม่ให้สร้าง table ชื่อใหม่  และให้ copy table เก่าไว้ใน database tempreport ด้วย


CREATE    PROCEDURE [dbo].[CreateTempReportProductCus]
AS
BEGIN

-- ส่วนแรกการสร้าง temp
declare @strTableName  nvarchar(100)
declare @sql2 nvarchar(max)
declare @sql3 nvarchar(max)
declare @sql4 nvarchar(max)
declare @sql5 nvarchar(max)

 BEGIN TRY
  BEGIN TRANSACTION

			IF EXISTS(select * from sysobjects where name='TEMP_REPORT_PRODUCT_CUS')
				Begin
					-- Comment and add by big 17/03/2011
					--set @sql4='Drop table TEMP_REPORT_PRODUCT_CUS' 
					--EXECUTE sp_executesql 
					--@sql4	
					Drop table TEMP_REPORT_PRODUCT_CUS
					-- End Comment and add by big 17/03/2011
			   End

			-- Comment and add by big 17/03/2011
			--Set @sql5='Select * into TEMP_REPORT_PRODUCT_CUS  from  V_REPORT_CREDIT_BY_CUSTOMER'
			--EXECUTE sp_executesql 
			--@sql5	
			Select * into TEMP_REPORT_PRODUCT_CUS  from  V_REPORT_CREDIT_BY_CUSTOMER
			-- End Comment and add by big 17/03/2011


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






