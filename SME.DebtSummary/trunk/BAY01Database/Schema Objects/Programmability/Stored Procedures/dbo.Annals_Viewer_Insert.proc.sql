-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/02/07
-- Description:	Annals_Viewer_Insert
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Viewer_Insert]
	-- Add the parameters for the stored procedure here
	@ANNALS_TYPE nvarchar(1),
	@ANNALS_SEQ_NO nvarchar(5),
	@ANNALS_YEAR nvarchar(4),
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- if row already exists in a table update it else insert new row
	IF NOT EXISTS (SELECT * FROM ANNALS_VIEWER WHERE ANNALS_TYPE=@ANNALS_TYPE AND ANNALS_SEQ_NO=@ANNALS_SEQ_NO AND ANNALS_YEAR=@ANNALS_YEAR AND EMP_ID=@EMP_ID)
	BEGIN
		INSERT INTO ANNALS_VIEWER (ANNALS_TYPE, ANNALS_SEQ_NO, ANNALS_YEAR, EMP_ID) VALUES(@ANNALS_TYPE, @ANNALS_SEQ_NO, @ANNALS_YEAR, @EMP_ID) 	
	END
	
END
