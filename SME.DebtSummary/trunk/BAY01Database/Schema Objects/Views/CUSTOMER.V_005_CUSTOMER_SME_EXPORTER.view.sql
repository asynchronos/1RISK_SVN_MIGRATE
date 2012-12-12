CREATE VIEW CUSTOMER.V_005_CUSTOMER_SME_EXPORTER
AS
SELECT EX.CIF, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS CUSTOMER_NAME, dbo.GetNameEng(CUS.CTITLE_E, CUS.CFIRST_E, 
               CUS.CLAST_E) AS CUSTOMER_NAME_E, BUSI.DESCRIPTION AS [TYPE_OF_EXPORT(TH)], BUSI.DESCRIPTION_EN AS [TYPE_OF_EXPORT(EN)], 
               EX.TOTAL_LIMIT AS LIMIT, BYCUS.Principal AS PRINCIPAL, COUNTRY1.DESCRIPTION AS COUNTRY_EXPORT_TO_1ST, 
               COUNTRY2.DESCRIPTION AS COUNTRY_EXPORT_TO_2ND, COUNTRY3.DESCRIPTION AS COUNTRY_EXPORT_TO_3RD, EX.REVENUE, 
               EX.REVENUE_EXPORT, EX.REVENUE_LOCAL, CURRENCY_EX_1.DESCRIPTION AS CURRENT_EX_TYPE_1ST, 
               EX.EX_PERCENTAGE_1 AS CURRENT_EX_1ST, CURRENCY_EX_2.DESCRIPTION AS CURRENT_EX_TYPE_2ND, 
               EX.EX_PERCENTAGE_2 AS CURRENT_EX_2ND, CURRENCY_EX_3.DESCRIPTION AS CURRENT_EX_TYPE_3RD, 
               EX.EX_PERCENTAGE_3 AS CURRENT_EX_3RD, EX.COGS, EX.COGS_IMPORT, CURRENCY_IM_1.DESCRIPTION AS CURRENT_IM_TYPE_1ST, 
               EX.IM_PERCENTAGE_1 AS CURRENT_IM_1ST, CURRENCY_IM_2.DESCRIPTION AS CURRENT_IM_TYPE_2ND, 
               EX.IM_PERCENTAGE_2 AS CURRENT_IM_2ND, CURRENCY_IM_3.DESCRIPTION AS CURRENT_IM_TYPE_3RD, 
               EX.IM_PERCENTAGE_3 AS CURRENT_IM_3RD, EX.COGS_LOCAL, EX.GROSS_MARGIN, EX.SG_AND_A, EX.NET_MARGIN, EX.PAY_INTEREST, 
               EX.PAY_PRINCIPAL, CASE ISNULL(EX.NET_MARGIN, 0) WHEN 0 THEN 0 ELSE CASE (ISNULL(EX.PAY_INTEREST, 0) + ISNULL(EX.PAY_PRINCIPAL, 0)) 
               WHEN 0 THEN EX.NET_MARGIN / ABS(EX.NET_MARGIN) * 9999999 ELSE EX.NET_MARGIN / (ISNULL(EX.PAY_INTEREST, 0) 
               + ISNULL(EX.PAY_PRINCIPAL, 0)) END END AS DSCR, CASE ISNULL(EX.GROSS_MARGIN, 0) WHEN 0 THEN 0 ELSE CASE ISNULL(EX.REVENUE, 0) 
               WHEN 0 THEN EX.GROSS_MARGIN / ABS(EX.GROSS_MARGIN) * 9999999 ELSE ISNULL(EX.GROSS_MARGIN, 0) 
               / EX.REVENUE * 100 END END AS [GROSS_MARGIN%], CASE ISNULL(EX.NET_MARGIN, 0) WHEN 0 THEN 0 ELSE CASE ISNULL(EX.REVENUE, 0) 
               WHEN 0 THEN EX.NET_MARGIN / ABS(EX.NET_MARGIN) * 9999999 ELSE ISNULL(EX.NET_MARGIN, 0) 
               / EX.REVENUE * 100 END END AS [NET_MARGIN%]
FROM  dbo.EXPORTER_LOOKUP AS CURRENCY_IM_2 RIGHT OUTER JOIN
               dbo.CUS_SME_EXPORTER AS EX LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS CURRENCY_IM_3 ON EX.IM_CURRENCY_TYPE_3 = CURRENCY_IM_3.ID ON 
               CURRENCY_IM_2.ID = EX.IM_CURRENCY_TYPE_2 LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS CURRENCY_IM_1 ON EX.IM_CURRENCY_TYPE_1 = CURRENCY_IM_1.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS CURRENCY_EX_3 ON EX.EX_CURRENCY_TYPE_3 = CURRENCY_EX_3.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS CURRENCY_EX_2 ON EX.EX_CURRENCY_TYPE_2 = CURRENCY_EX_2.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS CURRENCY_EX_1 ON EX.EX_CURRENCY_TYPE_1 = CURRENCY_EX_1.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS COUNTRY3 ON EX.EXPORT_TO_3 = COUNTRY3.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS COUNTRY2 ON EX.EXPORT_TO_2 = COUNTRY2.ID LEFT OUTER JOIN
               dbo.EXPORTER_LOOKUP AS COUNTRY1 ON EX.EXPORT_TO_1 = COUNTRY1.ID LEFT OUTER JOIN
               dbo.ByCustomer AS BYCUS ON EX.CIF = BYCUS.Cif LEFT OUTER JOIN
               dbo.CUSTOMER AS CUS ON EX.CIF = CUS.CIF LEFT OUTER JOIN
               dbo.BUSINESS_TYPE_4 AS BUSI INNER JOIN
               dbo.CUSTOMER_SME AS SME ON BUSI.TYPE4_ID = SME.BUSI_RISK1_ID ON EX.CIF = SME.CIF

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
         Begin Table = "CURRENCY_IM_2"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EX"
            Begin Extent = 
               Top = 7
               Left = 270
               Bottom = 143
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CURRENCY_IM_3"
            Begin Extent = 
               Top = 7
               Left = 537
               Bottom = 143
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CURRENCY_IM_1"
            Begin Extent = 
               Top = 7
               Left = 759
               Bottom = 143
               Right = 933
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CURRENCY_EX_3"
            Begin Extent = 
               Top = 7
               Left = 981
               Bottom = 143
               Right = 1155
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CURRENCY_EX_2"
            Begin Extent = 
               Top = 147
               Left = 48
               Bottom = 283
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CURRENCY_EX_1"
            Begin Extent = 
               Top = 147
               Left = 270
               Bottom = 283
               Right = 444
            End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_005_CUSTOMER_SME_EXPORTER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COUNTRY3"
            Begin Extent = 
               Top = 147
               Left = 492
               Bottom = 283
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COUNTRY2"
            Begin Extent = 
               Top = 147
               Left = 714
               Bottom = 283
               Right = 888
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COUNTRY1"
            Begin Extent = 
               Top = 147
               Left = 936
               Bottom = 283
               Right = 1110
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BYCUS"
            Begin Extent = 
               Top = 287
               Left = 48
               Bottom = 423
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUS"
            Begin Extent = 
               Top = 287
               Left = 281
               Bottom = 423
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSI"
            Begin Extent = 
               Top = 287
               Left = 503
               Bottom = 423
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SME"
            Begin Extent = 
               Top = 287
               Left = 737
               Bottom = 423
               Right = 986
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
End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_005_CUSTOMER_SME_EXPORTER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_005_CUSTOMER_SME_EXPORTER';

