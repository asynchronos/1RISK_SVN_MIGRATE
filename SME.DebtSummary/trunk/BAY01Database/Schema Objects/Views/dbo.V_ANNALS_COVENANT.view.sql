
CREATE VIEW [dbo].[V_ANNALS_COVENANT]
AS
SELECT     dbo.ANNALS_COVENANT.IDEN, dbo.ANNALS_COVENANT.CIF, dbo.View_CifInfo.Cifname, dbo.ANNALS_COVENANT.COVENANT_TYPE_ID, 
                      dbo.ANNALS_COVENANT_TYPE.COVENANT_TYPE, dbo.ANNALS_COVENANT.DETAIL, dbo.ANNALS_COVENANT.CREATE_DATE, 
                      dbo.ANNALS_COVENANT.DEADLINE_DATE, dbo.ANNALS_COVENANT.COVENANT_ACTION_ID, dbo.ANNALS_COVENANT_ACTION.COVENANT_ACTION, 
                      dbo.ANNALS_COVENANT.REMARK, dbo.ANNALS_COVENANT.ACTION_DATE, dbo.ANNALS_COVENANT.USER_ID, 
                      dbo.ANNALS_COVENANT.USER_UPDATE_DATE, 
                      dbo.EMPLOYEE01.TITLE_NAME + dbo.EMPLOYEE01.EMPNAME + ' ' + dbo.EMPLOYEE01.EMPSURNAME AS EMP_NAME, dbo.ANNALS_COVENANT.ID, 
                      dbo.ANNALS_COVENANT.COVENANT_DETAIL_ID, dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_ID, 
                      dbo.ANNALS_COVENANT.NEXT_COVENANT_ACTION_ID, dbo.ANNALS_COVENANT.NEXT_ACTION_DATE, 
                      dbo.ANNALS_COVENANT_NEXT_ACTION.NEXT_COVENANT_ACTION
FROM         dbo.ANNALS_COVENANT LEFT OUTER JOIN
                      dbo.ANNALS_COVENANT_NEXT_ACTION ON 
                      dbo.ANNALS_COVENANT.NEXT_COVENANT_ACTION_ID = dbo.ANNALS_COVENANT_NEXT_ACTION.NEXT_COVENANT_ACTION_ID LEFT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS ON dbo.ANNALS_COVENANT.CIF = dbo.CUSTOMER_SME00_ALL_STATUS.CIF LEFT OUTER JOIN
                      dbo.EMPLOYEE01 ON dbo.ANNALS_COVENANT.USER_ID = dbo.EMPLOYEE01.EMP_ID LEFT OUTER JOIN
                      dbo.ANNALS_COVENANT_ACTION ON 
                      dbo.ANNALS_COVENANT.COVENANT_ACTION_ID = dbo.ANNALS_COVENANT_ACTION.COVENANT_ACTION_ID LEFT OUTER JOIN
                      dbo.ANNALS_COVENANT_TYPE ON 
                      dbo.ANNALS_COVENANT.COVENANT_TYPE_ID = dbo.ANNALS_COVENANT_TYPE.COVENANT_TYPE_ID LEFT OUTER JOIN
                      dbo.View_CifInfo ON dbo.ANNALS_COVENANT.CIF = dbo.View_CifInfo.CIF


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[14] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[88] 2[2] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
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
         Top = -183
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ANNALS_COVENANT"
            Begin Extent = 
               Top = 10
               Left = 270
               Bottom = 402
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 142
               Left = 38
               Bottom = 357
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 248
               Left = 449
               Bottom = 398
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_COVENANT_ACTION"
            Begin Extent = 
               Top = 127
               Left = 444
               Bottom = 231
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_COVENANT_TYPE"
            Begin Extent = 
               Top = 8
               Left = 446
               Bottom = 117
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Cifinfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_003_CUSTOMER_SME (CUSTOMER)"
            Begin Extent = 
               Top = 333
               Left = 31
               Bottom', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_COVENANT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 494
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 18
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1935
         Width = 1755
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
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2835
         Alias = 900
         Table = 2625
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_COVENANT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_COVENANT';

