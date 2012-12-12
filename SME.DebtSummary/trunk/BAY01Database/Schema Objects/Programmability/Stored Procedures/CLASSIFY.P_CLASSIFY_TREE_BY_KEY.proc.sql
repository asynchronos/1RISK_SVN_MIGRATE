

-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2011/03/16
-- Description:	P_CLASSIFY_TREE_BY_KEY
-- =============================================
CREATE PROCEDURE [CLASSIFY].[P_CLASSIFY_TREE_BY_KEY]
	-- Add the parameters for the stored procedure here
	@CATE_KEY int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	WITH CTE_SME AS (
					SELECT [CATEGORY_KEY] AS LEVEL_ID
						  ,CONVERT(varchar(max),[CATEGORY_KEY]) AS LEVEL_CODE
						  ,[CATEGORY_DESC] AS LEVEL_NAME
						  ,[PARENT_CATEGORY_KEY] AS LEVEL_ROOT
						  ,CATEGORY_PRIORITY
					  FROM [CLASSIFY].[V_003_LINKED_CATEGORY_TYPE_1_INFO] AS T1
					  WHERE [PARENT_CATEGORY_KEY] = @CATE_KEY--1156 -- ROOT_CATEGORY_KEY
						AND [CATEGORY_TYPE_DEL_FLAG] <> 1 AND [CATEGORY_DEL_FLAG] <> 1 AND [RECURSIVE_DEL_FLAG] <> 1
					UNION ALL
					SELECT T2.[CATEGORY_KEY] AS LEVEL_ID
						  ,LEVEL_CODE + '_' +CONVERT(varchar(max),T2.[CATEGORY_KEY]) AS LEVEL_CODE
						  ,T2.[CATEGORY_DESC] AS LEVEL_NAME
						  ,T2.[PARENT_CATEGORY_KEY] AS LEVEL_ROOT
						  ,T2.CATEGORY_PRIORITY
					  FROM [CLASSIFY].[V_003_LINKED_CATEGORY_TYPE_1_INFO] AS T2
						INNER JOIN CTE_SME ON T2.[PARENT_CATEGORY_KEY] = CTE_SME.LEVEL_ID
					WHERE [CATEGORY_TYPE_DEL_FLAG] <> 1 AND [CATEGORY_DEL_FLAG] <> 1 AND [RECURSIVE_DEL_FLAG] <> 1
	)
	SELECT *
	FROM CTE_SME
	ORDER BY CATEGORY_PRIORITY
	

END


