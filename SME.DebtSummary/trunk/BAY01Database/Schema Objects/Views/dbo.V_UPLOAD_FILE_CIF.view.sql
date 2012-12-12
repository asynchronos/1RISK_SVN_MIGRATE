CREATE VIEW dbo.V_UPLOAD_FILE_CIF
AS
SELECT     TOP (100) PERCENT dbo.V_UPLOADFILE.ID, dbo.V_UPLOADFILE.USER_ID, dbo.V_UPLOADFILE.REMARK, dbo.V_UPLOADFILE.TYPE, 
                      dbo.V_UPLOADFILE.COLL_ID, SUBSTRING(dbo.V_UPLOADFILE.ANNALS_ID, 1, 6) + '/' + CONVERT(nvarchar(4), CONVERT(int, 
                      SUBSTRING(dbo.V_UPLOADFILE.ANNALS_ID, 7, 4) + 543)) AS ANNALS_ID, dbo.V_UPLOADFILE.PATH, dbo.V_UPLOADFILE.CREATE_DATE, 
                      dbo.V_UPLOADFILE.FILE_TYPE, dbo.TEMP_REPORT_PRODUCT.PROCESS_ID, dbo.TEMP_REPORT_PRODUCT.PROCESS, 
                      dbo.TEMP_REPORT_PRODUCT_CUS.CIF, dbo.TEMP_REPORT_PRODUCT_CUS.CUSTOMER_NAME AS CUSTOMERNAME, 
                      dbo.TEMP_REPORT_PRODUCT.[APP-DATE] AS PROCESS_DATE, dbo.TEMP_REPORT_PRODUCT.REFERENCE, 
                      dbo.TEMP_REPORT_PRODUCT.Send_To_Board, dbo.V_UPLOADFILE.FILE_YEAR
FROM         dbo.V_UPLOADFILE LEFT OUTER JOIN
                      dbo.TEMP_REPORT_PRODUCT ON dbo.V_UPLOADFILE.ANNALS_ID = dbo.TEMP_REPORT_PRODUCT.ID LEFT OUTER JOIN
                      dbo.TEMP_REPORT_PRODUCT_CUS ON dbo.V_UPLOADFILE.ANNALS_ID = dbo.TEMP_REPORT_PRODUCT_CUS.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[31] 2[18] 3) )"
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
         Begin Table = "V_UPLOADFILE"
            Begin Extent = 
               Top = 15
               Left = 34
               Bottom = 394
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TEMP_REPORT_PRODUCT"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 156
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TEMP_REPORT_PRODUCT_CUS"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 121
               Right = 658
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
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1455
         Width = 2235
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2250
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7905
         Alias = 2220
         Table = 1800
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_UPLOAD_FILE_CIF';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_UPLOAD_FILE_CIF';

