


-- =============================================
-- Author:		big
-- Create date: 28 OCT 2008
-- Description:	CUSTOMER_SME_MATCH_CA_IN_LEADER_LEADER1
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_LCIDAILY]
	@EMP_ID nvarchar(10),
    @StrCri1 int,
    @StrCri2 int
AS
BEGIN
 
 SELECT * 
 FROM Temp_Report_LciDaily
 WHERE  cm_code in (select emp_id from FControllingLineSeeAllEmpInSameLevelByEMP_ID(@EMP_ID))
 and (aging  > @StrCri1 and aging < @strCri2)
 order by last_date_in desc
END


--select judgement_detail from CUSTOMER_SME_FULL_DESC



