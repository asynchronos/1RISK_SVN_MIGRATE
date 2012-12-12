-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_GET_AVAILABLE_CIF]
	-- Add the parameters for the stored procedure here
	 @GROUP_ID int
	,@EXPOSURE_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CIF 
	FROM CUSTOMER_SME AS SME 
	WHERE (GROUP_ID = @GROUP_ID) 
			AND (NOT EXISTS (
							SELECT CIF 
							FROM RELATION_EXPOSURE_CIF AS REF 
							WHERE (CIF = SME.CIF) 
								AND (EXPOSURE_ID = @EXPOSURE_ID)
							)
			)
END
