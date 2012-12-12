CREATE VIEW dbo.V_EDW_RISK_MAXAGING_DAILY_FACT
AS
SELECT     DATE_ID_KEY, TDR, TDR_ASOFDATE, TOTAL_CASH_PRINCIPAL, MAX_AGING, MAX_AGING_HIST_30DAY, OD_PRINCIPAL, OD_MAX_AGING, 
                      OD_MAX_AGING_HIST_30DAY, OD_MAX_AGING_HIST_30DAY AS Expr1, TL_COM_PRINCIPAL, TL_COM_MAX_AGING, 
                      TL_COM_MAX_AGING_HIST_30DAY, TL_HL_PL_STF_PRINCIPAL, TL_HL_PL_STF_MAX_AGING, TL_HL_PL_STF_MAX_AGING_30DAY, PN_PRINCIPAL, 
                      PN_MAX_AGING, PN_MAX_AGING_HIST_30DAY, BD_PRINCIPAL, BD_MAX_AGING, BD_MAX_AGING_HIST_30DAY, TRADE_PRINCIPAL, 
                      TRADE_MAX_AGING, TRADE_MAX_AGING_HIST_30DAY, CLAIM_PRINCIPAL, CLAIM_MAX_AGING, CLAIM_MAX_AGING_HIST_30DAY, FNX_PRINCIPAL, 
                      FNX_MAX_AGING, FNX_MAX_AGING_HIST_30DAY, CUSTOMER_KEY, DEMOGRAPHICS_KEY, GECID, GECID_COMPANY, ETL_ASOFDATE, ETL_DT, 
                      R.custname, R.grp_size, R.custsize, R.busi_type, R.busi_desc, R.adjclass, R.class_h, R.cif
FROM         EDW..DWHADMIN.RISK_MAXAGING_DAILY_FACT AS D INNER JOIN
                      DBF_IMPORT.dbo.rep_prod AS R ON D.cif = R.cif

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
         Begin Table = "D"
            Begin Extent = 
               Top = 9
               Left = 281
               Bottom = 189
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 32
               Bottom = 272
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Column = 1995
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_EDW_RISK_MAXAGING_DAILY_FACT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_EDW_RISK_MAXAGING_DAILY_FACT';

