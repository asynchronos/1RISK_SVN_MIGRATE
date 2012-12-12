CREATE VIEW [CA_REPORT].[V_010_CA_OLD_LIMIT_AND_REQUEST]
AS
SELECT UNION_CIF.LEADER1_CA_OLD_ID, UNION_CIF.CIF, UNION_CIF.PRODUCT_NAME, V009.COUNT_PRODUCT AS COUNT_OLD_PRODUCT, 
               V009.SUM_LIMIT_AMOUNT_PRODUCT_THB AS SUM_OLD_LIMIT_AMOUNT, V008.COUNT_PRODUCT AS COUNT_REQUEST_PRODUCT, 
               V008.SUM_REQUEST_VALUE_PLUS, V008.SUM_REQUEST_VALUE_MINUS, V008.SUM_APPROVE_VALUE_PLUS, 
               V008.SUM_APPROVE_VALUE_MINUS, V008.ID_OUT, V008.ID_OUT_CREATED_DATE, V008.LAST_PROCESS_GROUP
FROM  (SELECT DISTINCT 
                              CONVERT(nvarchar(10), LEADER1_CA_OLD_ID) AS LEADER1_CA_OLD_ID, CONVERT(int, CIF) AS CIF, CONVERT(nvarchar(50), 
                              PRODUCT_NAME) AS PRODUCT_NAME
               FROM   (SELECT LEADER1_CA_OLD_ID, CIF, PRODUCT_NAME
                               FROM   CA_REPORT.V_008_CA_CIF_BOARD_FINISHED_THIS_MONTH_SUM_BY_PRODUCT AS A
                               UNION
                               SELECT LEADER1_CA_OLD_ID, CIF, PRODUCT_NAME
                               FROM  CA_REPORT.V_009_SUM_PREVIOUS_LIMIT_FROM_CLS AS B) AS C) AS UNION_CIF LEFT OUTER JOIN
               CA_REPORT.V_009_SUM_PREVIOUS_LIMIT_FROM_CLS AS V009 ON UNION_CIF.LEADER1_CA_OLD_ID = V009.LEADER1_CA_OLD_ID AND 
               UNION_CIF.CIF = V009.CIF AND UNION_CIF.PRODUCT_NAME = V009.PRODUCT_NAME LEFT OUTER JOIN
               CA_REPORT.V_008_CA_CIF_BOARD_FINISHED_THIS_MONTH_SUM_BY_PRODUCT AS V008 ON 
               UNION_CIF.LEADER1_CA_OLD_ID = V008.LEADER1_CA_OLD_ID AND UNION_CIF.CIF = V008.CIF AND 
               UNION_CIF.PRODUCT_NAME = V008.PRODUCT_NAME

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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
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
         Left = -109
      End
      Begin Tables = 
         Begin Table = "UNION_CIF"
            Begin Extent = 
               Top = 7
               Left = 412
               Bottom = 125
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V009"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V008"
            Begin Extent = 
               Top = 5
               Left = 689
               Bottom = 141
               Right = 950
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
      Begin ColumnWidths = 15
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2064
         Width = 1200
         Width = 3312
         Width = 1620
         Width = 1692
         Width = 1200
         Width = 1776
         Width = 1200
         Width = 2076
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3084
         Alias = 2508
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_010_CA_OLD_LIMIT_AND_REQUEST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_010_CA_OLD_LIMIT_AND_REQUEST';

