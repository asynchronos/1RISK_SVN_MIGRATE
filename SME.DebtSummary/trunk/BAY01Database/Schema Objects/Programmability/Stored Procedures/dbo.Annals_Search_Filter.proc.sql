-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/02/07
-- Description:	Annals_Search_Filter
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Search_Filter] 
	-- Add the parameters for the stored procedure here
	@ANNALS_TYPE nvarchar(1),
	@EMP_ID nvarchar(10),
	@FILTER nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SQLSTRING nvarchar(500),@ParmDefinition nvarchar(100)

	SET @SQLSTRING = N'SELECT DISTINCT A.ANNALS_TYPE, A.ANNALS_SEQ_NO, A.ANNALS_YEAR, A.SENDER, A.RECIVER, A.HEADER,  A.ANNALS_CREATE_DATE 
		FROM ANNALS AS A INNER JOIN ANNALS_VIEWER AS B ON 
		A.ANNALS_TYPE = B.ANNALS_TYPE AND A.ANNALS_SEQ_NO = B.ANNALS_SEQ_NO AND A.ANNALS_YEAR = B.ANNALS_YEAR 
		WHERE (A.ANNALS_TYPE = @ANNALS_TYPE_IN) '+ @FILTER

	/*
		เช็คว่า user มี RoleId เป็น 0000000001(administrator),0000000002(see all ca) หรือไม่
	*/
	IF NOT EXISTS (SELECT R.RoleId
					FROM Authen_UsersInRoles AS R
					WHERE (R.UserId = @EMP_ID) 
						and (R.RoleId = '0000000001' OR R.RoleId = '0000000002'))
		--ถ้าไม่มี(เห็นหนังสือตามสิทธิ์)
		BEGIN
			SET @SQLSTRING = N'SELECT A.ANNALS_TYPE, A.ANNALS_SEQ_NO, A.ANNALS_YEAR, A.SENDER, A.RECIVER, A.HEADER,  A.ANNALS_CREATE_DATE 
				FROM ANNALS AS A INNER JOIN ANNALS_VIEWER AS B ON 
				A.ANNALS_TYPE = B.ANNALS_TYPE AND A.ANNALS_SEQ_NO = B.ANNALS_SEQ_NO AND A.ANNALS_YEAR = B.ANNALS_YEAR 
				WHERE (A.ANNALS_TYPE = @ANNALS_TYPE_IN) AND B.EMP_ID = @EMP_ID_IN '+ @FILTER
		END
	ELSE
		--ถ้ามี(เห็นหนังสือทั้งหมด)
		BEGIN
			SET @SQLSTRING = N'SELECT A.ANNALS_TYPE, A.ANNALS_SEQ_NO, A.ANNALS_YEAR, A.SENDER, A.RECIVER, A.HEADER,  A.ANNALS_CREATE_DATE 
				FROM ANNALS AS A  
				WHERE (A.ANNALS_TYPE = @ANNALS_TYPE_IN) '+ @FILTER
		END

	SET @SQLSTRING = @SQLSTRING + 'ORDER BY A.ANNALS_CREATE_DATE  DESC'

	SET @ParmDefinition = N'@ANNALS_TYPE_IN nvarchar(1),
		@EMP_ID_IN nvarchar(10)'

	EXECUTE sp_executesql
	@SQLSTRING,
	@ParmDefinition,
	@ANNALS_TYPE_IN = @ANNALS_TYPE,
	@EMP_ID_IN = @EMP_ID
END




