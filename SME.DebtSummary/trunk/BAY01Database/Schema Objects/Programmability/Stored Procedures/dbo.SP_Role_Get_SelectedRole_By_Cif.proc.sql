-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_SelectedRole_By_Cif]
	-- Add the parameters for the stored procedure here
	@Cif int, 
	@CategoryId numeric(5,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.ROLE_ID, R.ROLE_VALUE + ':' + R.ROLE_NAME AS ROLE_NAME 
	FROM RoleGroup_CifInRole AS C_IN_R INNER JOIN RoleGroup_Role AS R 
		ON C_IN_R.ROLE_ID = R.ROLE_ID 
	WHERE (C_IN_R.CIF = @Cif) AND (R.ROLE_CATEGORY_ID = @CategoryId) 
	ORDER BY R.ROLE_NAME
END
