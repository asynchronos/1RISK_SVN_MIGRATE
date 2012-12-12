CREATE VIEW CLASSIFY.V_006_CM_CATEGORY8_LEADER_PARENT
AS
SELECT CLASSIFY.V_005_CM_CATEGORY8_LEADER.EMP_ID, CLASSIFY.V_005_CM_CATEGORY8_LEADER.TITLE_NAME, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.EMPNAME, CLASSIFY.V_005_CM_CATEGORY8_LEADER.EMPSURNAME, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.TITLE_NAME_E, CLASSIFY.V_005_CM_CATEGORY8_LEADER.EMPNAME_E, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.EMPSURNAME_E, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_KEY, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_DESC, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_DESC_TH, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_VALUE, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_PRIORITY, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_TYPE_KEY, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_TYPE_DESC, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_TYPE_DESC_TH, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_TYPE_VALUE, 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_TYPE_PRIORITY, CLASSIFY.V_005_CM_CATEGORY8_LEADER.LEADER_EMP_ID, 
               CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.PARENT_CATEGORY_KEY, CLASSIFY.V_005_CM_CATEGORY8_LEADER.CUS_SIZE
FROM  CLASSIFY.V_005_CM_CATEGORY8_LEADER INNER JOIN
               CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO ON 
               CLASSIFY.V_005_CM_CATEGORY8_LEADER.CATEGORY_KEY = CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_KEY
WHERE (CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.RECURSIVE_DEL_FLAG = 0)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[17] 2[21] 3) )"
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
         Begin Table = "V_003_LINKED_CATEGORY_TYPE_1_INFO (CLASSIFY)"
            Begin Extent = 
               Top = 7
               Left = 342
               Bottom = 178
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_005_CM_CATEGORY8_LEADER (CLASSIFY)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 178
               Right = 294
            End
            DisplayFlags = 280
            TopColumn = 14
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
         Column = 2100
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_006_CM_CATEGORY8_LEADER_PARENT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_006_CM_CATEGORY8_LEADER_PARENT';

