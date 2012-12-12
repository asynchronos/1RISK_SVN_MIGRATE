/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW dbo.V_038_CLS_CREATED_THIS_MONTH
AS
SELECT ID_KEY, CIF, LEADER1_CA_OLD_ID, CREATED_BY_USER_CODE, CREATED_BY_USER_NAME, UPDATED_BY_USER_CODE, 
               UPDATED_BY_USER_NAME, UPDATED_STATUS_BY_USER_CODE, UPDATED_STATUS_BY_USER_NAME, LIMIT_NO_PRODUCT, 
               LIMIT_PRODUCT_STATUS, LIMIT_REVOLVING_TYPE, APPL_KEY, APPL_ID, PRODUCT_CODE, PRODUCT_NAME, ACCOUNT_NO, CIF_LIST_CA_NO, 
               CIF_LIST_ROOT, CIF_LIST_PRODUCT, NO_OF_CIF_CANO, LIMIT_AMOUNT_PRODUCT_THB, LIMIT_AMOUNT_PRODUCT_CCY, 
               LIMIT_USED_PRODUCT_THB, LIMIT_USED_PRODUCT_CCY, LIMIT_AVAILABLE_ROOT_THB, LIMIT_AVAI_RATIO_PRODUCT_THB, 
               HOLD_AMOUNT_THB, HOLD_AMOUNT_CCY, LIMIT_AMOUNT_CA_THB, LIMIT_USED_CA_THB, LIMIT_AVAILABLE_CA_THB, GECID, CREATED_DATE, 
               UPDATE_DATE, UPDATE_STATUS_DATE, ASOFDATE, ETL_DT, LIMIT_PRODUCT_CA_NO, LIMIT_PRODUCT_CA_DATE, 
               LIMIT_PRODUCT_APPV_DATE, LIMIT_PRODUCT_APPV_AUTH_UNIT, LIMIT_PRODUCT_PREVIOUS_CA_NO, LIMIT_PRODUCT_EFFECT_DATE, 
               LIMIT_PRODUCT_EXPIRE_DATE, LIMIT_PRODUCT_SIGN_DATE, LIMIT_CHANGE_PRODUCT_THB, LIMIT_CHANGE_DATE, MAPPING_STATUS, 
               CASE MAPPING_STATUS WHEN 'N' THEN '1_N' WHEN 'L' THEN '2_L' WHEN 'S' THEN '3_S' WHEN 'R' THEN '4_R' WHEN 'E' THEN '5_E' WHEN 'U' THEN '6_U'
                ELSE MAPPING_STATUS END AS MAPPING_STATUS2, LEADER1_CREATED_DATE, LEADER1_UPDATE_DATE, LIMIT_CHANGE_COUNT, 
               LIMIT_CHANGE_PRODUCT_THB_TOTAL, ISNULL(LIMIT_AMOUNT_PRODUCT_THB, 0) - ISNULL(LIMIT_CHANGE_PRODUCT_THB_TOTAL, 0) 
               AS OLD_LIMIT_AMOUNT_PRODUCT_THB
FROM  dbo.CLS_WHEN_APPROVE
WHERE (LEADER1_CREATED_DATE >= CONVERT(DATETIME, '01' + SUBSTRING(CONVERT(varchar, GETDATE(), 103), 3, LEN(CONVERT(varchar, GETDATE(), 
               103))), 103))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
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
         Begin Table = "CLS_WHEN_APPROVE"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 196
               Right = 358
            End
            DisplayFlags = 280
            TopColumn = 139
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 151
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2136
         Width = 2472
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2004
         Width = 2676
         Width = 1200
         Width = 1464
         Width = 1200
         Width = 1740
         Width = 1788
         Width = 1560
         Width = 2556
         Width = 2568
         Width = 2328
         Width = 2340
         Width = 2388
         Width = 2808
         Width = 1740
         Width = 1752
         Width = 2004
         Width = 1776
         Width = 2148
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2712
         Width = 2220
         Width = 2400
         Width = 2856
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2376
         Width = 2532
         Width = 2076
         Width = 1524
         Width = 2184
         Width = 2076
         Width = 1920
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_038_CLS_CREATED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1200
         Width = 1956
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_038_CLS_CREATED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_038_CLS_CREATED_THIS_MONTH';

