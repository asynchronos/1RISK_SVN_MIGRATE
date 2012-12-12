-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_SelectedRole_By_Emp]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10), 
	@CategoryId numeric(5,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.ROLE_ID, R.ROLE_VALUE + ':' + R.ROLE_NAME AS ROLE_NAME 
	FROM RoleGroup_EmpInRole AS E_IN_R INNER JOIN RoleGroup_Role AS R 
		ON E_IN_R.ROLE_ID = R.ROLE_ID 
	WHERE (E_IN_R.EMP_ID = @EMP_ID) AND (R.ROLE_CATEGORY_ID = @CategoryId) 
	ORDER BY R.ROLE_NAME
END
