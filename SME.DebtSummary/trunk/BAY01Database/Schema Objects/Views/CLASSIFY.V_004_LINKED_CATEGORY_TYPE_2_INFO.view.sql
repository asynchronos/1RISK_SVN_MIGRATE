CREATE VIEW CLASSIFY.V_004_LINKED_CATEGORY_TYPE_2_INFO
AS
SELECT CLASSIFY.CATEGORY.CATEGORY_KEY, CLASSIFY.CATEGORY.CATEGORY_DESC, CLASSIFY.CATEGORY.CATEGORY_DESC_TH, 
               CLASSIFY.CATEGORY.CATEGORY_VALUE, CLASSIFY.CATEGORY.CATEGORY_TYPE_KEY, CLASSIFY.CATEGORY.PRIORITY, 
               CLASSIFY.CATEGORY.DEL_FLAG, LINKED_MAP_TYPE2.LINKED_TYPE_KEY, 
               LINKED_MAP_TYPE2.DEL_FLAG AS CATEGORY_RECURSIVE_DEL_FLAG, CATEGORY_1.CATEGORY_KEY AS CATEGORY_KEY_LINK, 
               CATEGORY_1.CATEGORY_DESC AS CATEGORY_DESC_LINK, CATEGORY_1.CATEGORY_DESC_TH AS CATEGORY_DESC_TH_LINK, 
               CATEGORY_1.CATEGORY_VALUE AS CATEGORY_VALUE_LINK, CATEGORY_1.CATEGORY_TYPE_KEY AS CATEGORY_TYPE_KEY_LINK, 
               CATEGORY_1.PRIORITY AS PRIORITY_LINK, CATEGORY_1.DEL_FLAG AS DEL_FLAG_LINK
FROM  (SELECT ID, CATEGORY_KEY, LINK_TO_CATEGORY_KEY, LINKED_TYPE_KEY, DEL_FLAG
               FROM   CLASSIFY.LINKED_CATEGORY
               WHERE (LINKED_TYPE_KEY = 2)) AS LINKED_MAP_TYPE2 INNER JOIN
               CLASSIFY.CATEGORY AS CATEGORY_1 ON LINKED_MAP_TYPE2.LINK_TO_CATEGORY_KEY = CATEGORY_1.CATEGORY_KEY RIGHT OUTER JOIN
               CLASSIFY.CATEGORY ON LINKED_MAP_TYPE2.CATEGORY_KEY = CLASSIFY.CATEGORY.CATEGORY_KEY

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
         Begin Table = "CATEGORY (CLASSIFY)"
            Begin Extent = 
               Top = 11
               Left = 37
               Bottom = 170
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CATEGORY_1"
            Begin Extent = 
               Top = 10
               Left = 532
               Bottom = 169
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LINKED_MAP_TYPE2"
            Begin Extent = 
               Top = 9
               Left = 270
               Bottom = 173
               Right = 502
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
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 4668
         Alias = 2940
         Table = 2916
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_004_LINKED_CATEGORY_TYPE_2_INFO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_004_LINKED_CATEGORY_TYPE_2_INFO';

