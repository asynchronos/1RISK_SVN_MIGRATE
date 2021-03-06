-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_RoleCategory_By_RoleCategoryId]
	-- Add the parameters for the stored procedure here
	@ROLE_CATEGORY_ID numeric(5,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ROLE_CATEGORY_ID]
		  ,[ROLE_CATEGORY_NAME]
		  ,[PRIORITY]
	  FROM [RoleGroup_RoleCategory]
	WHERE [ROLE_CATEGORY_ID] = @ROLE_CATEGORY_ID
END
