
/*select top 1* from  v_credit_account_process v
 แสดงรายละเอียด*/
CREATE VIEW [dbo].[v_00_sum_cif_approve_process_group_by_month_and_level]
AS
with cte as (
              SELECT  ID,CONVERT(nvarchar(4), YEAR(PROCESS_DATE)) + RIGHT('0' + CONVERT(nvarchar(2), MONTH(PROCESS_DATE)), 2) AS ym, 
                      LEVEL_ID, LEVEL_NAME, PROCESS_GROUP, PEOCESS_HEAD AS process_head, COUNT(distinct CIF) AS count_cif, SUM(ISNULL(VALUE_OLD, 0)) 
                      AS old_value, SUM(ISNULL(Value_Customer, 0)) AS rm_value, SUM(ISNULL(VALUE, 0)) AS cm_value, SUM(ISNULL(VALUE_APPROVE, 0)) 
                      AS approve_value 
              FROM    dbo.v_Credit_Account_Process_Rank
			  WHERE     (SUBJECT_DETAIL_ID IN ('101', '102', '103')) -- เลือก subject ที่เพิ่มเท่านั้น
			  AND (RANK = 1) -- เอาโปรเซสสุดท้าย
              AND (Value_Customer > 0) -- เอาเฉพาะค่าที่มากกว่า 0
              AND (process_id not in ('C010','C030','C040','C060','C070','C080','C090','C100')) -- ไม่นับ process cancel เหล่านี้ 
              GROUP BY CONVERT(nvarchar(4), YEAR(PROCESS_DATE)) + RIGHT('0' + CONVERT(nvarchar(2), MONTH(PROCESS_DATE)), 2)
              ,ID
              ,LEVEL_ID
              ,LEVEL_NAME
              ,PROCESS_GROUP
              ,PEOCESS_HEAD
)

select 
case when A.ym is null then CR.ym else A.ym end as 'ym',
case when A.level_id is null then CR.level_id else A.level_id end as 'level_id',
case when A.level_name is null then CR.level_name else A.level_name  end as 'level_name',
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
  case when C.level_id is null then R.level_id else C.level_id end as 'level_id',
  case when C.level_name is null then R.level_name else C.level_name  end as 'level_name',
  C.Cancel,C.Cancel_Value,R.Reject,R.Reject_Value from 
(

	SELECT  ym,level_id,level_name,
	sum(count_cif) as 'Cancel',
	sum(rm_value) as 'Cancel_Value'
	FROM  cte AS c
	WHERE PROCESS_GROUP in ('C')  
	GROUP BY ym,level_id,level_name

) as C full outer join 
(
	SELECT  ym,level_id,level_name,
	sum(count_cif) as 'Reject',
	sum(rm_value) as 'Reject_Value'
	FROM  cte AS r
	WHERE PROCESS_GROUP = ('E')
	GROUP BY ym,level_id,level_name
) as R  
on R.ym=C.ym and R.level_id=C.level_id
) as CR
full outer join
(
	SELECT  ym,level_id,level_name,
	sum(count_cif) as 'Approve',
    sum(rm_value) as 'Approve_RM_Value',
	sum(approve_value) as 'Approve_Value'
	FROM  cte AS a
	WHERE PROCESS_GROUP = ('D')
	GROUP BY ym,level_id,level_name
) as A 
on CR.ym=A.ym and CR.level_id=A.level_id

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_00_sum_cif_approve_process_group_by_month_and_level';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_00_sum_cif_approve_process_group_by_month_and_level';

