-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_RoleInEmp_By_Emp]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT    E_IN_R.ID
			, E_IN_R.ROLE_ID
			, R.ROLE_NAME
			, R.ROLE_CATEGORY_ID
			, CAT.ROLE_CATEGORY_NAME
	FROM RoleGroup_EmpInRole AS E_IN_R INNER JOIN
		RoleGroup_Role AS R ON E_IN_R.ROLE_ID = R.ROLE_ID INNER JOIN
		RoleGroup_RoleCategory AS CAT ON CAT.ROLE_CATEGORY_ID = R.ROLE_CATEGORY_ID
	WHERE     (E_IN_R.EMP_ID = @EMP_ID)
END
