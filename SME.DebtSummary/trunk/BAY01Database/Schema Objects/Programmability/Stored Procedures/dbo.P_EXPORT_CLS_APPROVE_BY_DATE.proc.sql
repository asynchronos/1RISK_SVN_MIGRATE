-- =============================================
-- Author:		PRAKIT SIRISAKSATHAPORN
-- Create date: 21 Jun 2010
-- Description:	EXPORT TO INSERT IN EDW
-- =============================================
CREATE PROCEDURE P_EXPORT_CLS_APPROVE_BY_DATE
	-- Add the parameters for the stored procedure here
	@startDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SUBJECT_IDEN]
      ,[CA_NO_ID]
      ,[CIF]
      ,[APPROVE_VALUE]
      ,CONVERT(nvarchar,[APPROVE_DATE],103) [APPROVE_DATE]
      ,'N' AS SNAPPED_FLAG
	  ,DECB_RD
	FROM [BAY01].[dbo].[REPORT07_SUMMARY]
	WHERE [APPROVE_DATE] >= @startDate
		AND [APPROVE_DATE] < dateadd(day,1,@startDate)
		AND (SUBJECT_DETAIL_ID = 101 OR SUBJECT_DETAIL_ID = 102 OR SUBJECT_DETAIL_ID = 103)
END
