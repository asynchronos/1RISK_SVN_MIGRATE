
/*select top 1* from  v_credit_account_process v
 แสดงรายละเอียด*/
CREATE VIEW [dbo].[v_00_sum_cif_approve_process_group_by_month_and_REGION]
AS
with cte as (
              SELECT  ID,CONVERT(nvarchar(4), YEAR(PROCESS_DATE)) + RIGHT('0' + CONVERT(nvarchar(2), MONTH(PROCESS_DATE)), 2) AS ym, 
                      REGION_ID,REGION_NAME, PROCESS_GROUP,COUNT(distinct CIF) AS count_cif, SUM(ISNULL(VALUE_OLD, 0)) 
                      AS old_value, SUM(ISNULL(Value_Customer, 0)) AS rm_value, SUM(ISNULL(VALUE, 0)) AS cm_value, SUM(ISNULL(VALUE_APPROVE, 0)) 
                      AS approve_value 
              FROM    dbo.v_Credit_Account_Process_Rank
			  WHERE     (SUBJECT_DETAIL_ID IN ('101', '102', '103')) -- เลือก subject ที่เพิ่มเท่านั้น
			  AND (RANK = 1) -- เอาโปรเซสสุดท้าย
              AND (Value_Customer > 0) -- เอาเฉพาะค่าที่มากกว่า 0
              AND (process_id not in ('C010','C030','C040','C060','C070','C080','C090','C100')) -- ไม่นับ process cancel เหล่านี้ 
              GROUP BY CONVERT(nvarchar(4), YEAR(PROCESS_DATE)) + RIGHT('0' + CONVERT(nvarchar(2), MONTH(PROCESS_DATE)), 2)
              ,ID
              ,REGION_ID,REGION_NAME
              ,PROCESS_GROUP
             
)

select 
case when A.ym is null then CR.ym else A.ym end as 'ym',
case when A.REGION_id is null then CR.REGION_id else A.REGION_id end as 'REGION_id',
case when A.REGION_name is null then CR.REGION_name else A.REGION_name  end as 'REGION_name',
isnull(CR.Cancel,0) as 'Cancel',
isnull(CR.Cancel_Value,0) as 'Cancel_Value',
isnull(CR.Reject,0) as 'Reject',
isnull(CR.Reject_Value,0) as 'Reject_Value',
isnull(A.Approve,0) as 'Approve',
isnull(A.Approve_RM_Value,0) as 'Approve_RM_Value',
isnull(A.Approve_Value,0)  as  'Approve_Value'
from 
( select 
  case when C.ym is null then R.ym else C.ym end as 'ym',
  case when C.REGION_id is null then R.REGION_id else C.REGION_id end as 'REGION_id',
  case when C.REGION_name is null then R.REGION_name else C.REGION_name  end as 'REGION_name',
  C.Cancel,C.Cancel_Value,R.Reject,R.Reject_Value from 
(

	SELECT  ym,REGION_id,REGION_name,
	sum(count_cif) as 'Cancel',
	sum(rm_value) as 'Cancel_Value'
	FROM  cte AS c
	WHERE PROCESS_GROUP in ('C')  
	GROUP BY ym,REGION_id,REGION_name

) as C full outer join 
(
	SELECT  ym,REGION_id,REGION_name,
	sum(count_cif) as 'Reject',
	sum(rm_value) as 'Reject_Value'
	FROM  cte AS r
	WHERE PROCESS_GROUP = ('E')
	GROUP BY ym,REGION_id,REGION_name
) as R  
on R.ym=C.ym and R.REGION_id=C.REGION_id
) as CR
full outer join
(
	SELECT  ym,REGION_id,REGION_name,
	sum(count_cif) as 'Approve',
    sum(rm_value) as 'Approve_RM_Value',
	sum(approve_value) as 'Approve_Value'
	FROM  cte AS a
	WHERE PROCESS_GROUP = ('D')
	GROUP BY ym,REGION_id,REGION_name
) as A 
on CR.ym=A.ym and CR.REGION_id=A.REGION_id
