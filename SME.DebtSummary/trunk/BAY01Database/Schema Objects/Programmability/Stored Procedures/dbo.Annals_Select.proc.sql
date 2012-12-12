-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/21
-- Description:	Annals_Select
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Select] 
	-- Add the parameters for the stored procedure here
	@ANNALS_TYPE nvarchar(1),
	@ANNALS_SEQ_NO nvarchar(5),
	@ANNALS_YEAR nvarchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM [ANNALS] 
	WHERE (([ANNALS_TYPE] = @ANNALS_TYPE) 
	AND ([ANNALS_SEQ_NO] = @ANNALS_SEQ_NO) 
	AND ([ANNALS_YEAR] = @ANNALS_YEAR))
END
