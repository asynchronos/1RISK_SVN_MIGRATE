CREATE VIEW [dbo].[V_Chart1_AppIN]
AS
SELECT  top 5   CONVERT(nvarchar(4), YEAR([REG-DATE])) + '-' + right('00'+ CONVERT(nvarchar(2), MONTH([REG-DATE])),2) AS Month, COUNT([REG-DATE]) AS Total,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Temp_Report_Chart AS b
                            WHERE      (CONVERT(nvarchar(4), YEAR(a.[REG-DATE])) + '-' + right('00'+CONVERT(nvarchar(2), MONTH(a.[REG-DATE])),2) = CONVERT(nvarchar(4), 
                                                   YEAR([REG-DATE])) + '-' + right('00'+CONVERT(nvarchar(2), MONTH([REG-DATE])),2)) AND (SUBSTRING(LEVEL_NAME, 1, 1) = 'L')) AS [SME(L-M)],
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Temp_Report_Chart AS b
                            WHERE      (CONVERT(nvarchar(4), YEAR(a.[REG-DATE])) + '-' + right('00'+CONVERT(nvarchar(2), MONTH(a.[REG-DATE])),2) = CONVERT(nvarchar(4), 
                                                   YEAR([REG-DATE])) + '-' + right('00'+CONVERT(nvarchar(2), MONTH([REG-DATE])),2)) AND (SUBSTRING(LEVEL_NAME, 1, 1) <> 'L')) AS [SME(S)]
FROM         dbo.Temp_Report_Chart AS a
WHERE     (MONTH([REG-DATE]) <> MONTH(GETDATE()))
GROUP BY CONVERT(nvarchar(4), YEAR([REG-DATE])) + '-' + right('00'+CONVERT(nvarchar(2), MONTH([REG-DATE])),2)
ORDER BY 'Month' DESC

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[9] 4[21] 2[41] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 221
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
         Width = 1860
         Width = 1830
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
         Alias = 2205
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Chart1_AppIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Chart1_AppIN';

