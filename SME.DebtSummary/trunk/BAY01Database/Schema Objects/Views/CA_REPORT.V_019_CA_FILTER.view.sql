CREATE VIEW [CA_REPORT].[V_019_CA_FILTER]
AS
SELECT     CA_REPORT.V_001_ANNALS_CREDIT.OLD_ID, dbo.ANNALS_CUS_CA.CIF, dbo.GetName(dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, 
                      dbo.CUSTOMER.CUS_LAST) AS CUSTOMER_NAME, CA_REPORT.V_001_ANNALS_CREDIT.BRANCH_ID, 
                      CA_REPORT.V_001_ANNALS_CREDIT.BRANCH_DESC, CA_REPORT.V_001_ANNALS_CREDIT.REGION_ID, 
                      CA_REPORT.V_001_ANNALS_CREDIT.REGION_DESC, CA_REPORT.V_005_LAST_PROCESS.PROCESS, 
                      CA_REPORT.V_005_LAST_PROCESS.PROCESS_DATE, CA_REPORT.V_005_LAST_PROCESS.PROCESS_GROUP, 
                      CA_REPORT.V_005_LAST_PROCESS.PROCESS_HEAD, CA_REPORT.V_005_LAST_PROCESS.LEVEL_ID AS CA_SECTION_ID, 
                      CA_REPORT.V_005_LAST_PROCESS.LEVEL_NAME AS CA_SECTION_NAME, 
                      CA_REPORT.V_005_LAST_PROCESS.EMP_ID AS LAST_PROCESS_EMP_ID, 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.TITLE_NAME AS LAST_PROCESS_EMP_TITLE, 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.EMPNAME AS LAST_PROCESS_EMP_NAME, 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.EMPSURNAME AS LAST_PROCESS_EMP_SURNAME, 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.CATEGORY_KEY AS EMP_SECTION_KEY, 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.CATEGORY_DESC AS EMP_SECTION_DESC, 
                      CA_REPORT.V_001_ANNALS_CREDIT.COVENANT_FLAG
FROM         dbo.CUSTOMER RIGHT OUTER JOIN
                      dbo.ANNALS_CUS_CA ON dbo.CUSTOMER.CIF = dbo.ANNALS_CUS_CA.CIF RIGHT OUTER JOIN
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY INNER JOIN
                      CA_REPORT.V_005_LAST_PROCESS ON 
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY.EMP_ID = CA_REPORT.V_005_LAST_PROCESS.EMP_ID INNER JOIN
                      CA_REPORT.V_001_ANNALS_CREDIT ON CA_REPORT.V_005_LAST_PROCESS.OLD_ID = CA_REPORT.V_001_ANNALS_CREDIT.OLD_ID ON 
                      dbo.ANNALS_CUS_CA.ID = CA_REPORT.V_001_ANNALS_CREDIT.OLD_ID

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
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CUS_CA"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_008_CM_HEAD_MANAGER_SEQ1_ONLY (CLASSIFY)"
            Begin Extent = 
               Top = 6
               Left = 422
               Bottom = 121
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_005_LAST_PROCESS (CA_REPORT)"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_001_ANNALS_CREDIT (CA_REPORT)"
            Begin Extent = 
               Top = 80
               Left = 414
               Bottom = 195
               Right = 617
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
         Width = 1500
         Width = 1500
         Width = 2490
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane =', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_019_CA_FILTER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Begin ColumnWidths = 11
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_019_CA_FILTER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_019_CA_FILTER';

