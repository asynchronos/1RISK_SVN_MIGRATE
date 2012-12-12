



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FControllingLineFullDescByEMP_ID_SHOW_REGION] 
(	
	@EMP_ID nvarchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
    SELECT F.*,R.Id_Region FROM [Bay01].[dbo].[FControllingLineFullDescByEMP_ID] (@EMP_ID) as F
    left outer join  (SELECT DISTINCT EMP_ID,ROLE_VALUE as 'Id_Region'
                    	FROM V_Role_EmpInRole_With_Mapping E_IN_R INNER JOIN RoleGroup_Role R ON R.ROLE_ID = E_IN_R.ROLE_ID
						  WHERE R.ROLE_CATEGORY_ID = 3 AND EMP_ID = @EMP_ID) as R
    on F.EMP_ID=R.EMP_ID 
)



