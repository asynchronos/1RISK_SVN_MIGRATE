-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_EmpInRole_By_RoleId]
	-- Add the parameters for the stored procedure here
	@RoleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	E_IN_R.EMP_ID
		, dbo.GetName(TITLE.TITLE_NAME, EMP.EMPNAME, EMP.EMPSURNAME) AS EMPNAME
		, E_IN_R.ROLE_ID
		, R.ROLE_NAME
		, R.ROLE_CATEGORY_ID
		, E_IN_R.ID
	FROM	dbo.TB_TITLE AS TITLE INNER JOIN
		dbo.TB_EMPLOYEE AS EMP ON TITLE.TITLE_CODE = EMP.TITLE_CODE INNER JOIN
		dbo.RoleGroup_EmpInRole AS E_IN_R INNER JOIN
		dbo.RoleGroup_Role AS R ON E_IN_R.ROLE_ID = R.ROLE_ID ON 
		EMP.EMP_ID = E_IN_R.EMP_ID
	WHERE (R.ROLE_ID = @RoleId)
END
