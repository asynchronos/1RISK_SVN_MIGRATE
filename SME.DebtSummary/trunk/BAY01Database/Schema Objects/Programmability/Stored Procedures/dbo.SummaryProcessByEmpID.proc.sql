
-- =============================================
-- Author:		pichaya
-- Create date: 25/3/2551
-- Description:	show process that user in line holds
-- =============================================
CREATE PROCEDURE [dbo].[SummaryProcessByEmpID]
	--  input emp_id
		@emp_id nvarchar(10) -- for paging
AS
BEGIN
	SET NOCOUNT ON;

 WITH cte AS (SELECT     T1.LEVEL_ID, T1.LEVEL_CODE, T1.LEVEL_NAME, T1.LEVEL_ROOT
                             FROM         dbo.Controlling_Level AS T1 RIGHT OUTER JOIN
                                                    dbo.Controlling_UsersInLevel AS T2 ON T1.LEVEL_ID = T2.LEVEL_ID LEFT OUTER JOIN
                                                    dbo.Controlling_LeadsInLevel AS T3 ON T3.EMP_ID = T2.EMP_ID
                             WHERE     (T2.EMP_ID = @emp_id)
                             UNION ALL
                             SELECT     T2.LEVEL_ID, T2.LEVEL_CODE, T2.LEVEL_NAME, T2.LEVEL_ROOT
                             FROM         dbo.Controlling_Level AS T2 INNER JOIN
                                                   cte AS T3 ON T2.LEVEL_ROOT = T3.LEVEL_ID)
    SELECT     count(p.PROCESS_ID)as SUMARY ,a.PROCESS
    --SELECT     TOP (100) PERCENT p.ID, p.EMP_ID, p.USER_ID, p.PROCESS_ID, p.PROCESS_DATE, a.PROCESS
     FROM         cte AS c INNER JOIN
                            dbo.Controlling_UsersInLevel AS u ON c.LEVEL_ID = u.LEVEL_ID INNER JOIN
                            dbo.ANNALS_CREDIT_PROCESS AS p ON p.EMP_ID = u.EMP_ID INNER JOIN
                            dbo.ANNALS_PROCESS AS a ON p.PROCESS_ID = a.PROCESS_ID
     WHERE     (p.PROCESS_DATE IN
                                (SELECT     MAX(PROCESS_DATE) AS process_date
                                  FROM          dbo.ANNALS_CREDIT_PROCESS
                                  GROUP BY ID))
    group by a.PROCESS


END

