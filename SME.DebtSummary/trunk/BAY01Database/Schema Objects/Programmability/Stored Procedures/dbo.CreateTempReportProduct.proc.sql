





CREATE   PROCEDURE [dbo].[CreateTempReportProduct]
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
		--สร้างตัวแปรชื่อตารางจาก เดือน ปี ปัจจุบัน
		set @strTableName ='TEMP_REPORT_PRODUCT_'  +  right('0'+ convert(nvarchar(4),year(getdate())),4)+ right('0' + convert(nvarchar(2),month(getdate())),2)
		--นำชื่อมาค้นหาว่ามีหรือยัง
		--ถ้ามีแล้วเรียกใช้เลยถ้ายังไม่มีสร้าง table จาก view แล้วเรียกใช้
		 IF EXISTS(select * from sysobjects where name=@strTableName)
		   Begin
			 set @sql2='Drop table ' + @strTableName 
			 EXECUTE sp_executesql 
			 @sql2	
		   End
		  -- Comment and add by big 17/03/2011
		  --set @sql4='Drop table TEMP_REPORT_PRODUCT'
		  --EXECUTE sp_executesql 
		  --@sql4	
		  Drop table TEMP_REPORT_PRODUCT
		  -- End Comment and add by big 17/03/2011
           -- แก้ไขให้ดึงจาก view ใหม่วันที่ 26/05/2553
		  Set @sql3='Select * into ' + @strTableName + ' from  V_REPORT_PRODUCT_00_ALL '
		  EXECUTE sp_executesql 
		  @sql3	
		  
		  Set @sql5='Select * into TEMP_REPORT_PRODUCT  from ' + @strTableName
		  EXECUTE sp_executesql 
		  @sql5	

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






