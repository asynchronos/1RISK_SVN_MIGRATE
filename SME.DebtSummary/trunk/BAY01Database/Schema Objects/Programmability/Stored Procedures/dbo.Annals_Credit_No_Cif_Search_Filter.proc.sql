﻿-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/03/13
-- Description:	Annals_Credit_No_Cif_Search_Filter
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Credit_No_Cif_Search_Filter] 
	-- Add the parameters for the stored procedure here
	@VIEWER nvarchar(10),
	@FILTER nvarchar(300)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DECLARE @SQLSTRING nvarchar(1000),@ParmDefinition nvarchar(100)

	--Every users can see all CA
--	SELECT ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE 
--	FROM dbo.CreditFilter06_FULL_CA_NO_CIF_IN_CUSTOMER
--	GROUP BY ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE
--	ORDER BY PROCESS_DATE DESC

	-- add filterable
	SET @SQLSTRING = N'SELECT ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE 
							FROM dbo.CreditFilter06_FULL_CA_NO_CIF_IN_CUSTOMER 
							WHERE (1 = 1) ' + @FILTER

	SET @SQLSTRING = @SQLSTRING + ' GROUP BY ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE
									ORDER BY PROCESS_DATE DESC'

	EXECUTE sp_executesql
	@SQLSTRING

	/*
		เช็คว่า user มี RoleId เป็น 0000000001(administrator),0000000002(see all ca) หรือไม่
	*/
--	IF NOT EXISTS (SELECT R.RoleId
--					FROM Authen_UsersInRoles AS R
--					WHERE (R.UserId = @VIEWER) 
--						and (R.RoleId = '0000000001' OR R.RoleId = '0000000002'))
--		--ถ้าไม่มี(เห็นหนังสือตามสิทธิ์)
--		BEGIN
--			SET @SQLSTRING = N'SELECT ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE 
--								FROM dbo.CreditFilter06_FULL_CA_NO_CIF_IN_CUSTOMER 
--								WHERE (Viewer = @VIEWER_IN) '
--		END
--	ELSE
--		--ถ้ามี(เห็นหนังสือทั้งหมด)
--		BEGIN
--			SET @SQLSTRING = N'SELECT ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE 
--								FROM dbo.CreditFilter06_FULL_CA_NO_CIF_IN_CUSTOMER 
--								WHERE (ANNALS_TYPE = ' + N'1' + ') '
--		END
--
--	SET @SQLSTRING = @SQLSTRING + ' GROUP BY ID, ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, Undertaker, UndertakerName, MAIN_CIF_NAME, BRANCH_ID, REGION_ID, PROCESS_ID, PROCESS, PROCESS_DATE ORDER BY PROCESS_DATE DESC'
--
--	SET @ParmDefinition = N'@VIEWER_IN nvarchar(10)'
--
--	EXECUTE sp_executesql
--	@SQLSTRING,
--	@ParmDefinition,
--	@VIEWER_IN = @VIEWER
END







