CREATE VIEW dbo.V_REPORT_PRODUCT_02_PROCESS
AS
SELECT     dbo.ANNALS_CREDIT_PROCESS.ID, dbo.ANNALS_CREDIT_PROCESS.EMP_ID, 
                      TB_TITLE_1.TITLE_NAME + TB_EMPLOYEE_1.EMPNAME + ' ' + TB_EMPLOYEE_1.EMPSURNAME AS EMPLOYEE, 
                      dbo.ANNALS_CREDIT_PROCESS.USER_ID, dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID, dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID, 
                      dbo.ANNALS_PROCESS.PROCESS_GROUP, dbo.ANNALS_PROCESS.PEOCESS_HEAD, dbo.ANNALS_PROCESS.PROCESS, 
                      dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.V_REPORT_PRODUCT_02_HEAD_NAME.HEAD_ID, 
                      dbo.V_REPORT_PRODUCT_02_HEAD_NAME.HEAD_EMPNAME, dbo.V_REPORT_PRODUCT_02_HEAD_NAME.HEAD_SURNAME, 
                      dbo.V_REPORT_PRODUCT_02_HEAD_NAME.CATEGORY_DESC_TH AS LEVEL_NAME
FROM         dbo.V_REPORT_PRODUCT_02_HEAD_NAME RIGHT OUTER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON 
                      dbo.V_REPORT_PRODUCT_02_HEAD_NAME.CATEGORY_KEY = dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID LEFT OUTER JOIN
                      dbo.TB_TITLE AS TB_TITLE_1 INNER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_1 ON TB_TITLE_1.TITLE_CODE = TB_EMPLOYEE_1.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT_PROCESS.EMP_ID = TB_EMPLOYEE_1.EMP_ID LEFT OUTER JOIN
                      dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[50] 2[10] 3) )"
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
         Begin Table = "ANNALS_CREDIT_PROCESS"
            Begin Extent = 
               Top = 0
               Left = 496
               Bottom = 230
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_1"
            Begin Extent = 
               Top = 17
               Left = 42
               Bottom = 132
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_1"
            Begin Extent = 
               Top = 0
               Left = 250
               Bottom = 115
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 6
               Left = 709
               Bottom = 151
               Right = 896
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_02_HEAD_NAME"
            Begin Extent = 
               Top = 155
               Left = 39
               Bottom = 316
               Right = 286
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
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2310
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4875
         Width = 1725
         Width = 1500
         Width = 2235
         Width = 1860
         Wi', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'dth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1590
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7695
         Alias = 2325
         Table = 3930
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS';

