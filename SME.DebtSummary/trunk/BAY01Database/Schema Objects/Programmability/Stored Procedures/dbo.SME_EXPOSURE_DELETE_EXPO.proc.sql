-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SME_EXPOSURE_DELETE_EXPO]
	-- Add the parameters for the stored procedure here
	@EXPOSURE_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM SME_GROUP_EXPOSURE 
	WHERE (EXPOSURE_ID = @EXPOSURE_ID)
	-- ตั้ง AUTO CASCADE ไว้แล้ว
END
