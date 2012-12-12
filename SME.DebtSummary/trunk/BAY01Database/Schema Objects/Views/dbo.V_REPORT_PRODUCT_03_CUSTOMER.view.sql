CREATE VIEW dbo.V_REPORT_PRODUCT_03_CUSTOMER
AS
SELECT     TOP (100) PERCENT CONVERT(INT, SUBSTRING(dbo.ANNALS_CREDIT_ACCOUNT.ID, 7, 4) + SUBSTRING(dbo.ANNALS_CREDIT_ACCOUNT.ID, 1, 6)) 
                      AS NEW_ID, dbo.ANNALS_CREDIT_ACCOUNT.ID, dbo.ANNALS_CREDIT_ACCOUNT.IDEN, dbo.ANNALS_CREDIT_ACCOUNT.CIF, 
                      dbo.CUSTOMER_INFO.Cifname AS CUSTOMER, dbo.CUSTOMER_INFO.BUSI_TYPE AS BUSINESS_ID, 
                      dbo.CUSTOMER_INFO.Busi_name AS BUSINESS_TYPE, dbo.V_REPORT_PRODUCT_03_LIMIT.grp_lim
FROM         dbo.ANNALS_CREDIT_ACCOUNT INNER JOIN
                      dbo.V_REPORT_PRODUCT_03_IDEN ON dbo.ANNALS_CREDIT_ACCOUNT.IDEN = dbo.V_REPORT_PRODUCT_03_IDEN.IDEN LEFT OUTER JOIN
                      dbo.V_REPORT_PRODUCT_03_LIMIT ON dbo.ANNALS_CREDIT_ACCOUNT.CIF = dbo.V_REPORT_PRODUCT_03_LIMIT.cif LEFT OUTER JOIN
                      dbo.CUSTOMER_INFO ON dbo.ANNALS_CREDIT_ACCOUNT.CIF = dbo.CUSTOMER_INFO.CIF
ORDER BY dbo.ANNALS_CREDIT_ACCOUNT.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[8] 2[10] 3) )"
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
         Begin Table = "ANNALS_CREDIT_ACCOUNT"
            Begin Extent = 
               Top = 42
               Left = 29
               Bottom = 308
               Right = 334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_03_IDEN"
            Begin Extent = 
               Top = 0
               Left = 505
               Bottom = 88
               Right = 809
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_03_LIMIT"
            Begin Extent = 
               Top = 98
               Left = 499
               Bottom = 239
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_INFO"
            Begin Extent = 
               Top = 245
               Left = 500
               Bottom = 360
               Right = 805
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
      Begin ColumnWidths = 10
         Width = 284
         Width = 1440
         Width = 1095
         Width = 1125
         Width = 3435
         Width = 1440
         Width = 15480
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6930
         Alias = 2880
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_03_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_03_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_03_CUSTOMER';

