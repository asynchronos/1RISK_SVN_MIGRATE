CREATE VIEW dbo.V_LOG
AS
SELECT     TOP (100) PERCENT dbo.TB_LOG.LOG_TYPE_ID, dbo.TB_LOG_TYPE.LOG_TYPE, dbo.TB_LOG.TRANDATE, dbo.TB_TITLE.TITLE_NAME, 
                      dbo.TB_EMPLOYEE.EMP_ID, dbo.TB_EMPLOYEE.EMPNAME, dbo.TB_EMPLOYEE.EMPSURNAME, dbo.TB_LOG.USERNAME, dbo.TB_LOG.ID, 
                      dbo.TB_LOG.IP
FROM         dbo.TB_LOG INNER JOIN
                      dbo.TB_LOG_TYPE ON dbo.TB_LOG.LOG_TYPE_ID = dbo.TB_LOG_TYPE.LOG_TYPE_ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.TB_LOG.USERNAME = dbo.TB_EMPLOYEE.USERNAME INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE
ORDER BY dbo.TB_LOG.TRANDATE DESC

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
         Begin Table = "TB_LOG"
            Begin Extent = 
               Top = 22
               Left = 257
               Bottom = 216
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_LOG_TYPE"
            Begin Extent = 
               Top = 11
               Left = 53
               Bottom = 184
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 22
               Left = 445
               Bottom = 130
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 38
               Left = 720
               Bottom = 131
               Right = 873
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
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_LOG';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_LOG';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_LOG';

