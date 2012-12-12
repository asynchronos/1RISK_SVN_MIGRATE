CREATE VIEW CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO
AS
SELECT LINKED_MAP_TYPE1.ID, LINKED_MAP_TYPE1.CATEGORY_KEY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DESC, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DESC_TH, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_VALUE, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_PRIORITY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DEL_FLAG, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_KEY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DESC, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DESC_TH, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_VALUE, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_PRIORITY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DEL_FLAG, 
               LINKED_MAP_TYPE1.LINK_TO_CATEGORY_KEY AS PARENT_CATEGORY_KEY, LINKED_MAP_TYPE1.DEL_FLAG AS RECURSIVE_DEL_FLAG
FROM  (SELECT ID, CATEGORY_KEY, LINK_TO_CATEGORY_KEY, LINKED_TYPE_KEY, DEL_FLAG
               FROM   CLASSIFY.LINKED_CATEGORY
               WHERE (LINKED_TYPE_KEY = 1)) AS LINKED_MAP_TYPE1 INNER JOIN
               CLASSIFY.V_002_CATEGORY_MAP_TYPE ON LINKED_MAP_TYPE1.CATEGORY_KEY = CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY

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
         Begin Table = "V_002_CATEGORY_MAP_TYPE (CLASSIFY)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 244
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LINKED_MAP_TYPE1"
            Begin Extent = 
               Top = 7
               Left = 306
               Bottom = 166
               Right = 538
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
      Begin ColumnWidths = 50
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_003_LINKED_CATEGORY_TYPE_1_INFO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
         Width = 2376
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4740
         Alias = 2268
         Table = 3300
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_003_LINKED_CATEGORY_TYPE_1_INFO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_003_LINKED_CATEGORY_TYPE_1_INFO';

