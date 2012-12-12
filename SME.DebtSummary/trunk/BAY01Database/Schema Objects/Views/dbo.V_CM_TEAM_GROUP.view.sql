CREATE VIEW dbo.V_CM_TEAM_GROUP
AS
SELECT     CU.EMP_ID AS CM_ID, E.TITLE_NAME AS CM_TITLE_NAME, E.EMPNAME AS CM_FIRST_NAME, E.EMPSURNAME AS CM_LAST_NAME, 
                      E.TITLE_NAME_E AS CM_TITLE_NAME_E, E.EMPNAME_E AS CM_FIRST_NAME_E, E.EMPSURNAME_E AS CM_LAST_NAME_E, 
                      LL.EMP_ID AS TEAM_ID, E2.TITLE_NAME AS TEAM_TITLE_NAME, E2.EMPNAME AS TEAM_FIRST_NAME, E2.EMPSURNAME AS TEAM_LAST_NAME, 
                      E2.TITLE_NAME_E AS TEAM_TITLE_NAME_E, E2.EMPNAME_E AS TEAM_FIRST_NAME_E, E2.EMPSURNAME_E AS TEAM_LAST_NAME_E, 
                      LL2.EMP_ID AS GROUP_ID, E3.TITLE_NAME AS GROUP_TITLE_NAME, E3.EMPNAME AS GROUP_FIRST_NAME, 
                      E3.EMPSURNAME AS GROUP_LAST_NAME, E3.TITLE_NAME_E AS GROUP_TITLE_NAME_E, E3.EMPNAME_E AS GROUP_FIRST_NAME_E, 
                      E3.EMPSURNAME_E AS GROUP_LAST_NAME_E
FROM         dbo.Controlling_UsersInLevel AS CU INNER JOIN
                      dbo.EMPLOYEE01 AS E ON CU.EMP_ID = E.EMP_ID INNER JOIN
                      dbo.Controlling_Level AS L ON CU.LEVEL_ID = L.LEVEL_ID INNER JOIN
                      dbo.Controlling_LeadsInLevel AS LL2 ON L.LEVEL_ROOT = LL2.LEVEL_ID INNER JOIN
                      dbo.EMPLOYEE01 AS E3 ON LL2.EMP_ID = E3.EMP_ID INNER JOIN
                      dbo.Controlling_LeadsInLevel AS LL ON CU.LEVEL_ID = LL.LEVEL_ID INNER JOIN
                      dbo.EMPLOYEE01 AS E2 ON LL.EMP_ID = E2.EMP_ID
WHERE     (LL2.PRIORITY = 0) AND (LL.PRIORITY = 0) AND (NOT EXISTS
                          (SELECT     EMP_ID
                            FROM          dbo.Controlling_LeadsInLevel AS CL
                            WHERE      (EMP_ID = CU.EMP_ID) AND (LL.PRIORITY <> 0)))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[23] 2[20] 3) )"
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
         Begin Table = "CU"
            Begin Extent = 
               Top = 8
               Left = 216
               Bottom = 96
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 21
               Bottom = 195
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E2"
            Begin Extent = 
               Top = 95
               Left = 393
               Bottom = 210
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LL"
            Begin Extent = 
               Top = 97
               Left = 213
               Bottom = 197
               Right = 365
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E3"
            Begin Extent = 
               Top = 6
               Left = 766
               Bottom = 194
               Right = 931
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LL2"
            Begin Extent = 
               Top = 3
               Left = 576
               Bottom = 103
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 8
               Left = 394
               Bottom = 92
               Right = 546
            End
            DisplayFlags = 280
            TopColumn = 0
         End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CM_TEAM_GROUP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
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
         Alias = 2310
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CM_TEAM_GROUP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CM_TEAM_GROUP';

