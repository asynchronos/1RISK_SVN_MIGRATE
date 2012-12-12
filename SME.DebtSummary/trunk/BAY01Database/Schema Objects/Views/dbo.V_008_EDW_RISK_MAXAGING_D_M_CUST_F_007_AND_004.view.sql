CREATE VIEW dbo.V_008_EDW_RISK_MAXAGING_D_M_CUST_F_007_AND_004
AS
SELECT     CUST.SIZE_DETAIL, D.TDR, D.TDR_ASOFDATE, D.TOTAL_CASH_PRINCIPAL, D.MAX_AGING, D.MAX_AGING_HIST_30DAY, D.OD_PRINCIPAL, 
                      D.OD_MAX_AGING, D.OD_MAX_AGING_HIST_30DAY, D.TL_COM_PRINCIPAL, D.TL_COM_MAX_AGING, D.TL_COM_MAX_AGING_HIST_30DAY, 
                      D.TL_HL_PL_STF_MAX_AGING, D.TL_HL_PL_STF_PRINCIPAL, D.TL_HL_PL_STF_MAX_AGING_30DAY, D.PN_PRINCIPAL, D.PN_MAX_AGING, 
                      D.PN_MAX_AGING_HIST_30DAY, D.BD_PRINCIPAL, D.BD_MAX_AGING, D.BD_MAX_AGING_HIST_30DAY, D.TRADE_PRINCIPAL, 
                      D.TRADE_MAX_AGING, D.TRADE_MAX_AGING_HIST_30DAY, D.CLAIM_PRINCIPAL, D.CLAIM_MAX_AGING, D.CLAIM_MAX_AGING_HIST_30DAY, 
                      D.FNX_PRINCIPAL, D.FNX_MAX_AGING, D.FNX_MAX_AGING_HIST_30DAY, D.ETL_ASOFDATE, M.MAX_AGING AS M_MAX_AGING, 
                      M.MAX_AGING_HIST_24M AS M_MAX_AGING_HIST_24M, M.ADJCLASS AS M_ADJCLASS, M.CLASS_HIST_24M AS M_CLASS_HIST_24M, 
                      M.OD_PRINCIPAL AS M_OD_PRINCIPAL, M.OD_MAX_AGING AS M_OD_MAX_AGING, M.OD_MAX_AGING_HIST_24M AS M_OD_MAX_AGING_HIST_24M, 
                      M.TL_COM_PRINCIPAL AS M_TL_COM_PRINCIPAL, M.TL_COM_MAX_AGING AS M_TL_COM_MAX_AGING, 
                      M.TL_COM_MAX_AGING_HIST_24M AS M_TL_COM_MAX_AGING_HIST_24M, M.TL_HL_PL_STF_PRINCIPAL AS M_TL_HL_PL_STF_PRINCIPAL, 
                      M.TL_HL_PL_STF_MAX_AGING AS M_TL_HL_PL_STF_MAX_AGING, M.TL_HL_PL_STF_MAX_AGING_24M AS M_TL_HL_PL_STF_MAX_AGING_24M, 
                      M.PN_MAX_AGING AS M_PN_MAX_AGING, M.PN_PRINCIPAL AS M_PN_PRINCIPAL, M.PN_MAX_AGING_HIST_24M AS M_PN_MAX_AGING_HIST_24M, 
                      M.BD_PRINCIPAL AS M_BD_PRINCIPAL, M.BD_MAX_AGING AS M_BD_MAX_AGING, M.BD_MAX_AGING_HIST_24M AS M_BD_MAX_AGING_HIST_24M, 
                      M.TRADE_PRINCIPAL AS M_TRADE_PRINCIPAL, M.TRADE_MAX_AGING AS M_TRADE_MAX_AGING, 
                      M.TRADE_MAX_AGING_HIST_24M AS M_TRADE_MAX_AGING_HIST_24M, M.CLAIM_PRINCIPAL AS M_CLAIM_PRINCIPAL, 
                      M.CLAIM_MAX_AGING AS M_CLAIM_MAX_AGING, M.CLAIM_MAX_AGING_HIST_24M AS M_CLAIM_MAX_AGING_HIST_24M, 
                      M.FNX_PRINCIPAL AS M_FNX_PRINCIPAL, M.FNX_MAX_AGING AS M_FNX_MAX_AGING, 
                      M.FNX_MAX_AGING_HIST_24M AS M_FNX_MAX_AGING_HIST_24M, M.ETL_ASOFDATE AS M_ETL_ASOFDATE, 
                      M.TOTAL_CASH_PRINCIPAL AS M_TOTAL_CASH_PRINCIPAL, D.MAX_AGING_HIST_60DAY, D.OD_MAX_AGING_HIST_60DAY, 
                      D.TL_COM_MAX_AGING_HIST_60DAY, D.TL_HL_PL_STF_MAX_AGING_60DAY, D.PN_MAX_AGING_HIST_60DAY, D.TRADE_MAX_AGING_HIST_60DAY, 
                      D.CLAIM_MAX_AGING_HIST_60DAY, D.FNX_MAX_AGING_HIST_60DAY, D.BD_MAX_AGING_HIST_60DAY, 
                      dbo.V_009_LEADER_CRME_LAW_ALL.CLineS, dbo.V_009_LEADER_CRME_LAW_ALL.BR2_Name, dbo.V_009_LEADER_CRME_LAW_ALL.C3_New, 
                      dbo.V_009_LEADER_CRME_LAW_ALL.FUND, dbo.V_009_LEADER_CRME_LAW_ALL.C4_New, dbo.V_009_LEADER_CRME_LAW_ALL.CHAR2, 
                      dbo.V_010_DBF_IMPORT_T_MASTER_2.Count AS TDR_COUNT, dbo.V_010_DBF_IMPORT_T_MASTER_2.Class_Before, 
                      dbo.V_010_DBF_IMPORT_T_MASTER_2.Class_After, dbo.V_009_LEADER_CRME_LAW_ALL.C33, dbo.V_009_LEADER_CRME_LAW_ALL.C44, 
                      dbo.V_009_LEADER_CRME_LAW_ALL.NOU, dbo.V_009_LEADER_CRME_LAW_ALL.PHO, dbo.V_009_LEADER_CRME_LAW_ALL.RED2, 
                      dbo.V_009_LEADER_CRME_LAW_ALL.DARA, dbo.V_010_DBF_IMPORT_T_MASTER_2.DateCutOff, 
                      dbo.V_010_DBF_IMPORT_T_MASTER_2.RegiterYear, dbo.V_010_DBF_IMPORT_T_MASTER_2.RegiterMonth, 
                      dbo.V_010_DBF_IMPORT_T_MASTER_2.RegiterDate, dbo.V_010_DBF_IMPORT_T_MASTER_2.DateRegiter, REP.CIF, REP.CUS_FIRST, 
                      REP.CUS_LAST
