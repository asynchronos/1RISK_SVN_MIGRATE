
-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 24 OCT 2008
-- Description:	REP_OD_ACCNO_BY_CIF
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_ACCNO_BY_CIF]
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ACCNO
	FROM REP_OD
	WHERE CIF=@CIF
END

