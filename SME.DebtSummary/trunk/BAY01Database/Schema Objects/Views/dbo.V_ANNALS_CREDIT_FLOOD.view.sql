CREATE VIEW dbo.V_ANNALS_CREDIT_FLOOD
AS
SELECT     dbo.ANNALS_CREDIT_FLOOD.*, ANNALS_CREDIT_FLOOD_TABLE_1.NAME AS IMPACT_TYPE_DESC, 
                      ANNALS_CREDIT_FLOOD_TABLE_2.NAME AS OPERATION_DESC, dbo.ANNALS_CREDIT_FLOOD_TABLE.NAME AS PROGRAM_DESC, 
                      ANNALS_CREDIT_FLOOD_TABLE_3.NAME AS IMPACT_DESC
FROM         dbo.ANNALS_CREDIT_FLOOD_TABLE AS ANNALS_CREDIT_FLOOD_TABLE_1 RIGHT OUTER JOIN
                      dbo.ANNALS_CREDIT_FLOOD_TABLE AS ANNALS_CREDIT_FLOOD_TABLE_2 RIGHT OUTER JOIN
                      dbo.ANNALS_CREDIT_FLOOD LEFT OUTER JOIN
                      dbo.ANNALS_CREDIT_FLOOD_TABLE AS ANNALS_CREDIT_FLOOD_TABLE_3 ON 
                      dbo.ANNALS_CREDIT_FLOOD.IMPACT = ANNALS_CREDIT_FLOOD_TABLE_3.ID LEFT OUTER JOIN
                      dbo.ANNALS_CREDIT_FLOOD_TABLE ON dbo.ANNALS_CREDIT_FLOOD.PROGRAM = dbo.ANNALS_CREDIT_FLOOD_TABLE.ID ON 
                      ANNALS_CREDIT_FLOOD_TABLE_2.ID = dbo.ANNALS_CREDIT_FLOOD.OPERATION ON 
                      ANNALS_CREDIT_FLOOD_TABLE_1.ID = dbo.ANNALS_CREDIT_FLOOD.IMPACT_TYPE

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[9] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[36] 4[37] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ANNALS_CREDIT_FLOOD"
            Begin Extent = 
               Top = 0
               Left = 283
               Bottom = 198
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_FLOOD_TABLE_1"
            Begin Extent = 
               Top = 4
               Left = 11
               Bottom = 139
               Right = 164
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_FLOOD_TABLE_2"
            Begin Extent = 
               Top = 149
               Left = 10
               Bottom = 249
               Right = 163
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_FLOOD_TABLE"
            Begin Extent = 
               Top = 2
               Left = 528
               Bottom = 102
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_FLOOD_TABLE_3"
            Begin Extent = 
               Top = 121
               Left = 531
               Bottom = 221
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1485
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CREDIT_FLOOD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1710
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1560
         Alias = 2655
         Table = 3360
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CREDIT_FLOOD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CREDIT_FLOOD';