FROM         dbo.V_009_LEADER_CRME_LAW_ALL RIGHT OUTER JOIN
                      dbo.V_004_EDW_RISK_MAXAGING_LAST_DATE_60_DAY_F_002_AND_003 AS D LEFT OUTER JOIN
                      dbo.V_010_DBF_IMPORT_T_MASTER_2 ON D.CIF = dbo.V_010_DBF_IMPORT_T_MASTER_2.Cif_No ON 
                      dbo.V_009_LEADER_CRME_LAW_ALL.CIF_NO = D.CIF RIGHT OUTER JOIN
                      dbo.V_007_EDW_RISK_MAXAGING_MONTHLY_LAST_DATE_F_005_AND_006 AS M RIGHT OUTER JOIN
                      dbo.CUSTOMER AS REP LEFT OUTER JOIN
                      dbo.CUSTOMER_SME01_VIEW AS CUST ON REP.CIF = CUST.CIF ON M.CIF = REP.CIF ON D.CIF = REP.CIF

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[30] 3[12] 2) )"
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
         Top = -21
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_009_LEADER_CRME_LAW_ALL"
            Begin Extent = 
               Top = 108
               Left = 801
               Bottom = 370
               Right = 946
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 0
               Left = 463
               Bottom = 367
               Right = 754
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_010_DBF_IMPORT_T_MASTER_2"
            Begin Extent = 
               Top = 10
               Left = 916
               Bottom = 262
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 238
               Left = 0
               Bottom = 443
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REP"
            Begin Extent = 
               Top = 45
               Left = 265
               Bottom = 341
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUST"
            Begin Extent = 
               Top = 72
               Left = 6
               Bottom = 217
               Right = 178
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
      Begin ColumnWidths = 89
         Width = 284
         Width = 780', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_008_EDW_RISK_MAXAGING_D_M_CUST_F_007_AND_004';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 3135
         Width = 1620
         Width = 1545
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
         Width = 3540
         Width = 1860
         Width = 1995
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
         Column = 6315
         Alias = 3195
         Table = 4515
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_008_EDW_RISK_MAXAGING_D_M_CUST_F_007_AND_004';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_008_EDW_RISK_MAXAGING_D_M_CUST_F_007_AND_004';

