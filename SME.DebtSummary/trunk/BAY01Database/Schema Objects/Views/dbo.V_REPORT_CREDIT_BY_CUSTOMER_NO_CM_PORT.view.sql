CREATE VIEW dbo.V_REPORT_CREDIT_BY_CUSTOMER_NO_CM_PORT
AS
SELECT     TOP (100) PERCENT dbo.V_Report_Credit_By_Customer.CIF, dbo.CUSTOMER_INFO.Cifname, dbo.V_Report_Credit_By_Customer.[EMP-ID], 
                      dbo.V_Report_Credit_By_Customer.EMPLOYEE, dbo.V_Report_Credit_By_Customer.LEVEL_NAME, dbo.V_Report_Credit_By_Customer.[REGION-ID], 
                      dbo.V_Report_Credit_By_Customer.PROCESS_GROUP, dbo.ANNALS_PROCESS.PEOCESS_HEAD, dbo.Id_Region.Region_Name
FROM         dbo.V_Report_Credit_By_Customer LEFT OUTER JOIN
                      dbo.Id_Region ON dbo.V_Report_Credit_By_Customer.[REGION-ID] = dbo.Id_Region.Id_Region LEFT OUTER JOIN
                      dbo.ANNALS_PROCESS ON dbo.V_Report_Credit_By_Customer.PROCESS_GROUP = dbo.ANNALS_PROCESS.PROCESS_GROUP LEFT OUTER JOIN
                      dbo.CUSTOMER_INFO ON dbo.V_Report_Credit_By_Customer.CIF = dbo.CUSTOMER_INFO.CIF
WHERE     (dbo.V_Report_Credit_By_Customer.CM_NAME IS NULL)
GROUP BY dbo.V_Report_Credit_By_Customer.CIF, dbo.CUSTOMER_INFO.Cifname, dbo.V_Report_Credit_By_Customer.[EMP-ID], 
                      dbo.V_Report_Credit_By_Customer.EMPLOYEE, dbo.V_Report_Credit_By_Customer.LEVEL_NAME, dbo.V_Report_Credit_By_Customer.[REGION-ID], 
                      dbo.V_Report_Credit_By_Customer.PROCESS_GROUP, dbo.ANNALS_PROCESS.PEOCESS_HEAD, dbo.Id_Region.Region_Name
ORDER BY dbo.V_Report_Credit_By_Customer.LEVEL_NAME

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[18] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[48] 4[27] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[60] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -49
      End
      Begin Tables = 
         Begin Table = "V_Report_Credit_By_Customer"
            Begin Extent = 
               Top = 1
               Left = 34
               Bottom = 253
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 31
         End
         Begin Table = "CUSTOMER_INFO"
            Begin Extent = 
               Top = 0
               Left = 238
               Bottom = 214
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 1
               Left = 432
               Bottom = 225
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 55
               Left = 645
               Bottom = 170
               Right = 814
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1245
         Width = 2610
         Width = 1335
         Width = 2565
         Width = 2415
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_NO_CM_PORT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_NO_CM_PORT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_NO_CM_PORT';

