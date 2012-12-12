-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_RoleId_By_RoleCategoryId]
	-- Add the parameters for the stored procedure here
	@CATE_ID numeric(5,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (1) R.ROLE_ID 
	FROM RoleGroup_Role AS R INNER JOIN RoleGroup_RoleCategory AS C
		ON R.ROLE_CATEGORY_ID = C.ROLE_CATEGORY_ID
	WHERE (R.ROLE_CATEGORY_ID = @CATE_ID)

END
