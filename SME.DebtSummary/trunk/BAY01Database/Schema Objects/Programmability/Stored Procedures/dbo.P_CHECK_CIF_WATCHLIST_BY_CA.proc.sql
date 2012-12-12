-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_CHECK_CIF_WATCHLIST_BY_CA] 
	-- Add the parameters for the stored procedure here
	@CA_OLD_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT R.OLD_ID, C.CIF
	FROM REPORT07_SUMMARY R INNER JOIN CIF_WATCHLIST_CA C
	ON R.CIF = C.CIF
	WHERE R.OLD_ID = @CA_OLD_ID;
END
