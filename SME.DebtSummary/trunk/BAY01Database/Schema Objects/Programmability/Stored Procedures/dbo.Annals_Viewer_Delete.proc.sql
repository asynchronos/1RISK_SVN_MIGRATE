-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/02/07
-- Description:	Annals_Viewer_Delete
-- =============================================
CREATE PROCEDURE Annals_Viewer_Delete
	-- Add the parameters for the stored procedure here
	@ANNALS_TYPE nvarchar(1),
	@ANNALS_SEQ_NO nvarchar(5),
	@ANNALS_YEAR nvarchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM ANNALS_VIEWER WHERE ANNALS_TYPE=@ANNALS_TYPE AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO AND ANNALS_YEAR=@ANNALS_YEAR
END
