CREATE VIEW dbo.V_Finde_Level_Process_From_Emp_id
AS
WITH cte AS (SELECT     T1.LEVEL_ID, T1.LEVEL_CODE, T1.LEVEL_NAME, T1.LEVEL_ROOT
                             FROM         dbo.Controlling_Level AS T1 RIGHT OUTER JOIN
                                                    dbo.Controlling_UsersInLevel AS T2 ON T1.LEVEL_ID = T2.LEVEL_ID LEFT OUTER JOIN
                                                    dbo.Controlling_LeadsInLevel AS T3 ON T3.EMP_ID = T2.EMP_ID
                             WHERE     (T2.EMP_ID = '248757')
                             UNION ALL
                             SELECT     T2.LEVEL_ID, T2.LEVEL_CODE, T2.LEVEL_NAME, T2.LEVEL_ROOT
                             FROM         dbo.Controlling_Level AS T2 INNER JOIN
                                                   cte AS T3 ON T2.LEVEL_ROOT = T3.LEVEL_ID)
    SELECT     TOP (100) PERCENT p.ID, p.EMP_ID, p.USER_ID, p.PROCESS_ID, p.PROCESS_DATE, a.PROCESS
     FROM         cte AS c INNER JOIN
                            dbo.Controlling_UsersInLevel AS u ON c.LEVEL_ID = u.LEVEL_ID INNER JOIN
                            dbo.ANNALS_CREDIT_PROCESS AS p ON p.EMP_ID = u.EMP_ID INNER JOIN
                            dbo.ANNALS_PROCESS AS a ON p.PROCESS_ID = a.PROCESS_ID
     WHERE     (p.PROCESS_DATE IN
                                (SELECT     MAX(PROCESS_DATE) AS process_date
                                  FROM          dbo.ANNALS_CREDIT_PROCESS
                                  GROUP BY ID))
     ORDER BY p.ID

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
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 84
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 114
               Right = 574
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 612
               Bottom = 114
               Right = 779
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Finde_Level_Process_From_Emp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Finde_Level_Process_From_Emp_id';

