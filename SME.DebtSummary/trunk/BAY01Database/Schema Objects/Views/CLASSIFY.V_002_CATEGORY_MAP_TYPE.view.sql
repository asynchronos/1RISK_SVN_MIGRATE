CREATE VIEW [CLASSIFY].[V_002_CATEGORY_MAP_TYPE]
AS
SELECT     CLASSIFY.CATEGORY.CATEGORY_KEY, CLASSIFY.CATEGORY.CATEGORY_DESC, CLASSIFY.CATEGORY.CATEGORY_DESC_TH, 
                      CLASSIFY.CATEGORY.CATEGORY_VALUE, CLASSIFY.CATEGORY.PRIORITY AS CATEGORY_PRIORITY, 
                      CLASSIFY.CATEGORY.DEL_FLAG AS CATEGORY_DEL_FLAG, CLASSIFY.CATEGORY_TYPE.CATEGORY_TYPE_KEY, 
                      CLASSIFY.CATEGORY_TYPE.CATEGORY_TYPE_DESC, CLASSIFY.CATEGORY_TYPE.CATEGORY_TYPE_DESC_TH, 
                      CLASSIFY.CATEGORY_TYPE.CATEGORY_TYPE_VALUE, CLASSIFY.CATEGORY_TYPE.PRIORITY AS CATEGORY_TYPE_PRIORITY, 
                      CLASSIFY.CATEGORY_TYPE.DEL_FLAG AS CATEGORY_TYPE_DEL_FLAG
FROM         CLASSIFY.CATEGORY INNER JOIN
                      CLASSIFY.CATEGORY_TYPE ON CLASSIFY.CATEGORY.CATEGORY_TYPE_KEY = CLASSIFY.CATEGORY_TYPE.CATEGORY_TYPE_KEY

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
         Begin Table = "CATEGORY (CLASSIFY)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 167
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CATEGORY_TYPE (CLASSIFY)"
            Begin Extent = 
               Top = 5
               Left = 256
               Bottom = 166
               Right = 472
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
         Width = 1500
         Width', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_002_CATEGORY_MAP_TYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1500
         Width = 2370
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2280
         Alias = 1875
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_002_CATEGORY_MAP_TYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_002_CATEGORY_MAP_TYPE';

