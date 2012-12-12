CREATE VIEW dbo.V_REPORT_PRODUCT_04_ACCOUNT
AS
SELECT     TOP (100) PERCENT ID, CASE WHEN SUBJECT_DETAIL_ID = '101' THEN 1 ELSE 0 END AS NEW, 
                      CASE WHEN SUBJECT_DETAIL_ID <> '101' THEN 1 ELSE 0 END AS OLD, CASE WHEN SUBJECT_DETAIL_ID = '701' THEN 1 ELSE 0 END AS REVIEW, 
                      CASE WHEN SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115') THEN 1 ELSE 0 END AS CREDIT, 
                      CASE WHEN SUBJECT_DETAIL_ID NOT IN ('101', '102', '103', '104', '105', '114', '115', '701') THEN 1 ELSE 0 END AS EXCEPTION, 
                      CASE WHEN SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN 1 ELSE 0 END AS INCREASE, CASE WHEN SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN 1 ELSE 0 END AS DECREASE, CASE WHEN DECB_RD_ID = '0001' THEN 1 ELSE 0 END AS OD, 
                      CASE WHEN DECB_RD_ID = '0003' THEN 1 ELSE 0 END AS TL, CASE WHEN DECB_RD_ID = '0007' THEN 1 ELSE 0 END AS LG, 
                      CASE WHEN DECB_RD_ID = '0002' THEN 1 ELSE 0 END AS STLPN, CASE WHEN DECB_RD_ID = '0004' THEN 1 ELSE 0 END AS TRADEFIN, 
                      CASE WHEN DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007') THEN 1 ELSE 0 END AS OTHERS, CASE WHEN DECB_RD_ID = '0001' AND 
                      SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN Value_Customer ELSE 0 END AS OD_INCREASE_VALUE_CUSTOMER, 
                      CASE WHEN DECB_RD_ID = '0001' AND SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN Value_Customer ELSE 0 END AS OD_DECREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0001' AND SUBJECT_DETAIL_ID IN ('101', 
                      '102', '103') THEN VALUE_APPROVE ELSE 0 END AS OD_INCREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID = '0001' AND 
                      SUBJECT_DETAIL_ID IN ('104', '105') THEN VALUE_APPROVE ELSE 0 END AS OD_DECREASE_VALUE_APPROVE, 
                      CASE WHEN DECB_RD_ID = '0002' AND SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN Value_Customer ELSE 0 END AS PN_INCREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0002' AND SUBJECT_DETAIL_ID IN ('104', 
                      '105') THEN Value_Customer ELSE 0 END AS PN_DECREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0002' AND 
                      SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN VALUE_APPROVE ELSE 0 END AS PN_INCREASE_VALUE_APPROVE, 
                      CASE WHEN DECB_RD_ID = '0002' AND SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN VALUE_APPROVE ELSE 0 END AS PN_DECREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID = '0003' AND SUBJECT_DETAIL_ID IN ('101', 
                      '102', '103') THEN Value_Customer ELSE 0 END AS TL_INCREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0003' AND 
                      SUBJECT_DETAIL_ID IN ('104', '105') THEN Value_Customer ELSE 0 END AS TL_DECREASE_VALUE_CUSTOMER, 
                      CASE WHEN DECB_RD_ID = '0003' AND SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN VALUE_APPROVE ELSE 0 END AS TL_INCREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID = '0003' AND SUBJECT_DETAIL_ID IN ('104', 
                      '105') THEN VALUE_APPROVE ELSE 0 END AS TL_DECREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID = '0004' AND 
                      SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN Value_Customer ELSE 0 END AS FN_INCREASE_VALUE_CUSTOMER, 
                      CASE WHEN DECB_RD_ID = '0004' AND SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN Value_Customer ELSE 0 END AS FN_DECREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0004' AND SUBJECT_DETAIL_ID IN ('101', 
                      '102', '103') THEN VALUE_APPROVE ELSE 0 END AS FN_INCREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID = '0004' AND 
                      SUBJECT_DETAIL_ID IN ('104', '105') THEN VALUE_APPROVE ELSE 0 END AS FN_DECREASE_VALUE_APPROVE, 
                      CASE WHEN DECB_RD_ID = '0007' AND SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN Value_Customer ELSE 0 END AS LG_INCREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0007' AND SUBJECT_DETAIL_ID IN ('104', 
                      '105') THEN Value_Customer ELSE 0 END AS LG_DECREASE_VALUE_CUSTOMER, CASE WHEN DECB_RD_ID = '0007' AND 
                      SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN VALUE_APPROVE ELSE 0 END AS LG_INCREASE_VALUE_APPROVE, 
                      CASE WHEN DECB_RD_ID = '0007' AND SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN VALUE_APPROVE ELSE 0 END AS LG_DECREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007') 
                      AND SUBJECT_DETAIL_ID IN ('101', '102', '103') THEN Value_Customer ELSE 0 END AS OTHER_INCREASE_VALUE_CUSTOMER, 
                      CASE WHEN DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007') AND SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN Value_Approve ELSE 0 END AS OTHER_INCREASE_VALUE_APPROVE, CASE WHEN DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007') 
                      AND SUBJECT_DETAIL_ID IN ('104', '105') THEN Value_Customer ELSE 0 END AS OTHER_DECREASE_VALUE_CUSTOMER, 
                      CASE WHEN DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007') AND SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN Value_Approve ELSE 0 END AS OTHER_DECREASE_VALUE_APPROVE, CASE WHEN SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN Value_Customer ELSE 0 END AS ALL_INCREASE_VALUE_CUSTOMER, CASE WHEN SUBJECT_DETAIL_ID IN ('101', '102', '103') 
                      THEN VALUE_APPROVE ELSE 0 END AS ALL_INCREASE_VALUE_APPROVE, CASE WHEN SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN Value_Customer ELSE 0 END AS ALL_DECREASE_VALUE_CUSTOMER, CASE WHEN SUBJECT_DETAIL_ID IN ('104', '105') 
                      THEN VALUE_APPROVE ELSE 0 END AS ALL_DECREASE_VALUE_APPROVE, CIF
FROM         dbo.ANNALS_CREDIT_ACCOUNT
ORDER BY ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[23] 2[21] 3) )"
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
               Top = 6
               Left = 38
               Bottom = 160
               Right = 289
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
         Width = 1590
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9405
         Alias = 3210
         Table = 2475
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_04_ACCOUNT';

