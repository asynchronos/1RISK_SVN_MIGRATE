-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Update_Role]
	-- Add the parameters for the stored procedure here
	@ROLE_ID numeric(5,0),
	@ROLE_NAME nvarchar(50),
	@ROLE_VALUE nvarchar(30),
	@ROLE_CATEGORY_ID numeric(5,0),
	@ROLE_PRIORITY int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE RoleGroup_Role
	   SET [ROLE_NAME] = @ROLE_NAME
		  ,[ROLE_VALUE] = @ROLE_VALUE
		  ,[ROLE_CATEGORY_ID] = @ROLE_CATEGORY_ID
		  ,[PRIORITY] = @ROLE_PRIORITY
	 WHERE ROLE_ID = @ROLE_ID
END
