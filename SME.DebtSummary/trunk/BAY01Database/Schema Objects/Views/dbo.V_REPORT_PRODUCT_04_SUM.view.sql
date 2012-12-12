CREATE VIEW [dbo].[V_REPORT_PRODUCT_04_SUM]
AS
SELECT     ID, SUM(NEW) AS NEW, SUM(OLD) AS OLD, SUM(REVIEW) AS REVIEW, SUM(CREDIT) AS CREDIT, SUM(EXCEPTION) AS EXCEPTION, SUM(INCREASE) 
                      AS INCREASE, SUM(DECREASE) AS DECREASE, SUM(OD) AS OD, SUM(TL) AS TL, SUM(LG) AS LG, SUM(STLPN) AS STLPN, SUM(TRADEFIN) 
                      AS TRADEFIN, SUM(OTHERS) AS OTHERS, SUM(OD_INCREASE_VALUE_CUSTOMER) AS OD_INCREASE_VALUE_CUSTOMER, 
                      SUM(OD_DECREASE_VALUE_CUSTOMER) AS OD_DECREASE_VALUE_CUSTOMER, SUM(OD_INCREASE_VALUE_APPROVE) 
                      AS OD_INCREASE_VALUE_APPROVE, SUM(OD_DECREASE_VALUE_APPROVE) AS OD_DECREASE_VALUE_APPROVE, 
                      SUM(PN_INCREASE_VALUE_CUSTOMER) AS PN_INCREASE_VALUE_CUSTOMER, SUM(PN_DECREASE_VALUE_CUSTOMER) 
                      AS PN_DECREASE_VALUE_CUSTOMER, SUM(PN_INCREASE_VALUE_APPROVE) AS PN_INCREASE_VALUE_APPROVE, 
                      SUM(PN_DECREASE_VALUE_APPROVE) AS PN_DECREASE_VALUE_APPROVE, SUM(TL_INCREASE_VALUE_CUSTOMER) 
                      AS TL_INCREASE_VALUE_CUSTOMER, SUM(TL_DECREASE_VALUE_CUSTOMER) AS TL_DECREASE_VALUE_CUSTOMER, 
                      SUM(TL_INCREASE_VALUE_APPROVE) AS TL_INCREASE_VALUE_APPROVE, SUM(TL_DECREASE_VALUE_APPROVE) 
                      AS TL_DECREASE_VALUE_APPROVE, SUM(FN_INCREASE_VALUE_CUSTOMER) AS FN_INCREASE_VALUE_CUSTOMER, 
                      SUM(FN_DECREASE_VALUE_CUSTOMER) AS FN_DECREASE_VALUE_CUSTOMER, SUM(FN_INCREASE_VALUE_APPROVE) 
                      AS FN_INCREASE_VALUE_APPROVE, SUM(FN_DECREASE_VALUE_APPROVE) AS FN_DECREASE_VALUE_APPROVE, 
                      SUM(LG_INCREASE_VALUE_CUSTOMER) AS LG_INCREASE_VALUE_CUSTOMER, SUM(LG_DECREASE_VALUE_CUSTOMER) 
                      AS LG_DECREASE_VALUE_CUSTOMER, SUM(LG_INCREASE_VALUE_APPROVE) AS LG_INCREASE_VALUE_APPROVE, 
                      SUM(LG_DECREASE_VALUE_APPROVE) AS LG_DECREASE_VALUE_APPROVE, SUM(ALL_INCREASE_VALUE_CUSTOMER) 
                      AS ALL_INCREASE_VALUE_CUSTOMER, SUM(ALL_INCREASE_VALUE_APPROVE) AS ALL_INCREASE_VALUE_APPROVE, 
                      SUM(ALL_DECREASE_VALUE_CUSTOMER) AS ALL_DECREASE_VALUE_CUSTOMER, SUM(ALL_DECREASE_VALUE_APPROVE) 
                      AS ALL_DECREASE_VALUE_APPROVE, SUM(OTHER_INCREASE_VALUE_CUSTOMER) AS OTHER_INCREASE_VALUE_CUSTOMER, 
                      SUM(OTHER_INCREASE_VALUE_APPROVE) AS OTHER_INCREASE_VALUE_APPROVE, SUM(OTHER_DECREASE_VALUE_CUSTOMER) 
                      AS OTHER_DECREASE_VALUE_CUSTOMER, SUM(OTHER_DECREASE_VALUE_APPROVE) AS OTHER_DECREASE_VALUE_APPROVE
FROM         dbo.V_REPORT_PRODUCT_04_ACCOUNT
GROUP BY ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[9] 4[50] 2[23] 3) )"
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
         Begin Table = "V_REPORT_PRODUCT_04_ACCOUNT"
            Begin Extent = 
               Top = 29
               Left = 24
               Bottom = 208
               Right = 278
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
         Width = 1605
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
      Begin ColumnWidths = 12
         Column = 3300
         Alias = 3330
         Table = 3150
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_SUM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_SUM';

