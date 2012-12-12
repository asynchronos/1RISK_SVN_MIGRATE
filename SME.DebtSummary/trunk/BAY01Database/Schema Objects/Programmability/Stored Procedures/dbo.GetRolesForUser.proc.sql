
-- =============================================
-- Author:		Prakit
-- Create date: 2007/12/27
-- Description:	GetRolesForUser
-- =============================================
CREATE PROCEDURE [dbo].[GetRolesForUser]
	-- Add the parameters for the stored procedure here
	@USERID nvarchar(10) = null,
	@APPID nvarchar(15) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Insert statements for procedure here
	SELECT uir.UserId as UserId,r.RoleId as RoleId, lower(r.RoleName) as RoleName 
	FROM Authen_UsersInRoles as uir inner join 
	Authen_Roles as r on uir.RoleId = r.RoleId 
	WHERE uir.UserId = @USERID 
	AND lower(r.appId) = lower(@APPID) 
	ORDER BY r.RoleId
END

