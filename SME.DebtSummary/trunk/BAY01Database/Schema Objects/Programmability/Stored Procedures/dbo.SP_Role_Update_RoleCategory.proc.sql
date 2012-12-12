-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Update_RoleCategory]
	-- Add the parameters for the stored procedure here
	@ROLE_CATEGORY_ID numeric(5,0),
	@ROLE_CATEGORY_NAME nvarchar(50),
	@PRIORITY int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE RoleGroup_RoleCategory
	   SET [ROLE_CATEGORY_NAME] = @ROLE_CATEGORY_NAME
		  ,[PRIORITY] = @PRIORITY
	 WHERE ROLE_CATEGORY_ID = @ROLE_CATEGORY_ID
END
