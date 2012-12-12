CREATE VIEW [dbo].[v_annals_process]
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CREDIT_PROCESS.ID, dbo.ANNALS_CREDIT_PROCESS.USER_ID, dbo.ANNALS_CREDIT_PROCESS.EMP_ID, 
                      dbo.TB_TITLE.TITLE_NAME + dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS Employee, 
                      dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.ANNALS_PROCESS.PROCESS, 
                      dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID
FROM         dbo.TB_EMPLOYEE INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE INNER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON dbo.TB_EMPLOYEE.EMP_ID = dbo.ANNALS_CREDIT_PROCESS.EMP_ID INNER JOIN
                      dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[36] 2[13] 3) )"
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
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 0
               Left = 209
               Bottom = 250
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 2
               Left = 18
               Bottom = 95
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_PROCESS"
            Begin Extent = 
               Top = 4
               Left = 428
               Bottom = 245
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 14
               Left = 686
               Bottom = 223
               Right = 853
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
         Width = 1545
         Width = 1245
         Width = 2400
         Width = 1830
         Width = 3960
         Width = 3300
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2265
         Alias = 1350
         Table = 2205
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_process';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_process';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_process';

