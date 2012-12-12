
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [CLASSIFY].[RECURSIVE_CATEGORY_TYPE_8]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
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
		WHERE [PARENT_CATEGORY_KEY] = 1156	--Root Of Category 8
		
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
	)

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
END

