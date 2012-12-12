-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_GetAll_RoleCategory] 
	-- Add the parameters for the stored procedure here
	
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
	ORDER BY [PRIORITY]

END
