CREATE VIEW dbo.V_Controlling_LeadsInLevel_HeadOnly
AS
SELECT     TOP (100) PERCENT dbo.Controlling_Level.LEVEL_CODE, dbo.Controlling_Level.LEVEL_NAME, dbo.Controlling_Level.LEVEL_SIZE, 
                      dbo.Controlling_Level.PRIORITY, dbo.Controlling_Level.LEVEL_ROOT, dbo.EMPLOYEE01.EMP_ID, dbo.EMPLOYEE01.TITLE_NAME, 
                      dbo.EMPLOYEE01.TITLE_NAME_E, dbo.EMPLOYEE01.EMPNAME, dbo.EMPLOYEE01.EMPSURNAME, dbo.EMPLOYEE01.EMPNAME_E, 
                      dbo.Controlling_Level.LEVEL_ID
FROM         dbo.Controlling_LeadsInLevel INNER JOIN
                      dbo.Controlling_Level ON dbo.Controlling_LeadsInLevel.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 ON dbo.Controlling_LeadsInLevel.EMP_ID = dbo.EMPLOYEE01.EMP_ID
WHERE     (dbo.Controlling_LeadsInLevel.PRIORITY = 0)
ORDER BY dbo.Controlling_LeadsInLevel.LEVEL_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[24] 2[8] 3) )"
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
         Begin Table = "Controlling_LeadsInLevel"
            Begin Extent = 
               Top = 14
               Left = 252
               Bottom = 125
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 10
               Left = 49
               Bottom = 159
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 11
               Left = 536
               Bottom = 221
               Right = 701
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
      Begin ColumnWidths = 12
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2175
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Controlling_LeadsInLevel_HeadOnly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Controlling_LeadsInLevel_HeadOnly';

