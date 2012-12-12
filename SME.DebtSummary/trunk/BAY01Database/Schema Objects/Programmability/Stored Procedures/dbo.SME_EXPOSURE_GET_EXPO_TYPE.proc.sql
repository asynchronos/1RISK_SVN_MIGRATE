-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_GET_EXPO_TYPE]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EXPOSURE_TYPE_ID, [DESCRIPTION], PRIORITY 
	FROM SME_EXPOSURE_TYPE 
	ORDER BY PRIORITY
END
