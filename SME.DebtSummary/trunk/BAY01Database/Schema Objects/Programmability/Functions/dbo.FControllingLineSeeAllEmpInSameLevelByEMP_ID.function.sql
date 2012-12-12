
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FControllingLineSeeAllEmpInSameLevelByEMP_ID] 
(	
	@EMP_ID nvarchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	with  cte as ( -- ดึงค่า Root_viewer มาเป็น root แทน level_id 
              Select  -- C.Level_Root_Viewer as LEVEL_ID
                      C.LEVEL_ID
                      ,C.EMP_ID,C.Level_Root
              from (
				        select US.LEVEL_ID,US.EMP_ID,LV.Level_Root from 
                       (
                        select CI.LEVEL_ID,CI.EMP_ID,L.Level_Root,v.Level_Root_Viewer
                        from Controlling_UsersInlevel CI 
                        left outer join Controlling_Level L  On  L.Level_id=CI.Level_id
                        left outer join Controlling_Level_Root_Viewer V ON L.Level_id=V.Level_id 
					    Where CI.emp_id=@EMP_ID		
                       ) as  LV   inner join  Controlling_UsersInlevel US 
                         ON LV.LEVEL_ROOT_VIEWER = US.LEVEL_ID 
                      
                     	--union 
                        --select LI.Level_id,CU.Emp_id,LI.Level_Root,CII.Emp_id as Lead_id
                        --from  Controlling_LeadsInlevel LI  
                        --right outer join  Controlling_UsersInlevel U On L.Level_id=U.Level_id
					    --where U.emp_id=@EMP_ID

		  	 ) as C
              Union all
              Select C2.LEVEL_ID,C2.EMP_ID,L2.Level_Root from Controlling_Level L2 
               inner join Controlling_UsersInLevel C2 On  C2.Level_id=L2.Level_id
		      inner join cte on L2.Level_Root=cte.Level_id
)
select level_id,emp_id,level_root from cte 
group by level_id,emp_id,level_root

)
