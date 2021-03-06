
-- =============================================
-- Author:		prakit sirisaksathaporn
-- Create date: 3 NOV 2008
-- Description:	ลูกค้า SME_R ที่มี CA(ทั้ง leader,leader1) เข้ามา(เฉพาะที่ยังมีภาระหนี้)
-- =============================================
CREATE PROCEDURE [dbo].[SME_R_MAP_CA]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH CTE_TEMP AS (

		SELECT TEMP.CIF,TEMP.LEAD_ID,TEMP.LEAD_NAME,TEMP.ID AS CA_ID,TEMP.SUBJECT_DETAIL,TEMP.OTHERS AS DETAIL,TEMP.PROCESS_ID,TEMP.PROCESS,TEMP.PROCESS_DATE
		FROM	(SELECT     ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ, C.CIF,C.Undertaker as CM_CODE,L.LEAD_ID,L.LEAD_NAME,C.ID,C.SUBJECT_DETAIL,C.OTHERS,C.PROCESS_ID,C.PROCESS,C.PROCESS_DATE
				FROM         dbo.CreditFilter03_Credit_Account_Process AS C INNER JOIN (SELECT EMP.EMP_ID,EMP.LEAD_ID, LEAD.EMPNAME+' '+LEAD.EMPSURNAME AS LEAD_NAME
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

	SELECT *
	FROM (
		SELECT ROW_NUMBER() OVER(PARTITION BY CTE_TEMP.CIF ORDER BY CTE_TEMP.PROCESS_DATE DESC) AS SEQ,CTE_TEMP.*,ByCustomer.BaySize
		FROM ByCustomer INNER JOIN CTE_TEMP ON CTE_TEMP.CIF=ByCustomer.CIF
		WHERE [BaySize] = 'SME_R'
		) AS SME_R
	WHERE SEQ=1

END

