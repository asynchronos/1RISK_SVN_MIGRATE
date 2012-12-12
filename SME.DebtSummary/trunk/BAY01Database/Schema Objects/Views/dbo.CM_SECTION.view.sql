CREATE VIEW dbo.CM_SECTION
AS
SELECT     dbo.Controlling_UsersInLevel.EMP_ID, ISNULL(dbo.TB_TITLE.TITLE_NAME, N'') + ISNULL(dbo.TB_EMPLOYEE.EMPNAME, N'') 
                      + N' ' + ISNULL(dbo.TB_EMPLOYEE.EMPSURNAME, N'') AS EMP_NAME, dbo.TB_TITLE.TITLE_NAME, dbo.TB_EMPLOYEE.EMPNAME, 
                      dbo.TB_EMPLOYEE.EMPSURNAME, dbo.TB_TITLE.TITLE_NAME_E, dbo.TB_EMPLOYEE.EMPNAME_E, dbo.TB_EMPLOYEE.EMPSURNAME_E, 
                      dbo.Controlling_Level.LEVEL_ID, dbo.Controlling_Level.LEVEL_CODE, dbo.Controlling_Level.LEVEL_NAME, dbo.Controlling_Level.LEVEL_ROOT, 
                      LEVEL_ROOT.LEVEL_CODE AS LEVEL_ROOT_CODE, LEVEL_ROOT.LEVEL_NAME AS LEVEL_ROOT_NAME, 
                      LEVEL_ROOT.LEVEL_ROOT AS LEVEL_ROOT2, LEVEL_ROOT2.LEVEL_CODE AS LEVEL_ROOT2_CODE, 
                      LEVEL_ROOT2.LEVEL_NAME AS LEVEL_ROOT2_NAME, LEVEL_ROOT2.LEVEL_ROOT AS LEVEL_ROOT3
FROM         dbo.Controlling_Level AS LEVEL_ROOT2 RIGHT OUTER JOIN
                      dbo.Controlling_Level AS LEVEL_ROOT ON LEVEL_ROOT2.LEVEL_ID = LEVEL_ROOT.LEVEL_ROOT RIGHT OUTER JOIN
                      dbo.Controlling_UsersInLevel INNER JOIN
                      dbo.Controlling_Level ON dbo.Controlling_UsersInLevel.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.Controlling_UsersInLevel.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE ON LEVEL_ROOT.LEVEL_ID = dbo.Controlling_Level.LEVEL_ROOT

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[31] 2[10] 3) )"
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
         Left = -15
      End
      Begin Tables = 
         Begin Table = "LEVEL_ROOT2"
            Begin Extent = 
               Top = 6
               Left = 946
               Bottom = 121
               Right = 1098
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LEVEL_ROOT"
            Begin Extent = 
               Top = 5
               Left = 764
               Bottom = 146
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_UsersInLevel"
            Begin Extent = 
               Top = 5
               Left = 398
               Bottom = 174
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 5
               Left = 582
               Bottom = 176
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 5
               Left = 201
               Bottom = 252
               Right = 366
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 6
               Left = 19
               Bottom = 125
               Right = 173
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
      Begin ColumnWidths = 16
         Width = 284
         Width', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CM_SECTION';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1500
         Width = 3060
         Width = 1500
         Width = 2625
         Width = 2535
         Width = 2160
         Width = 1650
         Width = 2535
         Width = 1500
         Width = 2100
         Width = 2070
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3165
         Alias = 1980
         Table = 3135
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CM_SECTION';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CM_SECTION';

