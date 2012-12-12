CREATE VIEW dbo.REPORT32_31_SUM_ALL_REQUEST
AS
SELECT     MONTH, Customer_Size, SIZE_DETAIL, CANCEL_REQUEST, CANCEL_OLD_VALUEs, CANCEL_RM_VALUEs, CANCEL_CM_VALUEs, 
                      CANCEL_APPROVE_VALUEs, REJECT_REQUEST, REJECT_OLD_VALUEs, REJECT_RM_VALUEs, REJECT_CM_VALUEs, REJECT_APPROVE_VALUEs, 
                      APPROVE_REQUEST, APPROVE_OLD_VALUEs, APPROVE_RM_VALUEs, APPROVE_CM_VALUEs, APPROVE_APPROVE_VALUEs, 
                      ISNULL(CANCEL_REQUEST, 0) + ISNULL(REJECT_REQUEST, 0) + ISNULL(APPROVE_REQUEST, 0) AS ALL_REQUEST, ISNULL(CANCEL_OLD_VALUEs, 
                      0) + ISNULL(REJECT_OLD_VALUEs, 0) + ISNULL(APPROVE_OLD_VALUEs, 0) AS ALL_OLD_VALUEs, ISNULL(CANCEL_RM_VALUEs, 0) 
                      + ISNULL(REJECT_RM_VALUEs, 0) + ISNULL(APPROVE_RM_VALUEs, 0) AS ALL_RM_VALUEs, ISNULL(CANCEL_CM_VALUEs, 0) 
                      + ISNULL(REJECT_CM_VALUEs, 0) + ISNULL(APPROVE_CM_VALUEs, 0) AS ALL_CM_VALUEs, ISNULL(CANCEL_APPROVE_VALUEs, 0) 
                      + ISNULL(REJECT_APPROVE_VALUEs, 0) + ISNULL(APPROVE_APPROVE_VALUEs, 0) AS ALL_APPROVE_VALUEs
FROM         dbo.REPORT31_30_SUM_GROUP_BY_MONTH_LEVEL

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
         Begin Table = "REPORT31_30_SUM_GROUP_BY_MONTH_LEVEL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 264
               Right = 259
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
         Column = 2685
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT32_31_SUM_ALL_REQUEST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT32_31_SUM_ALL_REQUEST';

