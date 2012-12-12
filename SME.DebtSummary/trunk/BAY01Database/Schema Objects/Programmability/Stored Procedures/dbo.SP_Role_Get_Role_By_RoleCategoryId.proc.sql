-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_Role_By_RoleCategoryId]
	-- Add the parameters for the stored procedure here
	@CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     ROLE_ID, ROLE_NAME
	FROM         RoleGroup_Role
	WHERE     (ROLE_CATEGORY_ID = @CategoryId)
	ORDER BY PRIORITY
END
