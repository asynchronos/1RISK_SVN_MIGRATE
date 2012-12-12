CREATE VIEW dbo.V_043_CLS_COMPARE_APPROVED_THIS_MONTH
AS
SELECT M.LEADER1_CA_OLD_ID, M.CIF, M.PRODUCT_NAME, V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.COUNT_OLD_LIMIT, 
               V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.SUM_OLD_LIMIT, V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.MAPPING_STATUS, 
               V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1.SUM_APPROVE_VALUE
FROM  (SELECT LEADER1_CA_OLD_ID, CIF, PRODUCT_NAME
               FROM   dbo.V_041_CLS_APPROVED_THIS_MONTH_SUMMARY
               WHERE (PRODUCT_NAME IS NOT NULL)
               UNION
               SELECT LEADER1_CA_OLD_ID, CIF, PRODUCT_NAME
               FROM  dbo.V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY) AS M LEFT OUTER JOIN
               dbo.V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY AS V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1 ON
                M.LEADER1_CA_OLD_ID = V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1.LEADER1_CA_OLD_ID AND 
               M.CIF = V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1.CIF AND 
               M.PRODUCT_NAME = V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1.PRODUCT_NAME LEFT OUTER JOIN
               dbo.V_041_CLS_APPROVED_THIS_MONTH_SUMMARY AS V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1 ON 
               M.LEADER1_CA_OLD_ID = V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.LEADER1_CA_OLD_ID AND 
               M.CIF = V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.CIF AND 
               M.PRODUCT_NAME = V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1.PRODUCT_NAME

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
         Begin Table = "M"
            Begin Extent = 
               Top = 10
               Left = 317
               Bottom = 128
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_042_CA_APPROVED_AND_RUNED_CLS_THIS_MONTH_SUMMARY_1"
            Begin Extent = 
               Top = 10
               Left = 614
               Bottom = 196
               Right = 830
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_041_CLS_APPROVED_THIS_MONTH_SUMMARY_1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 190
               Right = 256
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_043_CLS_COMPARE_APPROVED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_043_CLS_COMPARE_APPROVED_THIS_MONTH';

