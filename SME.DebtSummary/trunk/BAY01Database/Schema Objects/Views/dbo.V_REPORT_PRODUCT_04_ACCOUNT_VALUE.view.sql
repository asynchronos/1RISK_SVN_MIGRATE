CREATE VIEW dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE
AS
SELECT     CONVERT(INT, SUBSTRING(ID, 7, 4) + SUBSTRING(ID, 1, 6)) AS NEW_ID, ID, CASE WHEN (NEW >= 1) THEN 1 ELSE 0 END AS NEW, 
                      CASE WHEN (NEW = 0) THEN 1 ELSE 0 END AS OLD, CASE WHEN (REVIEW >= 1) AND (CREDIT = 0) THEN 1 ELSE 0 END AS REVIEW, 
                      CASE WHEN (CREDIT >= 1) THEN 1 ELSE 0 END AS CREDIT, CASE WHEN (CREDIT = 0) AND (REVIEW = 0) THEN 1 ELSE 0 END AS EXCEPTION, 
                      INCREASE, DECREASE, OD, TL, LG, STLPN, TRADEFIN, OTHERS, OD_INCREASE_VALUE_CUSTOMER, OD_DECREASE_VALUE_CUSTOMER, 
                      OD_INCREASE_VALUE_APPROVE, OD_DECREASE_VALUE_APPROVE, PN_INCREASE_VALUE_CUSTOMER, PN_DECREASE_VALUE_CUSTOMER, 
                      PN_INCREASE_VALUE_APPROVE, PN_DECREASE_VALUE_APPROVE, TL_INCREASE_VALUE_CUSTOMER, TL_DECREASE_VALUE_CUSTOMER, 
                      TL_INCREASE_VALUE_APPROVE, TL_DECREASE_VALUE_APPROVE, FN_INCREASE_VALUE_CUSTOMER, FN_DECREASE_VALUE_CUSTOMER, 
                      FN_INCREASE_VALUE_APPROVE, FN_DECREASE_VALUE_APPROVE, LG_INCREASE_VALUE_CUSTOMER, LG_DECREASE_VALUE_CUSTOMER, 
                      LG_INCREASE_VALUE_APPROVE, LG_DECREASE_VALUE_APPROVE, OTHER_INCREASE_VALUE_CUSTOMER, OTHER_INCREASE_VALUE_APPROVE, 
                      OTHER_DECREASE_VALUE_CUSTOMER, OTHER_DECREASE_VALUE_APPROVE, ALL_INCREASE_VALUE_CUSTOMER, 
                      ALL_INCREASE_VALUE_APPROVE, ALL_DECREASE_VALUE_CUSTOMER, ALL_DECREASE_VALUE_APPROVE
FROM         dbo.V_REPORT_PRODUCT_04_SUM

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[23] 2[26] 3) )"
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
         Begin Table = "V_REPORT_PRODUCT_04_SUM"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 309
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
      Begin ColumnWidths = 43
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
         Width = 2610
         Width = 2205
         Width = 2160
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
         Width = 2625
         Width = 2220
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
         Column = 3660
         Alias = 1365
         Table = 3090
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT_VALUE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT_VALUE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT_VALUE';

