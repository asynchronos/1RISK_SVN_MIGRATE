-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Insert_RoleCategory]
	-- Add the parameters for the stored procedure here
	@ROLE_CATEGORY_NAME nvarchar(50),
	@PRIORITY int,
	@ROLE_CATEGORY_ID numeric(5,0) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO RoleGroup_RoleCategory
           ([ROLE_CATEGORY_NAME]
           ,[PRIORITY])
     VALUES
           (@ROLE_CATEGORY_NAME
           ,@PRIORITY)

	SET @ROLE_CATEGORY_ID = SCOPE_IDENTITY()	
END
