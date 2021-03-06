-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_AvailableRole_By_Cif]
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
	FROM RoleGroup_Role AS R 
	WHERE (ROLE_CATEGORY_ID = @CategoryId) 
			AND (NOT EXISTS (SELECT ROLE_ID 
								FROM RoleGroup_CifInRole AS C_IN_R 
								WHERE (C_IN_R.ROLE_ID = R.ROLE_ID) AND (C_IN_R.CIF = @Cif)
							))
	ORDER BY R.ROLE_NAME
END
