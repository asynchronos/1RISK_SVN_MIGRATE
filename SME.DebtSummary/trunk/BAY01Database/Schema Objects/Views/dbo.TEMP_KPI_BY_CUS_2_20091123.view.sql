CREATE VIEW dbo.TEMP_KPI_BY_CUS_2_20091123
AS
SELECT     dbo.TEMP_KPI_BY_CUS_20091123.Cif, dbo.TEMP_KPI_BY_CUS_20091123.YM, dbo.TEMP_KPI_BY_CUS_20091123.Name, 
                      dbo.TEMP_KPI_BY_CUS_20091123.BaySize, dbo.TEMP_KPI_BY_CUS_20091123.BranchMaxPrin, dbo.Id_Branch.Branch_T, dbo.Id_Region.Id_Region, 
                      dbo.Id_Region.Region_Name, dbo.TEMP_KPI_BY_CUS_20091123.Class, dbo.TEMP_KPI_BY_CUS_20091123.NPL, 
                      dbo.TEMP_KPI_BY_CUS_20091123.Principal, dbo.TEMP_KPI_BY_CUS_20091123.CUS_DEPT_FLAG, 
                      dbo.TEMP_KPI_BY_CUS_20091123.CUS_DEPT_TRAN
FROM         dbo.Id_Region INNER JOIN
                      dbo.Id_Branch ON dbo.Id_Region.Id_Region = dbo.Id_Branch.Id_Region RIGHT OUTER JOIN
                      dbo.TEMP_KPI_BY_CUS_20091123 ON dbo.Id_Branch.Id_Branch = dbo.TEMP_KPI_BY_CUS_20091123.BranchMaxPrin

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
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
         Begin Table = "TEMP_KPI_BY_CUS_20091123"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 195
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 194
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 194
               Right = 601
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2055
         Width = 1500
         Width = 1995
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_KPI_BY_CUS_2_20091123';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_KPI_BY_CUS_2_20091123';

