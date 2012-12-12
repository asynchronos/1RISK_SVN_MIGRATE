
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FControllingLineFullDescByEMP_ID] 
(	
	@EMP_ID nvarchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	with  cte as (
              Select  C.LEVEL_ID,C.EMP_ID,C.Level_Root
              from (
						   select L.Level_id,U.Emp_id,L.Level_Root,CI.Emp_id as Lead_id
                               from  Controlling_LeadsInlevel CI  left outer join Controlling_Level L  On  L.Level_id=CI.Level_id
							   right outer join  Controlling_UsersInlevel U On L.Level_id=U.Level_id
				               where CI.emp_id=@EMP_ID
						   union 
                           select L.Level_id,U.Emp_id,L.Level_Root,CI.Emp_id as Lead_id
                               from  Controlling_LeadsInlevel CI  right outer join Controlling_Level L  On  L.Level_id=CI.Level_id
							   right outer join  Controlling_UsersInlevel U On L.Level_id=U.Level_id
				               where U.emp_id=@EMP_ID
		  	 ) as C
			                 
             	
              Union all
              Select C2.LEVEL_ID,C2.EMP_ID,L2.Level_Root from Controlling_Level L2 inner join Controlling_UsersInLevel C2 On  C2.Level_id=L2.Level_id
		      inner join cte on L2.Level_Root=cte.Level_id
)
select level_id,emp_id,level_root from cte 
group by level_id,emp_id,level_root

)
