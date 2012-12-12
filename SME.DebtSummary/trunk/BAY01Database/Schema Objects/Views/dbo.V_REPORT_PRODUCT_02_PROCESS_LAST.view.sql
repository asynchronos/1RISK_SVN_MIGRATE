CREATE VIEW dbo.V_REPORT_PRODUCT_02_PROCESS_LAST
AS
SELECT CONVERT(INT, SUBSTRING(dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.ID, 7, 4) 
               + SUBSTRING(dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.ID, 1, 6)) AS NEW_ID, V_REPORT_PRODUCT_02_PROCESS_1.ID, 
               V_REPORT_PRODUCT_02_PROCESS_1.EMP_ID, V_REPORT_PRODUCT_02_PROCESS_1.EMPLOYEE, 
               V_REPORT_PRODUCT_02_PROCESS_1.USER_ID, V_REPORT_PRODUCT_02_PROCESS_1.PROCESS_ID, 
               V_REPORT_PRODUCT_02_PROCESS_1.LEVEL_ID, V_REPORT_PRODUCT_02_PROCESS_1.LEVEL_NAME, 
               V_REPORT_PRODUCT_02_PROCESS_1.PROCESS_GROUP, V_REPORT_PRODUCT_02_PROCESS_1.PEOCESS_HEAD, 
               V_REPORT_PRODUCT_02_PROCESS_1.PROCESS, V_REPORT_PRODUCT_02_PROCESS_1.LEVEL_ID AS LEVEL_PROCESS_ID, 
               V_REPORT_PRODUCT_02_PROCESS_1.HEAD_ID, V_REPORT_PRODUCT_02_PROCESS_1.HEAD_EMPNAME, 
               V_REPORT_PRODUCT_02_PROCESS_1.HEAD_SURNAME, V_REPORT_PRODUCT_02_PROCESS_1.PROCESS_DATE, 
               dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.BEGIN_DATE, dbo.V_REPORT_PRODUCT_02_PRE_DATE.PRE_DATE, 
               dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.LAST_DATE, dbo.FindWorkingTime(dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.BEGIN_DATE, 
               dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.LAST_DATE, '08', '30', '17', '30') / 28800.0 AS TTY, CASE WHEN (PRE_DATE) IS NULL 
               THEN dbo.FindWorkingTime(BEGIN_DATE, LAST_DATE, '08', '30', '17', '30') / 28800.0 ELSE dbo.FindWorkingTime(BEGIN_DATE, PRE_DATE, '08', '30', '17', 
               '30') / 28800.0 END AS PAT
FROM  dbo.V_REPORT_PRODUCT_02_PROCESS_DATE INNER JOIN
               dbo.V_REPORT_PRODUCT_02_PROCESS AS V_REPORT_PRODUCT_02_PROCESS_1 ON 
               dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.ID = V_REPORT_PRODUCT_02_PROCESS_1.ID AND 
               dbo.V_REPORT_PRODUCT_02_PROCESS_DATE.LAST_DATE = V_REPORT_PRODUCT_02_PROCESS_1.PROCESS_DATE LEFT OUTER JOIN
               dbo.V_REPORT_PRODUCT_02_PRE_DATE ON V_REPORT_PRODUCT_02_PROCESS_1.ID = dbo.V_REPORT_PRODUCT_02_PRE_DATE.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[21] 2[20] 3) )"
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
         Begin Table = "V_REPORT_PRODUCT_02_PROCESS_DATE"
            Begin Extent = 
               Top = 1
               Left = 476
               Bottom = 207
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_02_PRE_DATE"
            Begin Extent = 
               Top = 12
               Left = 19
               Bottom = 144
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_02_PROCESS_1"
            Begin Extent = 
               Top = 0
               Left = 214
               Bottom = 267
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
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
         Width = 1692
         Width = 1800
         Width = 1716
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6012
         Alias = 2160
         Table = 3432
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS_LAST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS_LAST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_02_PROCESS_LAST';

