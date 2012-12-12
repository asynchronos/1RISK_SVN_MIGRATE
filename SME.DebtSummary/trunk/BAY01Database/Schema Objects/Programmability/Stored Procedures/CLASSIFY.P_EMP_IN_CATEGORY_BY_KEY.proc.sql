

-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/28
-- Description:	ControllingUsersInLevelByLevelId
-- =============================================
CREATE PROCEDURE [CLASSIFY].[P_EMP_IN_CATEGORY_BY_KEY]
	-- Add the parameters for the stored procedure here
	@LEVEL_ID nvarchar(5)--ไม่ได้เปลี่ยนชื่อ parameter เป็น category key เพราะว่าจะได้ไม่ต้องไปแก้หน้าเวป
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT TOP (100) PERCENT CLASSIFY.CATE_AND_EMP.CATEGORY_KEY AS LEVEL_ID, CLASSIFY.CATE_AND_EMP.EMP_ID, dbo.EMPLOYEE01.EMPNAME, 
				   dbo.EMPLOYEE01.EMPSURNAME
	FROM  CLASSIFY.CATE_AND_EMP INNER JOIN
				   dbo.EMPLOYEE01 ON CLASSIFY.CATE_AND_EMP.EMP_ID = dbo.EMPLOYEE01.EMP_ID
	WHERE (CLASSIFY.CATE_AND_EMP.DEL_FLAG <> 1) AND (CLASSIFY.CATE_AND_EMP.CATEGORY_KEY = CONVERT(int,@LEVEL_ID))

END


