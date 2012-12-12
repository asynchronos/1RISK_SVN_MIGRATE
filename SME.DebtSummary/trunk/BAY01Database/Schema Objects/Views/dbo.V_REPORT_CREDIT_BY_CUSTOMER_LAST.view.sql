CREATE VIEW dbo.V_REPORT_CREDIT_BY_CUSTOMER_LAST
AS
SELECT     dbo.V_REPORT_CREDIT_BY_CUSTOMER.CIF, dbo.ANNALS.DATE_IN_ANNALS, 
                      dbo.V_REPORT_CREDIT_BY_CUSTOMER.[REG-DATE] AS REGISTER_DATE, 
                      dbo.V_REPORT_CREDIT_BY_CUSTOMER.[APP-DATE] AS LAST_PROCESS_DATE, dbo.V_REPORT_CREDIT_BY_CUSTOMER.ID
FROM         dbo.ANNALS INNER JOIN
                      dbo.ANNALS_CREDIT ON dbo.ANNALS.ANNALS_TYPE = dbo.ANNALS_CREDIT.ANNALS_TYPE AND 
                      dbo.ANNALS.ANNALS_SEQ_NO = dbo.ANNALS_CREDIT.ANNALS_SEQ_NO AND 
                      dbo.ANNALS.ANNALS_YEAR = dbo.ANNALS_CREDIT.ANNALS_YEAR INNER JOIN
                      dbo.V_REPORT_CREDIT_BY_CUSTOMER ON dbo.ANNALS_CREDIT.ID = dbo.V_REPORT_CREDIT_BY_CUSTOMER.ID
WHERE     (dbo.V_REPORT_CREDIT_BY_CUSTOMER.SUBJECT_DETAIL_ID IN ('101', '102', '103', '114', '115')) AND 
                      (dbo.V_REPORT_CREDIT_BY_CUSTOMER.PROCESS_GROUP IN ('C', 'D', 'E'))
GROUP BY dbo.V_REPORT_CREDIT_BY_CUSTOMER.CIF, dbo.V_REPORT_CREDIT_BY_CUSTOMER.[REG-DATE], 
                      dbo.V_REPORT_CREDIT_BY_CUSTOMER.[APP-DATE], dbo.ANNALS.DATE_IN_ANNALS, dbo.V_REPORT_CREDIT_BY_CUSTOMER.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[14] 2[26] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ANNALS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 121
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_CREDIT_BY_CUSTOMER"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 234
               Right = 241
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
         Width = 1995
         Width = 1875
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_LAST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_LAST';

