-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Delete_Role]
	-- Add the parameters for the stored procedure here
	@ROLE_ID numeric(5,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- Auto Cascade
	DELETE FROM RoleGroup_Role
      WHERE ROLE_ID=@ROLE_ID
END
