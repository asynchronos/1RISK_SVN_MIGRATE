-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_Role_By_RoleId]
	-- Add the parameters for the stored procedure here
	@RoleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.ROLE_ID
			, R.ROLE_NAME
			, R.ROLE_VALUE
			, R.PRIORITY AS ROLE_PRIORITY
			, R.ROLE_CATEGORY_ID
			, C.ROLE_CATEGORY_NAME
	FROM dbo.RoleGroup_Role AS R INNER JOIN
			dbo.RoleGroup_RoleCategory AS C
			ON R.ROLE_CATEGORY_ID = C.ROLE_CATEGORY_ID
	WHERE R.ROLE_ID=@RoleId
	ORDER BY C.PRIORITY, R.PRIORITY

END
