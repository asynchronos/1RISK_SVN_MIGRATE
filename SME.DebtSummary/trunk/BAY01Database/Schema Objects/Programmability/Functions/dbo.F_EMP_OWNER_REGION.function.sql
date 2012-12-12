-- =============================================
-- Author:		pichaya
-- Create date: 11/05/2010
-- Description:	แสดง Region ที่พนักงานรายนี้สามารถมองเห็น
-- =============================================
CREATE  FUNCTION [dbo].[F_EMP_OWNER_REGION] 
(	
	@EMP_ID nvarchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
    
SELECT DISTINCT  ROLE_VALUE as 'Id_Region'
                    	FROM [Bay01].[dbo].V_Role_EmpInRole_With_Mapping E_IN_R INNER JOIN RoleGroup_Role R ON R.ROLE_ID = E_IN_R.ROLE_ID
						  WHERE (R.ROLE_CATEGORY_ID = 3)AND EMP_ID = @EMP_ID 
						  
						  

)





