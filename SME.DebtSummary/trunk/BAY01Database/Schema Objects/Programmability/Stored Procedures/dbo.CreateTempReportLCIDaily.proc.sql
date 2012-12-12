

-- =============================================
-- Author:		big
-- Create date: 28 OCT 2008
-- Description:	CUSTOMER_SME_MATCH_CA_IN_LEADER_LEADER1
-- =============================================
CREATE PROCEDURE [dbo].[CreateTempReportLCIDaily]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  Drop table Temp_Report_LciDaily;
    -- Insert statements for procedure here
		WITH CTE_TEMP AS (

	SELECT TEMP.CIF,TEMP.LEAD_ID,TEMP.LEAD_NAME,TEMP.ID AS CA_ID,TEMP.SUBJECT_DETAIL,TEMP.OTHERS AS DETAIL,TEMP.PROCESS_ID,TEMP.PROCESS,TEMP.PROCESS_DATE
		FROM	(SELECT     ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ, C.CIF,C.Undertaker as CM_CODE,L.LEAD_ID,L.LEAD_NAME,C.ID,C.SUBJECT_DETAIL,C.OTHERS,C.PROCESS_ID,C.PROCESS,C.PROCESS_DATE
				FROM         dbo.CreditFilter03_Credit_Account_Process AS C INNER JOIN 
                      (SELECT EMP.EMP_ID,EMP.LEAD_ID, LEAD.EMPNAME+' '+LEAD.EMPSURNAME AS LEAD_NAME
					   FROM CONTROLLING_LINE_FULL AS EMP INNER JOIN CONTROLLING_LINE_FULL AS LEAD ON LEAD.EMP_ID = EMP.LEAD_ID) AS L ON C.Undertaker = L.EMP_ID
				WHERE     (C.PROCESS_GROUP IN ('C', 'D', 'E')) 
							--AND Undertaker NOT IN (SELECT EMP_ID FROM CONTROLLING_LINE_FULL WHERE EMP_ID=LEAD_ID)
							AND not exists (SELECT EMP_ID FROM CONTROLLING_LINE_FULL WHERE EMP_ID=LEAD_ID AND EMP_ID=Undertaker)
							--AND not exists (select cif from customer_sme where cif=c.cif)
							) AS TEMP
		WHERE SEQ = 1
	UNION ALL
		SELECT TEMP.CIF0 AS CIF,TEMP.LEAD_ID,TEMP.LEAD_NAME,TEMP.CA_ID, TEMP.SUBJECT_DETAIL, TEMP.DETAIL,TEMP.PROCESS_ID,TEMP.PROCESS,TEMP.LAST_PROCESS_DATE AS PROCESS_DATE
		FROM
			(SELECT ROW_NUMBER() OVER(PARTITION BY CA_TEMP.CIF0 ORDER BY CA_TEMP.LAST_PROCESS_DATE DESC) AS SEQ,CA_TEMP.*
				FROM
				(SELECT CIF AS CIF0, [NAME] AS [NAME0],*
					FROM [Bay01].[dbo].[CA_FROM_LEADER_SME]
				UNION ALL
					SELECT CIF1 AS CIF0, [NAME1] AS [NAME0],*
					FROM [Bay01].[dbo].[CA_FROM_LEADER_SME]
					WHERE [CIF1] Is not null
				UNION ALL
					SELECT CIF2 AS CIF0, [NAME2] AS [NAME0],*
					FROM [Bay01].[dbo].[CA_FROM_LEADER_SME]
					WHERE [CIF2] Is not null
				UNION ALL
					SELECT CIF3 AS CIF0, [NAME3] AS [NAME0],*
					FROM [Bay01].[dbo].[CA_FROM_LEADER_SME]
					WHERE [CIF3] Is not null
				UNION ALL
					SELECT CIF4 AS CIF0, [NAME4] AS [NAME0],*
					FROM [Bay01].[dbo].[CA_FROM_LEADER_SME]
					WHERE [CIF4] Is not null
				) AS CA_TEMP
			) AS TEMP
		WHERE TEMP.SEQ = 1
	)




	SELECT CA.PROCESS_DATE as 'Last_Date_In',CA.PROCESS,SME.judgement_detail,cm_code,cm_name,level_name,controlling_unit,
      dbo.CountCompareAging(LCI.aging_h,3,6) as [>3 in 6 Month],LCI.*
	into Temp_Report_LciDaily
      FROM CUSTOMER_SME_FULL_DESC AS SME LEFT OUTER JOIN
		(SELECT TEMP.CIF,TEMP.PROCESS_DATE,TEMP.PROCESS
		  FROM  
           (SELECT ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ,* FROM CTE_TEMP ) AS TEMP	WHERE TEMP.SEQ=1) AS CA 
	ON SME.CIF = CA.CIF 
    right outer join 

	 (SELECT     lc.cif, cif_name, app_id, accgl, prod_type, aging,
        aging_h,class_h,bran, accno, contno, seqno, limit, principal, unearnprin, accru, unearnint, susp,
        grp_size,busi_type,busi_desc
	  FROM         DBF_IMPORT.dbo.LCIreport as LC left outer join DBF_IMPORT.dbo.rep_prod  as REP
      ON		   LC.cif=REP.cif
	  WHERE     (LC.cif NOT IN 
                  (SELECT  cif FROM   DBF_IMPORT.dbo.tdr)
                 )
      ) as LCI
    ON LCI.cif=SME.CIF 
    
   Where cm_code  is not NULL 

  ORDER BY CA.PROCESS_DATE desc,LCI.aging


END


--select judgement_detail from CUSTOMER_SME_FULL_DESC


