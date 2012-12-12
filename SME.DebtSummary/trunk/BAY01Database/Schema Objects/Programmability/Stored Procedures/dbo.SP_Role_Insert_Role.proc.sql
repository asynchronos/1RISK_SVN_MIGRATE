-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Insert_Role]
	-- Add the parameters for the stored procedure here
	@ROLE_NAME nvarchar(50),
	@ROLE_VALUE nvarchar(30),
	@ROLE_CATEGORY_ID numeric(5,0),
	@ROLE_PRIORITY int,
	@ROLE_ID numeric(5,0) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO RoleGroup_Role
           ([ROLE_NAME]
           ,[ROLE_VALUE]
           ,[ROLE_CATEGORY_ID]
           ,[PRIORITY])
     VALUES
           (@ROLE_NAME
           ,@ROLE_VALUE
           ,@ROLE_CATEGORY_ID
           ,@ROLE_PRIORITY)

	SET @ROLE_ID = SCOPE_IDENTITY()	
END
