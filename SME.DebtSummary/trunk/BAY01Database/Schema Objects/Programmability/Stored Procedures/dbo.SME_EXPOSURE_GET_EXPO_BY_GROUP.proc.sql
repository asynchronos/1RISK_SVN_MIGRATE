-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_GET_EXPO_BY_GROUP]
	-- Add the parameters for the stored procedure here
	@GROUP_ID int
	,@EXPOSURE_TYPE_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT G_EXPO_ID
		, GROUP_ID
		, EXPOSURE_ID
		, EXPOSURE_TYPE_ID
		, EXPOSURE_TYPE
		, TOTAL_EXPOSURE
		, ISNULL(TOTAL_APPRAISAL,0) AS TOTAL_APPRAISAL
		, CASE TOTAL_APPRAISAL WHEN 0 
			THEN TOTAL_EXPOSURE/1
			ELSE TOTAL_EXPOSURE/ISNULL(TOTAL_APPRAISAL,1)
		  END  AS LTV
		, UPDATE_DATE
		, UPDATE_BY 
		, EMP_NAME
	FROM CUSTOMER_SME11_GROUP_EXPOSURE_VIEW AS SME11
	WHERE (GROUP_ID = @GROUP_ID)
		AND (EXPOSURE_TYPE_ID = @EXPOSURE_TYPE_ID)
END
