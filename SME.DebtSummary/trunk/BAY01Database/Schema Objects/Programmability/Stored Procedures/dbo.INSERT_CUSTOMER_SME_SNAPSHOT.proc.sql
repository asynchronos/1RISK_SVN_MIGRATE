-- =============================================
-- Author:		big
-- Create date: 17 DEC 2008
-- Description:	INSERT CUSTOMER_SME_SNAPSHOT
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_CUSTOMER_SME_SNAPSHOT]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @SNAP_CNT int;

	SELECT @SNAP_CNT=COUNT(CIF)
	FROM [CUSTOMER_SME_SNAPSHOT]
	WHERE MONTH(SNAP_DATE) = MONTH(GETDATE())
		AND YEAR(SNAP_DATE) = YEAR(GETDATE())

	IF @SNAP_CNT <= 0
		-- แสดงว่ายังไม่มีการ snap ของปีนี้เดือนนี้
		BEGIN
			INSERT INTO [CUSTOMER_SME_SNAPSHOT]
			SELECT getdate() AS SNAP_DATE
				  ,[CIF]
				  ,[JUDGEMENT_ID]
				  ,[CM_CODE]
			FROM CUSTOMER_SME

			SELECT 'ทำการ snap ข้อมูลของวันที่ '+ CONVERT(nvarchar(12),GETDATE(),113) + 'เรียบร้อยแล้ว'
		END
	ELSE
		BEGIN
			SELECT 'มีข้อมูลเดือนนี้ snap ไว้แล้ว'
		END
END
