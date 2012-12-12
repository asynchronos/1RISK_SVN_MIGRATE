-- =============================================
-- Author:		Prakit
-- Create date: 2007/12/28
-- Description:	GetTbEmployeeByUsername
-- =============================================
CREATE PROCEDURE [dbo].[GetTbEmployeeByUsername]
	-- Add the parameters for the stored procedure here
	@USERNAME nvarchar(10) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Insert statements for procedure here
	SELECT EMP_ID, TITLE_CODE, EMPNAME, EMPSURNAME, 
	EMPNAME_E, EMPSURNAME_E, USERNAME, PASSWD 
	FROM TB_EMPLOYEE 
	WHERE USERNAME=@USERNAME 
END
