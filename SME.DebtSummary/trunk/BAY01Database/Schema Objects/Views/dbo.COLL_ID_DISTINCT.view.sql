CREATE VIEW dbo.COLL_ID_DISTINCT
AS
SELECT DISTINCT 
                      dbo.MergeCOS.CIF, dbo.MergeCOS.APPS_ID, dbo.LinkColl.COLL_ID, dbo.COLL_ID_ALL.buildtype, dbo.COLL_ID_ALL.Buildname_Rentname, 
                      dbo.COLL_ID_ALL.Chanode_Addno, dbo.COLL_ID_ALL.Detail1, dbo.COLL_ID_ALL.Detail2, dbo.TB_PROVINCE.PROV_NAME, dbo.LinkColl.VALUE_UNIT, 
                      dbo.COLL_ID_ALL.RAI, dbo.COLL_ID_ALL.NGAN, dbo.COLL_ID_ALL.WAH, dbo.COLL_ID_ALL.SQUAREMATE, dbo.COLL_ID_ALL.MACH_NO
FROM         dbo.COLL_ID_ALL INNER JOIN
                      dbo.LinkColl ON dbo.COLL_ID_ALL.COLL_ID = dbo.LinkColl.COLL_ID INNER JOIN
                      dbo.MergeCOS ON dbo.LinkColl.APPS_ID = dbo.MergeCOS.APPS_ID INNER JOIN
                      dbo.TB_PROVINCE ON dbo.COLL_ID_ALL.PROV_CODE = dbo.TB_PROVINCE.PROV_CODE

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[5] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[47] 2[31] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LinkColl"
            Begin Extent = 
               Top = 3
               Left = 301
               Bottom = 256
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MergeCOS"
            Begin Extent = 
               Top = 3
               Left = 656
               Bottom = 257
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_PROVINCE"
            Begin Extent = 
               Top = 282
               Left = 273
               Bottom = 397
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COLL_ID_ALL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 331
               Right = 208
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
      Begin ColumnWidths = 46
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1020
         Width = 4155
         Width = 1500
         Width = 5460
         Width = 2595
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
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'COLL_ID_DISTINCT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1500
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
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'COLL_ID_DISTINCT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'COLL_ID_DISTINCT';

