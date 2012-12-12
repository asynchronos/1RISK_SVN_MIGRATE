﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CA_IN_PROCESS_TOTAL_BY_LEVEL]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Insert statements for procedure here
	SELECT COUNT(DISTINCT OLD_ID) AS ToTalProcessCA 
	FROM REPORT67_07_IN_PROCESS AS R67 INNER JOIN
		(
			SELECT CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY 
				FROM  CLASSIFY.V_001_EXPANDED_CATEGORY_TYPE_1 INNER JOIN
							   CLASSIFY.CATE_AND_EMP ON 
							   CLASSIFY.V_001_EXPANDED_CATEGORY_TYPE_1.SEARCH_CATEGORY_KEY = CLASSIFY.CATE_AND_EMP.CATEGORY_KEY INNER JOIN
							   CLASSIFY.V_002_CATEGORY_MAP_TYPE ON 
							   CLASSIFY.V_001_EXPANDED_CATEGORY_TYPE_1.EXPANDED_CATEGORY_KEY = CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY
				WHERE (CLASSIFY.CATE_AND_EMP.DEL_FLAG <> 1) 
					AND (CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DEL_FLAG <> 1) 
					AND (CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DEL_FLAG <> 1) 
					AND (CLASSIFY.CATE_AND_EMP.EMP_ID = @EMP_ID)
		) AS ALL_CATE_OF_EMP ON R67.LEVEL_ID = ALL_CATE_OF_EMP.CATEGORY_KEY
END