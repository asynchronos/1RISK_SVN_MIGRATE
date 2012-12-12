-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_RoleInCif_By_Cif]
	-- Add the parameters for the stored procedure here
	@Cif int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT    C_IN_R.ID
			, C_IN_R.ROLE_ID
			, R.ROLE_NAME
			, R.ROLE_CATEGORY_ID
			, CAT.ROLE_CATEGORY_NAME
	FROM RoleGroup_CifInRole AS C_IN_R INNER JOIN
		RoleGroup_Role AS R ON C_IN_R.ROLE_ID = R.ROLE_ID INNER JOIN
		RoleGroup_RoleCategory AS CAT ON CAT.ROLE_CATEGORY_ID = R.ROLE_CATEGORY_ID
	WHERE     (C_IN_R.CIF = @Cif)
END
