CREATE VIEW dbo.REPORT31_30_SUM_GROUP_BY_MONTH_LEVEL
AS
SELECT     MONTH, Customer_Size, SIZE_DETAIL, SUM(CANCEL_REQUEST) AS CANCEL_REQUEST, SUM(CANCEL_OLD_VALUEs) AS CANCEL_OLD_VALUEs, 
                      SUM(CANCEL_RM_VALUEs) AS CANCEL_RM_VALUEs, SUM(CANCEL_CM_VALUEs) AS CANCEL_CM_VALUEs, SUM(CANCEL_APPROVE_VALUEs) 
                      AS CANCEL_APPROVE_VALUEs, SUM(REJECT_REQUEST) AS REJECT_REQUEST, SUM(REJECT_OLD_VALUEs) AS REJECT_OLD_VALUEs, 
                      SUM(REJECT_RM_VALUEs) AS REJECT_RM_VALUEs, SUM(REJECT_CM_VALUEs) AS REJECT_CM_VALUEs, SUM(REJECT_APPROVE_VALUEs) 
                      AS REJECT_APPROVE_VALUEs, SUM(APPROVE_REQUEST) AS APPROVE_REQUEST, SUM(APPROVE_OLD_VALUEs) AS APPROVE_OLD_VALUEs, 
                      SUM(APPROVE_RM_VALUEs) AS APPROVE_RM_VALUEs, SUM(APPROVE_CM_VALUEs) AS APPROVE_CM_VALUEs, 
                      SUM(APPROVE_APPROVE_VALUEs) AS APPROVE_APPROVE_VALUEs
FROM         dbo.REPORT30_29_28_CANCEL_REJECT_APPROVE
GROUP BY MONTH, Customer_Size, SIZE_DETAIL

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
         Begin Table = "REPORT30_29_28_CANCEL_REJECT_APPROVE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 269
               Right = 275
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
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2340
         Width = 1755
         Width = 2010
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT31_30_SUM_GROUP_BY_MONTH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT31_30_SUM_GROUP_BY_MONTH_LEVEL';

