CREATE VIEW dbo.V_ANNALS_CUS_CA
AS
SELECT     dbo.ANNALS_CUS_CA.ID, dbo.ANNALS_CUS_CA.CIF, dbo.CUSTOMER_INFO.Cifname, CONVERT(nvarchar, dbo.ANNALS_CUS_CA.CIF) 
                      + ':' + dbo.CUSTOMER_INFO.Cifname AS LISTCIF, dbo.CUSTOMER_SME_RATING.RATING_KEY, dbo.CUSTOMER_SME_RATING.RATING_DESC, 
                      dbo.ANNALS_CUS_CA.RATING_DATE, dbo.ANNALS_CUS_CA.BUSI_RISK1_ID AS BUSS_TYPE_ID, 
                      dbo.BUSINESS_TYPE_4.DESCRIPTION AS BUSS_TYPE_DETAIL
FROM         dbo.ANNALS_CUS_CA LEFT OUTER JOIN
                      dbo.BUSINESS_TYPE_4 ON dbo.ANNALS_CUS_CA.BUSI_RISK1_ID = dbo.BUSINESS_TYPE_4.TYPE4_ID LEFT OUTER JOIN
                      dbo.CUSTOMER_INFO ON dbo.ANNALS_CUS_CA.CIF = dbo.CUSTOMER_INFO.CIF LEFT OUTER JOIN
                      dbo.CUSTOMER_SME_RATING ON dbo.ANNALS_CUS_CA.RATING_KEY = dbo.CUSTOMER_SME_RATING.RATING_KEY

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[18] 2[31] 3) )"
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
         Begin Table = "ANNALS_CUS_CA"
            Begin Extent = 
               Top = 44
               Left = 350
               Bottom = 231
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_INFO"
            Begin Extent = 
               Top = 18
               Left = 52
               Bottom = 217
               Right = 297
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_RATING"
            Begin Extent = 
               Top = 14
               Left = 568
               Bottom = 229
               Right = 943
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSINESS_TYPE_4"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 337
               Right = 206
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
         Width = 1065
         Width = 2775
         Width = 3150
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5280
         Alias = 1560
         Table = 2460
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_CA';

