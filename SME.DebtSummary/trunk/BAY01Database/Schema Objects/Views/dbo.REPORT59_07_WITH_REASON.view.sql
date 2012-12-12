﻿CREATE VIEW dbo.REPORT59_07_WITH_REASON
AS
SELECT A.OLD_ID, A.CA_NO_ID, A.CA_CREATE_DATE, A.REFERENCE, A.REFERENCE_DATE, A.CIF, SUM(A.OLD_VALUE) AS OLD_VALUEs, 
               SUM(A.RM_VALUE) AS RM_VALUEs, SUM(A.CM_VALUE) AS CM_VALUEs, SUM(A.APPROVE_VALUE) AS APPROVE_VALUEs, A.APPROVE_DATE, 
               A.REJECT_DATE, A.REJECT_REASON, A.LAST_PROCESS, A.LAST_PROCESS_ID, A.LAST_PROCESS_GROUP, A.LAST_PROCESS_DATE, 
               CONVERT(datetime, CONVERT(varchar(10), DATEADD(day, - (1 * DAY(DATEADD(month, 1, A.LAST_PROCESS_DATE))), DATEADD(month, 1, 
               A.LAST_PROCESS_DATE)), 103), 103) AS LP_END_OF_MONTH, A.EMP_ID, dbo.GetName(E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME) 
               AS EMPNAME, A.LEVEL_ID, A.LEVEL_NAME, CASE A.SUBJECT_DETAIL_ID WHEN '101' THEN 'YES' ELSE 'NO' END AS NEW_CUS, 
               LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')) AS Reason, A.Customer_Size, A.SIZE_DETAIL, MIN(A.SUBJECT_GROUP) 
               AS SUBJECT_GROUP, A.RECIVER, A.Send_To_Board, A.Authority, A.EMP_REQUEST_ID, A.EMP_REQUEST_NAME, A.EMP_APPROVE_ID, 
               A.EMP_APPROVE1_NAME, A.EMP_APPROVE2_ID, A.EMP_APPROVE2_NAME, A.EMP_APPROVE3_ID, A.EMP_APPROVE3_NAME, 
               A.EMP_APPROVE4_ID, A.EMP_APPROVE4_NAME, A.SUB_COMMITTEE_1, A.EMP_SUB_COMM1_NAME, A.SUB_COMMITTEE_2, 
               A.EMP_SUB_COMM2_NAME, A.SUB_COMMITTEE_3, A.EMP_SUB_COMM3_NAME, A.REGION_ID, A.Region_Name
FROM  dbo.REPORT07_SUMMARY AS A LEFT OUTER JOIN
               dbo.ANNALS_CREDIT AS C ON A.OLD_ID = C.ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS E ON A.EMP_ID = E.EMP_ID
GROUP BY A.OLD_ID, A.CA_NO_ID, A.CA_CREATE_DATE, A.REFERENCE, A.REFERENCE_DATE, A.CIF, A.APPROVE_DATE, A.REJECT_DATE, 
               A.REJECT_REASON, A.LAST_PROCESS, A.LAST_PROCESS_ID, A.LAST_PROCESS_GROUP, A.LAST_PROCESS_DATE, A.EMP_ID, 
               CASE A.SUBJECT_DETAIL_ID WHEN '101' THEN 'YES' ELSE 'NO' END, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')), A.Customer_Size, 
               A.SIZE_DETAIL, E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME, A.LEVEL_ID, A.LEVEL_NAME, CONVERT(datetime, CONVERT(varchar(10), 
               DATEADD(day, - (1 * DAY(DATEADD(month, 1, A.LAST_PROCESS_DATE))), DATEADD(month, 1, A.LAST_PROCESS_DATE)), 103), 103), A.RECIVER, 
               A.Send_To_Board, A.Authority, A.EMP_REQUEST_ID, A.EMP_REQUEST_NAME, A.EMP_APPROVE_ID, A.EMP_APPROVE1_NAME, 
               A.EMP_APPROVE2_ID, A.EMP_APPROVE2_NAME, A.EMP_APPROVE3_ID, A.EMP_APPROVE3_NAME, A.EMP_APPROVE4_ID, 
               A.EMP_APPROVE4_NAME, A.SUB_COMMITTEE_1, A.EMP_SUB_COMM1_NAME, A.SUB_COMMITTEE_2, A.EMP_SUB_COMM2_NAME, 
               A.SUB_COMMITTEE_3, A.EMP_SUB_COMM3_NAME, A.REGION_ID, A.Region_Name

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
         Begin Table = "A"
            Begin Extent = 
               Top = 9
               Left = 427
               Bottom = 256
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 49
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 8
               Left = 30
               Bottom = 255
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 79
               Left = 232
               Bottom = 327
               Right = 397
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
      Begin ColumnWidths = 37
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT59_07_WITH_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3012
         Alias = 2016
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT59_07_WITH_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT59_07_WITH_REASON';

