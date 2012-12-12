/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW dbo.V_040_CLS_CREATED_FROM_APPROVED_THIS_MONTH
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
               MAPPING_STATUS2, LEADER1_CREATED_DATE, LEADER1_UPDATE_DATE, LIMIT_CHANGE_COUNT, LIMIT_CHANGE_PRODUCT_THB_TOTAL, 
               OLD_LIMIT_AMOUNT_PRODUCT_THB
FROM  dbo.V_038_CLS_CREATED_THIS_MONTH AS CLS
WHERE EXISTS
                   (SELECT DISTINCT OLD_ID
                    FROM   dbo.V_039_ACCOUNT_CA_APPROVED_THIS_MONTH AS CA
                    WHERE (OLD_ID = CLS.LEADER1_CA_OLD_ID))

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
         Begin Table = "CLS"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 358
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
      Begin ColumnWidths = 56
         Width = 284
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
         Column = 5832', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_040_CLS_CREATED_FROM_APPROVED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Alias = 900
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_040_CLS_CREATED_FROM_APPROVED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_040_CLS_CREATED_FROM_APPROVED_THIS_MONTH';

