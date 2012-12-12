
-- =============================================
-- Author:		pichaya
-- Create date: 20/04/2011
-- Description:	Find All Employee in same level and find employee in child level
-- =============================================
CREATE FUNCTION [dbo].[F_FindEmpInSameLevelByEmpID] 
(	
	@EMP_ID nvarchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	with cte as (
	
		SELECT  em.category_key,em.emp_id,ee.link_to_category_key FROM 
		(   -- 1.ดึงข้อมูล รหัสสายงาน emp_id สายงาน root
			SELECT e.category_key,e.emp_id,l.link_to_category_key FROM [CLASSIFY].[CATE_AND_EMP] e
			left outer join [CLASSIFY].[CATEGORY] c on e.category_key=c.category_key 
			left outer join [CLASSIFY].[LINKED_CATEGORY] l ON  c.category_key = l.category_key
			where c.category_type_key=8 and l.linked_type_key=1  and e.del_flag=0
			and e.emp_id=@EMP_ID 
		) as ee 
			-- 2. ดึงพนักงานที่อยู่ในสายเดียวกัน
			inner join  [CLASSIFY].[CATE_AND_EMP] em 
			on ee.category_key = em.category_key
			inner join [CLASSIFY].[CATEGORY] cc on em.category_key=cc.category_key  
			inner join [CLASSIFY].[LINKED_CATEGORY] ll ON  cc.category_key = ll.category_key
			where cc.category_type_key=8 and ll.linked_type_key=1  and em.del_flag=0
		Union all
		-- 3. ดึงข้อมูลในสายงานลูก
		SELECT e2.category_key,e2.emp_id,l2.link_to_category_key FROM [CLASSIFY].[CATE_AND_EMP] e2
		inner join [CLASSIFY].[CATEGORY] c2 on e2.category_key=c2.category_key 
		inner join [CLASSIFY].[LINKED_CATEGORY] l2 ON  c2.category_key = l2.category_key 
		inner join cte on l2.link_to_category_key = cte.category_key
		where c2.category_type_key=8 and l2.linked_type_key=1  and e2.del_flag=0
)
select distinct emp_id from cte

)
