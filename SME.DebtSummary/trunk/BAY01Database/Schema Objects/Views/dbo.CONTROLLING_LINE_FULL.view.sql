CREATE VIEW dbo.CONTROLLING_LINE_FULL
AS
SELECT     TOP (100) PERCENT dbo.Controlling_Level.LEVEL_ID, dbo.Controlling_Level.LEVEL_CODE, dbo.Controlling_Level.LEVEL_NAME, 
                      dbo.Controlling_Level.LEVEL_SIZE, dbo.Controlling_Level.LEVEL_ROOT, dbo.Controlling_UsersInLevel.EMP_ID, TB_TITLE_1.TITLE_NAME, 
                      TB_EMPLOYEE_2.EMPNAME, TB_EMPLOYEE_2.EMPSURNAME, 
                      TB_TITLE_1.TITLE_NAME + TB_EMPLOYEE_2.EMPNAME + ' ' + TB_EMPLOYEE_2.EMPSURNAME AS 'EMP_NAME', LEAD1.EMP_ID AS LEAD_ID, 
                      TB_TITLE_2.TITLE_NAME + TB_EMPLOYEE_1.EMPNAME + ' ' + TB_EMPLOYEE_1.EMPSURNAME AS 'LEAD_NAME', LEAD2.EMP_ID AS LEAD_ID2, 
                      dbo.TB_TITLE.TITLE_NAME + dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS 'LEAD_NAME2'
FROM         dbo.Controlling_Level LEFT OUTER JOIN
                      dbo.Controlling_LeadsInLevel_TopPriority AS LEAD2 LEFT OUTER JOIN
                      dbo.TB_TITLE RIGHT OUTER JOIN
                      dbo.TB_EMPLOYEE ON dbo.TB_TITLE.TITLE_CODE = dbo.TB_EMPLOYEE.TITLE_CODE ON LEAD2.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID ON 
                      dbo.Controlling_Level.LEVEL_ROOT = LEAD2.LEVEL_ID LEFT OUTER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_2 INNER JOIN
                      dbo.Controlling_UsersInLevel ON TB_EMPLOYEE_2.EMP_ID = dbo.Controlling_UsersInLevel.EMP_ID INNER JOIN
                      dbo.TB_TITLE AS TB_TITLE_1 ON TB_EMPLOYEE_2.TITLE_CODE = TB_TITLE_1.TITLE_CODE ON 
                      dbo.Controlling_Level.LEVEL_ID = dbo.Controlling_UsersInLevel.LEVEL_ID LEFT OUTER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_1 LEFT OUTER JOIN
                      dbo.TB_TITLE AS TB_TITLE_2 ON TB_EMPLOYEE_1.TITLE_CODE = TB_TITLE_2.TITLE_CODE RIGHT OUTER JOIN
                      dbo.Controlling_LeadsInLevel_TopPriority AS LEAD1 ON TB_EMPLOYEE_1.EMP_ID = LEAD1.EMP_ID ON 
                      dbo.Controlling_Level.LEVEL_ID = LEAD1.LEVEL_ID
ORDER BY dbo.Controlling_Level.LEVEL_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[15] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
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
         Configuration = "(H (4[60] 2) )"
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
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_EMPLOYEE_2"
            Begin Extent = 
               Top = 85
               Left = 24
               Bottom = 265
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_UsersInLevel"
            Begin Extent = 
               Top = 3
               Left = 220
               Bottom = 88
               Right = 372
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_1"
            Begin Extent = 
               Top = 157
               Left = 219
               Bottom = 257
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEAD2"
            Begin Extent = 
               Top = 151
               Left = 599
               Bottom = 264
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 7
               Left = 411
               Bottom = 213
               Right = 563
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEAD1"
            Begin Extent = 
               Top = 6
               Left = 603
               Bottom = 107
               Right = 755
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_1"
            Begin Extent = 
               Top = 8
               Left = 796
               Bottom = 156
               Right = 961
            En', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CONTROLLING_LINE_FULL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_2"
            Begin Extent = 
               Top = 12
               Left = 1022
               Bottom = 112
               Right = 1176
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 169
               Left = 790
               Bottom = 306
               Right = 955
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 167
               Left = 994
               Bottom = 295
               Right = 1148
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
         Width = 5970
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1680
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9585
         Alias = 1665
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CONTROLLING_LINE_FULL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CONTROLLING_LINE_FULL';

