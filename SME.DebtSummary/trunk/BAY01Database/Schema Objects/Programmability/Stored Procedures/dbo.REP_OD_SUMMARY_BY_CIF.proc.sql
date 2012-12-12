
-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 24 OCT 2008
-- Description:	REP_OD_SUMMARY_BY_CIF
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_SUMMARY_BY_CIF]
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT ctrl_unit, run_date
		, CIF, NAME
		, BUSI_TYPE, BUSI_DESC, IDRATING
	FROM REP_OD 
	WHERE (CIF = @CIF)
END

