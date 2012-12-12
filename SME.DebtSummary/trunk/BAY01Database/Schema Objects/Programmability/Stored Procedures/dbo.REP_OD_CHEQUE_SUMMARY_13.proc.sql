



-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 28 OCT 2008
-- Description:	REP_OD_CHEQUE_SUMMARY
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_CHEQUE_SUMMARY_13]
	-- Add the parameters for the stored procedure here
	@ACCNO NVARCHAR(18)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'Cheque Return' AS SUMMARY
      ,CASE WHEN [chqre_dact]<>0 THEN ROUND(CONVERT(FLOAT,[chqre_dact])/nmonth_cur,0) ELSE 0 END AS [chqre_dact]
      ,CASE WHEN nmonth_cur<>0 THEN [chqre_daca]/(nmonth_cur*1000) ELSE 0 END AS [chqre_daca]
      ,[chqrdt01]
      ,[chqred01]/1000 AS [chqred01]
	  ,CASE WHEN [chqre_cact]<>0 THEN ROUND(CONVERT(FLOAT,[chqre_cact])/nmonth_cur,0) ELSE 0 END AS [chqre_cact]
      ,CASE WHEN nmonth_cur<>0 THEN [chqre_caca]/(nmonth_cur*1000) ELSE 0 END AS [chqre_caca]
      ,[chqrct01]
      ,[chqrec01]/1000 AS [chqrec01]
      ,[run_date]
	FROM REP_OD13
	WHERE ACCNO=@ACCNO
END

