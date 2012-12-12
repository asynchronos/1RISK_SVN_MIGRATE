CREATE VIEW dbo.V_004_EDW_RISK_MAXAGING_LAST_DATE_60_DAY_F_002_AND_003
AS
SELECT     D.DATE_ID_KEY, D.CIF, D.TDR, D.TDR_ASOFDATE, D.TOTAL_CASH_PRINCIPAL, D.MAX_AGING, D.MAX_AGING_HIST_30DAY, D.OD_PRINCIPAL, 
                      D.OD_MAX_AGING, D.OD_MAX_AGING_HIST_30DAY, D.TL_COM_PRINCIPAL, D.TL_COM_MAX_AGING, D.TL_COM_MAX_AGING_HIST_30DAY, 
                      D.TL_HL_PL_STF_PRINCIPAL, D.TL_HL_PL_STF_MAX_AGING, D.TL_HL_PL_STF_MAX_AGING_30DAY, D.PN_PRINCIPAL, D.PN_MAX_AGING, 
                      D.PN_MAX_AGING_HIST_30DAY, D.BD_PRINCIPAL, D.BD_MAX_AGING, D.BD_MAX_AGING_HIST_30DAY, D.TRADE_PRINCIPAL, 
                      D.TRADE_MAX_AGING, D.TRADE_MAX_AGING_HIST_30DAY, D.CLAIM_PRINCIPAL, D.CLAIM_MAX_AGING, D.CLAIM_MAX_AGING_HIST_30DAY, 
                      D.FNX_PRINCIPAL, D.FNX_MAX_AGING, D.FNX_MAX_AGING_HIST_30DAY, D.CUSTOMER_KEY, D.DEMOGRAPHICS_KEY, D.GECID, 
                      D.GECID_COMPANY, D.ETL_ASOFDATE, D.ETL_DT, T.MAX_AGING_HIST_30DAY AS MAX_AGING_HIST_30DAY_LATER, 
                      T.OD_MAX_AGING_HIST_30DAY AS OD_MAX_AGING_HIST_30DAY_LATER, 
                      T.TL_COM_MAX_AGING_HIST_30DAY AS TL_COM_MAX_AGING_HIST_30DAY_LATER, 
                      T.TL_HL_PL_STF_MAX_AGING_30DAY AS TL_HL_PL_STF_MAX_AGING_30DAY_LATER, 
                      T.PN_MAX_AGING_HIST_30DAY AS PN_MAX_AGING_HIST_30DAY_LATER, T.BD_MAX_AGING_HIST_30DAY AS BD_MAX_AGING_HIST_30DAY_LATER, 
                      T.TRADE_MAX_AGING_HIST_30DAY AS TRADE_MAX_AGING_HIST_30DAY_LATER, 
                      T.CLAIM_MAX_AGING_HIST_30DAY AS CLAIM_MAX_AGING_HIST_30DAY_LATER, 
                      T.FNX_MAX_AGING_HIST_30DAY AS FNX_MAX_AGING_HIST_30DAY_LATER, 
                      D.MAX_AGING_HIST_30DAY + T.MAX_AGING_HIST_30DAY AS MAX_AGING_HIST_60DAY, 
                      D.OD_MAX_AGING_HIST_30DAY + T.OD_MAX_AGING_HIST_30DAY AS OD_MAX_AGING_HIST_60DAY, 
                      D.TL_COM_MAX_AGING_HIST_30DAY + T.TL_COM_MAX_AGING_HIST_30DAY AS TL_COM_MAX_AGING_HIST_60DAY, 
                      D.TL_HL_PL_STF_MAX_AGING_30DAY + T.TL_HL_PL_STF_MAX_AGING_30DAY AS TL_HL_PL_STF_MAX_AGING_60DAY, 
                      D.PN_MAX_AGING_HIST_30DAY + T.PN_MAX_AGING_HIST_30DAY AS PN_MAX_AGING_HIST_60DAY, 
                      D.TRADE_MAX_AGING_HIST_30DAY + T.TRADE_MAX_AGING_HIST_30DAY AS TRADE_MAX_AGING_HIST_60DAY, 
                      D.CLAIM_MAX_AGING_HIST_30DAY + T.CLAIM_MAX_AGING_HIST_30DAY AS CLAIM_MAX_AGING_HIST_60DAY, 
                      D.FNX_MAX_AGING_HIST_30DAY + T.FNX_MAX_AGING_HIST_30DAY AS FNX_MAX_AGING_HIST_60DAY, 
                      D.BD_MAX_AGING_HIST_30DAY + T.BD_MAX_AGING_HIST_30DAY AS BD_MAX_AGING_HIST_60DAY
FROM         dbo.V_002_EDW_RISK_MAXAGING_LAST_DATE_F_000_AND_001 AS D INNER JOIN
                      dbo.V_003_EDW_RISK_MAXAGING_30_DAY_LATER_F_000_AND_001 AS T ON D.CIF = T.CIF

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[15] 2[40] 3) )"
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
               Top = 19
               Left = 25
               Bottom = 230
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 13
               Left = 315
               Bottom = 230
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 49
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
         Width = 3180
         Width = 2520
         Width = 2790', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_004_EDW_RISK_MAXAGING_LAST_DATE_60_DAY_F_002_AND_003';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6270
         Alias = 4395
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_004_EDW_RISK_MAXAGING_LAST_DATE_60_DAY_F_002_AND_003';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_004_EDW_RISK_MAXAGING_LAST_DATE_60_DAY_F_002_AND_003';

