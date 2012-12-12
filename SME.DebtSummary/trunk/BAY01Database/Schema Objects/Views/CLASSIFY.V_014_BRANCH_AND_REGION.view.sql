CREATE VIEW CLASSIFY.V_014_BRANCH_AND_REGION
AS
SELECT     CLASSIFY.V_010_BRANCH.CATEGORY_KEY AS BRANCH_CATEGORY_KEY, CLASSIFY.V_010_BRANCH.CATEGORY_DESC AS BRANCH_DESC, 
                      CLASSIFY.V_010_BRANCH.CATEGORY_DESC_TH AS BRANCH_DESC_TH, CLASSIFY.V_010_BRANCH.CATEGORY_VALUE AS BRANCH_ID, 
                      CLASSIFY.V_010_BRANCH.CATEGORY_TYPE_KEY AS BRANCH_CATEGORY_TYPE_KEY, 
                      CLASSIFY.V_010_BRANCH.CATEGORY_PRIORITY AS BRANCH_PRIORITY, CLASSIFY.V_010_BRANCH.CATEGORY_DEL_FLAG AS BRANCH_DEL_FLAG, 
                      LINKED_MAP.DEL_FLAG AS LINKED_MAP_DEL_FLAG, CLASSIFY.V_012_REGION.CATEGORY_KEY AS REGION_CATEGORY_KEY, 
                      CLASSIFY.V_012_REGION.CATEGORY_DESC AS REGION_DESC, CLASSIFY.V_012_REGION.CATEGORY_DESC_TH AS REGION_DESC_TH, 
                      CLASSIFY.V_012_REGION.CATEGORY_VALUE AS REGION_ID, CLASSIFY.V_012_REGION.CATEGORY_PRIORITY AS REGION_PRIORITY, 
                      CLASSIFY.V_012_REGION.CATEGORY_DEL_FLAG AS REGION_DEL_FLAG, 
                      CLASSIFY.V_012_REGION.CATEGORY_TYPE_KEY AS REGION_CATEGORY_TYPE_KEY
FROM         CLASSIFY.V_012_REGION INNER JOIN
                          (SELECT     ID, CATEGORY_KEY, LINK_TO_CATEGORY_KEY, LINKED_TYPE_KEY, DEL_FLAG
                            FROM          CLASSIFY.LINKED_CATEGORY
                            WHERE      (LINKED_TYPE_KEY = 2)) AS LINKED_MAP ON 
                      CLASSIFY.V_012_REGION.CATEGORY_KEY = LINKED_MAP.LINK_TO_CATEGORY_KEY RIGHT OUTER JOIN
                      CLASSIFY.V_010_BRANCH ON LINKED_MAP.CATEGORY_KEY = CLASSIFY.V_010_BRANCH.CATEGORY_KEY

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
         Begin Table = "V_012_REGION"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 249
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LINKED_MAP"
            Begin Extent = 
               Top = 6
               Left = 296
               Bottom = 139
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_010_BRANCH"
            Begin Extent = 
               Top = 6
               Left = 541
               Bottom = 249
               Right = 761
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
      Begin ColumnWidths = 9
         Width = 284
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
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2235
         Alias = 2880
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_014_BRANCH_AND_REGION';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_014_BRANCH_AND_REGION';

