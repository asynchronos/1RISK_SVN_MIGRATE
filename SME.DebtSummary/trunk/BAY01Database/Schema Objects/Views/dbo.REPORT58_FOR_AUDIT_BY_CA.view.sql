CREATE VIEW dbo.REPORT58_FOR_AUDIT_BY_CA
AS
SELECT     TOP (100) PERCENT dbo.Temp_Report_Chart.ID, dbo.Temp_Report_Chart.[REG-DATE], dbo.Temp_Report_Chart.[APP-DATE], 
                      dbo.Temp_Report_Chart.CIF, dbo.Temp_Report_Chart.CUSTOMER, dbo.Temp_Report_Chart.[EMP-ID], dbo.Temp_Report_Chart.EMPLOYEE, 
                      dbo.Temp_Report_Chart.[BRANCH-ID], dbo.Temp_Report_Chart.[BRANCH-NAME], dbo.Temp_Report_Chart.[REGION-ID], 
                      dbo.Temp_Report_Chart.[REGION-NAME], dbo.Temp_Report_Chart.NEW, dbo.Temp_Report_Chart.OLD, dbo.Temp_Report_Chart.REVIEW, 
                      dbo.Temp_Report_Chart.EXCEPTION, dbo.Temp_Report_Chart.APPROVE, dbo.Temp_Report_Chart.[O-D], dbo.Temp_Report_Chart.[(O-D)], 
                      dbo.Temp_Report_Chart.[F-L], dbo.Temp_Report_Chart.[(F-L)], dbo.Temp_Report_Chart.[L-G], dbo.Temp_Report_Chart.[(L-G)], 
                      dbo.Temp_Report_Chart.[STL-PN], dbo.Temp_Report_Chart.[(STL-PN)], dbo.Temp_Report_Chart.[TRADE-FIN], dbo.Temp_Report_Chart.[(TRADE-FIN)], 
                      dbo.Temp_Report_Chart.OTHERS, dbo.Temp_Report_Chart.[(OTHERS)], dbo.Temp_Report_Chart.[SUM-INCREASE], 
                      dbo.Temp_Report_Chart.[SUM-DECREASE], dbo.Temp_Report_Chart.NET, dbo.Temp_Report_Chart.[SUM-RM_VALUE], 
                      dbo.Temp_Report_Chart.PROCESS_HEAD, dbo.Temp_Report_Chart.PROCESS_GROUP, dbo.Temp_Report_Chart.PROCESS, 
                      dbo.Temp_Report_Chart.TTY, dbo.Temp_Report_Chart.PAT, dbo.Temp_Report_Chart.[APP-TYPE], dbo.Temp_Report_Chart.LEVEL_NAME, 
                      dbo.Temp_Report_Chart.JOB_TYPE, dbo.Temp_Report_Chart.AUTHORITY, dbo.Temp_Report_Chart.REFERRAL_NO, 
                      dbo.Temp_Report_Chart.REFERENCE, dbo.Temp_Report_Chart.BOARD, dbo.Temp_Report_Chart.LEVEL_PROCESS_ID, 
                      dbo.Temp_Report_Chart.Business_ID, dbo.Temp_Report_Chart.Business_Type, dbo.Temp_Report_Chart.reason_remark, 
                      dbo.Temp_Report_Chart.result_remark, ASOF.AS_OF_CLASS, dbo.ByCustomer.Class, dbo.ByCustomer.AGING, dbo.ByCustomer.Rating, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE_ID, dbo.GetName(APPROVE01.TITLE_NAME, APPROVE01.EMPNAME, APPROVE01.EMPSURNAME) 
                      AS EMP_APPROVE_1, dbo.ANNALS_CREDIT.EMP_APPROVE2_ID, dbo.GetName(APPROVE02.TITLE_NAME, APPROVE02.EMPNAME, 
                      APPROVE02.EMPSURNAME) AS EMP_APPROVE_2
FROM         dbo.ANNALS_CREDIT INNER JOIN
                      dbo.EMPLOYEE01 AS APPROVE01 ON dbo.ANNALS_CREDIT.EMP_APPROVE_ID = APPROVE01.EMP_ID INNER JOIN
                      dbo.EMPLOYEE01 AS APPROVE02 ON dbo.ANNALS_CREDIT.EMP_APPROVE2_ID = APPROVE02.EMP_ID RIGHT OUTER JOIN
                      dbo.Temp_Report_Chart ON dbo.ANNALS_CREDIT.ID = dbo.Temp_Report_Chart.ID LEFT OUTER JOIN
                      dbo.ByCustomer ON dbo.Temp_Report_Chart.CIF = dbo.ByCustomer.Cif CROSS JOIN
                          (SELECT     ASOF AS AS_OF_CLASS
                            FROM          dbo.DEBTDATE
                            WHERE      (Upd_TABLE = 'ByCustomer')) AS ASOF

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
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
         Configuration = "(V (3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Temp_Report_Chart"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ByCustomer"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 194
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ASOF"
            Begin Extent = 
               Top = 7
               Left = 426
               Bottom = 77
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 616
               Bottom = 194
               Right = 805
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "APPROVE01"
            Begin Extent = 
               Top = 5
               Left = 816
               Bottom = 120
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "APPROVE02"
            Begin Extent = 
               Top = 126
               Left = 815
               Bottom = 267
               Right = 980
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
         Width = 1500
         Widt', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT58_FOR_AUDIT_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'h = 1500
         Width = 2025
         Width = 1500
         Width = 3660
         Width = 1500
         Width = 1500
         Width = 5025
         Width = 1500
         Width = 7095
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4530
         Width = 4260
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2295
         Width = 2655
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
         Width = 2115
         Width = 3465
         Width = 1500
         Width = 1500
         Width = 5730
         Width = 1500
         Width = 2850
         Width = 1560
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1635
         Width = 1620
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT58_FOR_AUDIT_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT58_FOR_AUDIT_BY_CA';

