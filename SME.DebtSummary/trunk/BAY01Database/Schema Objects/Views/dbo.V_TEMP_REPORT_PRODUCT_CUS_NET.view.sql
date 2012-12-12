CREATE VIEW dbo.V_TEMP_REPORT_PRODUCT_CUS_NET
AS
SELECT     e.ID, e.app_date, e.CIF, SUM(e.n_value) AS net_value, SUM(e.n_value_approve) AS net_value_approve, dbo.TEMP_REPORT_PRODUCT.NEW, 
                      dbo.TEMP_REPORT_PRODUCT.OLD, dbo.TEMP_REPORT_PRODUCT.REVIEW, dbo.TEMP_REPORT_PRODUCT.EXCEPTION, 
                      dbo.TEMP_REPORT_PRODUCT.APPROVE, dbo.TEMP_REPORT_PRODUCT.Send_To_Board, dbo.TEMP_REPORT_PRODUCT.PROCESS_GROUP, 
                      dbo.TEMP_REPORT_PRODUCT.PROCESS
FROM         (SELECT     a.ID, a.[APP-DATE] AS app_date, a.CIF, CONVERT(float, a.VALUE) * b.SUBJECT_ACTION AS n_value, CONVERT(float, a.VALUE_APPROVE) 
                                              * b.SUBJECT_ACTION AS n_value_approve
                       FROM          dbo.TEMP_REPORT_PRODUCT_CUS AS a INNER JOIN
                                              dbo.ANNALS_SUBJECT_DETAIL AS b ON a.SUBJECT_DETAIL_ID = b.SUBJECT_DETAIL_ID
                       WHERE      (a.[APP-DATE] BETWEEN CONVERT(datetime, '28/2/2011', 103) AND CONVERT(datetime, '31/5/2011', 103))) AS e INNER JOIN
                      dbo.TEMP_REPORT_PRODUCT ON e.ID = dbo.TEMP_REPORT_PRODUCT.ID
GROUP BY e.ID, e.app_date, e.CIF, dbo.TEMP_REPORT_PRODUCT.NEW, dbo.TEMP_REPORT_PRODUCT.OLD, dbo.TEMP_REPORT_PRODUCT.REVIEW, 
                      dbo.TEMP_REPORT_PRODUCT.EXCEPTION, dbo.TEMP_REPORT_PRODUCT.APPROVE, dbo.TEMP_REPORT_PRODUCT.Send_To_Board, 
                      dbo.TEMP_REPORT_PRODUCT.PROCESS_GROUP, dbo.TEMP_REPORT_PRODUCT.PROCESS

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[13] 2[12] 3) )"
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
         Begin Table = "TEMP_REPORT_PRODUCT"
            Begin Extent = 
               Top = 11
               Left = 303
               Bottom = 203
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 31
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 219
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
         Width = 2370
         Width = 1020
         Width = 1260
         Width = 1305
         Width = 930
         Width = 990
         Width = 810
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1770
         Alias = 1815
         Table = 2415
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_REPORT_PRODUCT_CUS_NET';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_REPORT_PRODUCT_CUS_NET';

