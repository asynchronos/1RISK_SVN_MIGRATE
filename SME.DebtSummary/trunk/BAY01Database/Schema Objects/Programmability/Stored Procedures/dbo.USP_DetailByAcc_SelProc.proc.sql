CREATE PROCEDURE  [dbo].[USP_DetailByAcc_SelProc]
							-- show แต่เฉพาะ สาขาที่ตัวเองถือ
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@CIF  int
)
AS
BEGIN


SELECT     Detail_ByAcc.ACCNO,
	 Detail_ByAcc.Branch, 
	TBM_CAT002.NBRTHAI, 
	Detail_ByAcc.AccGL, 
	CIMfms.DECB_RD, 
                 SUM(DISTINCT Detail_ByAcc.Limit) AS SUMLIMIT, SUM(Detail_ByAcc.Principal) AS SUMPRIN, SUM(Detail_ByAcc.Accru) AS SUMACCRU, SUM(Detail_ByAcc.Susp) 
                      AS SUMSUSP, MAX(Detail_ByAcc.AGING) AS MAXAGING, SUM(Detail_ByAcc.PAY_PRIN) AS SUMPAY_PRIN, SUM(Detail_ByAcc.PAY_INT) 
                      AS SUMPAY_INT, SUM(Detail_ByAcc.PAY_SUSP) AS SUMPAY_SUSP, Detail_ByAcc.APP_ID
FROM         Detail_ByAcc LEFT OUTER JOIN
                      TBM_CAT002 ON Detail_ByAcc.Branch = TBM_CAT002.IBRNO LEFT OUTER JOIN
                      CIMfms ON Detail_ByAcc.AccGL = CIMfms.ACCGL
WHERE   Detail_ByAcc.cif = @CIF
GROUP BY Detail_ByAcc.ACCNO, Detail_ByAcc.Branch, TBM_CAT002.NBRTHAI, Detail_ByAcc.AccGL,CIMfms.DECB_RD, 
                      Detail_ByAcc.APP_ID



    RETURN(0)
END
