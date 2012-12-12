CREATE VIEW dbo.REPORT08_ACCEL
AS
SELECT     CONVERT(VARCHAR(10), GETDATE(), 120) AS AS_OF_DATE, DECB_RD, CIF, SUBJECT_IDEN, CA_NO_ID, REFERENCE, 
                      PRODUCT_CODE AS APP_PRODUCT_CODE, PROJECT_CODE AS APP_PROJECT_CODE, CONVERT(VARCHAR, REFERENCE_DATE, 120) 
                      AS DATE_IN_ANNALS, CONVERT(VARCHAR, CA_CREATE_DATE, 120) AS ANNALS_CREATE_DATE, CONVERT(VARCHAR, APPROVE_DATE, 120) 
                      AS APP_DATE_APPROVE, CONVERT(VARCHAR, REJECT_DATE, 120) AS APP_DATE_REJECT, REJECT_REASON AS APP_REJECT_REASON, 
                      LAST_PROCESS AS APP_STATUS_CURRENT, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, RM_VALUE AS VALUE_CUSTOMER, 
                      APPROVE_VALUE AS VALUE_APPROVE, ACCNO, EMP_ID, LEVEL_NAME, NULL AS CRM_REF_CODE
FROM         dbo.REPORT07_SUMMARY

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[18] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[26] 4[49] 3) )"
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
         Begin Table = "REPORT07_SUMMARY"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 260
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 26
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1875
         Width = 1665
         Width = 1935
         Width = 1740
         Width = 1665
         Width = 1980
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
         Column = 3630
         Alias = 1935
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT08_ACCEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT08_ACCEL';

