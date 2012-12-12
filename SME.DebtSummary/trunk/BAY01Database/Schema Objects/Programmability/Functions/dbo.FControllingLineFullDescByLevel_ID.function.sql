


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FControllingLineFullDescByLevel_ID] 
(	
	@Level_id nvarchar(10)
)
RETURNS TABLE 
AS

RETURN 
(
	
--	with  cte as (
--              Select  C.LEVEL_ID,C.EMP_ID,C.Level_Root
--              from (
--						   select L.Level_id,U.Emp_id,L.Level_Root,CI.Emp_id as Lead_id
--                               from  Controlling_LeadsInlevel CI  left outer join Controlling_Level L  On  L.Level_id=CI.Level_id
--							   right outer join  Controlling_UsersInlevel U On L.Level_id=U.Level_id
--				               where CI.Level_id=@Level_ID
--						   union 
--                           select L.Level_id,U.Emp_id,L.Level_Root,CI.Emp_id as Lead_id
--                               from  Controlling_LeadsInlevel CI  right outer join Controlling_Level L  On  L.Level_id=CI.Level_id
--							   right outer join  Controlling_UsersInlevel U On L.Level_id=U.Level_id
--				               where U.Level_id=@Level_ID
--		  	 ) as C
			                 
           	
--              Union all
--              Select C2.LEVEL_ID,C2.EMP_ID,L2.Level_Root from Controlling_Level L2 inner join Controlling_UsersInLevel C2 On  C2.Level_id=L2.Level_id
--		      inner join cte on L2.Level_Root=cte.Level_id
--)
--select level_id,emp_id,level_root from cte 
--group by level_id,emp_id,level_root

--big 17/03/2011
	WITH CATEGORY_CTE ([ID]
					  ,[CATEGORY_KEY]
					  ,[CATEGORY_DESC]
					  ,[CATEGORY_DESC_TH]
					  ,[CATEGORY_VALUE]
					  ,[CATEGORY_PRIORITY]
					  ,[CATEGORY_DEL_FLAG]
					  ,[CATEGORY_TYPE_KEY]
					  ,[CATEGORY_TYPE_DESC]
					  ,[CATEGORY_TYPE_DESC_TH]
					  ,[CATEGORY_TYPE_VALUE]
					  ,[CATEGORY_TYPE_PRIORITY]
					  ,[CATEGORY_TYPE_DEL_FLAG]
					  ,[PARENT_CATEGORY_KEY]
					  ,[RECURSIVE_DEL_FLAG]
					  ,TREE_LEVEL)
	AS (
		SELECT [ID]
			  ,[CATEGORY_KEY]
			  ,[CATEGORY_DESC]
			  ,[CATEGORY_DESC_TH]
			  ,[CATEGORY_VALUE]
			  ,[CATEGORY_PRIORITY]
			  ,[CATEGORY_DEL_FLAG]
			  ,[CATEGORY_TYPE_KEY]
			  ,[CATEGORY_TYPE_DESC]
			  ,[CATEGORY_TYPE_DESC_TH]
			  ,[CATEGORY_TYPE_VALUE]
			  ,[CATEGORY_TYPE_PRIORITY]
			  ,[CATEGORY_TYPE_DEL_FLAG]
			  ,[PARENT_CATEGORY_KEY]
			  ,[RECURSIVE_DEL_FLAG]
			  ,CONVERT(varchar(MAX),[CATEGORY_KEY])
		  FROM [CLASSIFY].V_003_LINKED_CATEGORY_TYPE_1_INFO
		WHERE [PARENT_CATEGORY_KEY] = 1156 OR [PARENT_CATEGORY_KEY] = 1	--Root Of Category 8 and 4
			AND [CATEGORY_DEL_FLAG] <> 1 AND [RECURSIVE_DEL_FLAG] <> 1
		
		UNION ALL
		
		SELECT C.[ID]
			  ,C.[CATEGORY_KEY]
			  ,C.[CATEGORY_DESC]
			  ,C.[CATEGORY_DESC_TH]
			  ,C.[CATEGORY_VALUE]
			  ,C.[CATEGORY_PRIORITY]
			  ,C.[CATEGORY_DEL_FLAG]
			  ,C.[CATEGORY_TYPE_KEY]
			  ,C.[CATEGORY_TYPE_DESC]
			  ,C.[CATEGORY_TYPE_DESC_TH]
			  ,C.[CATEGORY_TYPE_VALUE]
			  ,C.[CATEGORY_TYPE_PRIORITY]
			  ,C.[CATEGORY_TYPE_DEL_FLAG]
			  ,C.[PARENT_CATEGORY_KEY]
			  ,C.[RECURSIVE_DEL_FLAG]
			  ,CATEGORY_CTE.TREE_LEVEL + '_' + CONVERT(varchar(MAX),C.[CATEGORY_KEY])
		  FROM [CLASSIFY].V_003_LINKED_CATEGORY_TYPE_1_INFO C
			INNER JOIN CATEGORY_CTE
			ON C.[PARENT_CATEGORY_KEY] = CATEGORY_CTE.[CATEGORY_KEY]
		 WHERE C.[CATEGORY_DEL_FLAG] <> 1 AND C.[RECURSIVE_DEL_FLAG] <> 1
	)

	SELECT EMP_ID
	FROM CLASSIFY.CATE_AND_EMP INNER JOIN (
		SELECT DISTINCT [CATEGORY_KEY]
		FROM (
			SELECT [ID]
				  ,[CATEGORY_KEY]
				  ,[CATEGORY_DESC]
				  ,[CATEGORY_DESC_TH]
				  ,[CATEGORY_VALUE]
				  ,[CATEGORY_PRIORITY]
				  ,[CATEGORY_DEL_FLAG]
				  ,[CATEGORY_TYPE_KEY]
				  ,[CATEGORY_TYPE_DESC]
				  ,[CATEGORY_TYPE_DESC_TH]
				  ,[CATEGORY_TYPE_VALUE]
				  ,[CATEGORY_TYPE_PRIORITY]
				  ,[CATEGORY_TYPE_DEL_FLAG]
				  ,[PARENT_CATEGORY_KEY]
				  ,[RECURSIVE_DEL_FLAG]
				  ,TREE_LEVEL
			FROM CATEGORY_CTE
		) AS SELECTED
		WHERE TREE_LEVEL LIKE '%'+@Level_id+'%'
	) AS SELECTED_CATEGORY
	ON SELECTED_CATEGORY.[CATEGORY_KEY] = CATE_AND_EMP.[CATEGORY_KEY]
)







