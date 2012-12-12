




-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 10 Oct 2008
-- Description:	REP_OD_SUMMARY_BY_ACC
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_SUMMARY_BY_ACC]
	-- Add the parameters for the stored procedure here
	@accno NVARCHAR(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT od_lim,od_prin, brname, od_int
		, od_date, class_h
	FROM REP_OD 
	WHERE (accno = @accno)

END





