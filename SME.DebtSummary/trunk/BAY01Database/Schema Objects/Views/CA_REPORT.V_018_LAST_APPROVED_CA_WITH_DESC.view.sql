CREATE VIEW CA_REPORT.V_018_LAST_APPROVED_CA_WITH_DESC
AS
SELECT CA_REPORT.V_017_LAST_APPROVED_CA.LEADER1_CA_OLD_ID, CA_REPORT.V_017_LAST_APPROVED_CA.CIF, 
               CA_REPORT.V_017_LAST_APPROVED_CA.SIZE_ID, CA_REPORT.V_017_LAST_APPROVED_CA.SIZE_DETAIL, 
               CA_REPORT.V_017_LAST_APPROVED_CA.SUBJECT_GROUP, CA_REPORT.V_017_LAST_APPROVED_CA.SUM_REQUEST_VALUE_PLUS, 
               CA_REPORT.V_017_LAST_APPROVED_CA.SUM_REQUEST_VALUE_MINUS, 
               CA_REPORT.V_017_LAST_APPROVED_CA.SUM_APPROVE_VALUE_PLUS, 
               CA_REPORT.V_017_LAST_APPROVED_CA.SUM_APPROVE_VALUE_MINUS, CA_REPORT.V_017_LAST_APPROVED_CA.LAST_PROCESS_GROUP, 
               CA_REPORT.V_017_LAST_APPROVED_CA.LAST_PROCESS_DATE, CA_REPORT.V_017_LAST_APPROVED_CA.LAST_PROCESS_EMP_ID, 
               dbo.GetName(CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC.TITLE_NAME, CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC.EMPNAME, 
               CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC.EMPSURNAME) AS LAST_PROCESS_EMP_NAME, 
               CA_REPORT.V_017_LAST_APPROVED_CA.LAST_PROCESS_LEVEL_NAME, CA_REPORT.V_017_LAST_APPROVED_CA.ID_OUT, 
               CA_REPORT.V_017_LAST_APPROVED_CA.ID_OUT_CREATED_DATE, CA_REPORT.V_017_LAST_APPROVED_CA.CM_IN_CA
FROM  CA_REPORT.V_017_LAST_APPROVED_CA LEFT OUTER JOIN
               CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC ON 
               CA_REPORT.V_017_LAST_APPROVED_CA.LAST_PROCESS_EMP_ID = CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC.EMP_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[24] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
         Begin Table = "V_017_LAST_APPROVED_CA (CA_REPORT)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 177
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "V_013_CM_HEAD_MANAGER_WITH_DESC (CLASSIFY)"
            Begin Extent = 
               Top = 7
               Left = 342
               Bottom = 178
               Right = 592
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
      Begin ColumnWidths = 20
         Width = 284
         Width = 1848
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1548
         Width = 2364
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_018_LAST_APPROVED_CA_WITH_DESC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_018_LAST_APPROVED_CA_WITH_DESC';

