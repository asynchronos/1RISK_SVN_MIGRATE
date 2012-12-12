-- =============================================
-- Author:		PRAKIT SIRISAKSATHAPORN
-- Create date: 17/03/2011
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [CLASSIFY].[P_GET_ALL_ORGANIZE]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [CATEGORY_KEY] AS LEVEL_ID
		  ,[CATEGORY_VALUE] AS LEVEL_CODE
		  ,[CATEGORY_DESC_TH] AS LEVEL_NAME
		  ,[PARENT_CATEGORY_KEY] AS LEVEL_ROOT
	  FROM [BAY01].[CLASSIFY].[V_003_LINKED_CATEGORY_TYPE_1_INFO]
	WHERE [CATEGORY_TYPE_KEY] IN (4,8) AND [CATEGORY_DEL_FLAG] <> 1
		AND [RECURSIVE_DEL_FLAG] <> 1
	ORDER BY [CATEGORY_PRIORITY]
END
