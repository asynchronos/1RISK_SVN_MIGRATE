-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_Role_RoleCategory_By_Filter]
	-- Add the parameters for the stored procedure here
	@CategoryId numeric(5,0), 
	@Filter nvarchar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	IF LEN(@Filter)=0
		BEGIN
			SELECT ROLE_ID
				 , ROLE_NAME
				 , PRIORITY
			FROM RoleGroup_Role 
			WHERE (ROLE_CATEGORY_ID = @CategoryId)  
			ORDER BY PRIORITY
		END
	ELSE
		BEGIN
			SELECT ROLE_ID
				 , ROLE_NAME
				 , PRIORITY
			FROM RoleGroup_Role 
			WHERE (ROLE_CATEGORY_ID = @CategoryId) 
					AND (ROLE_NAME + ROLE_VALUE LIKE @FILTER) 
			ORDER BY PRIORITY
		END



END
