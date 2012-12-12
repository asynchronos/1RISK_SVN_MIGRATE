-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_GET_CIF_IN_GROUP]
	-- Add the parameters for the stored procedure here
	@EXPOSURE_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EXPO_CIF_ID, EXPOSURE_ID, CIF 
	FROM RELATION_EXPOSURE_CIF 
	WHERE (EXPOSURE_ID = @EXPOSURE_ID)
END
