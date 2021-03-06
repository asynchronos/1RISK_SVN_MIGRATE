CREATE VIEW dbo.REPORT36_07_SUBJECT_NEW_CUS
AS
SELECT     dbo.REPORT07_SUMMARY.OLD_ID, dbo.REPORT07_SUMMARY.CA_NO_ID, dbo.REPORT07_SUMMARY.CA_CREATE_DATE, 
                      dbo.REPORT07_SUMMARY.REFERENCE, dbo.REPORT07_SUMMARY.REFERENCE_DATE, dbo.REPORT07_SUMMARY.SUBJECT_IDEN, 
                      dbo.REPORT07_SUMMARY.SUBJECT_DETAIL_ID, dbo.REPORT07_SUMMARY.SUBJECT_DETAIL, dbo.REPORT07_SUMMARY.CIF, 
                      dbo.REPORT07_SUMMARY.ACCNO, dbo.REPORT07_SUMMARY.DECB_RD_ID, dbo.REPORT07_SUMMARY.DECB_RD, 
                      dbo.REPORT07_SUMMARY.CASHTYPE, dbo.REPORT07_SUMMARY.DECB_RD2, dbo.REPORT07_SUMMARY.OLD_VALUE, 
                      dbo.REPORT07_SUMMARY.RM_VALUE, dbo.REPORT07_SUMMARY.CM_VALUE, dbo.REPORT07_SUMMARY.APPROVE_VALUE, 
                      dbo.REPORT07_SUMMARY.APPROVE_DATE, dbo.REPORT07_SUMMARY.REJECT_DATE, dbo.REPORT07_SUMMARY.REJECT_REASON, 
                      dbo.REPORT07_SUMMARY.LAST_PROCESS, dbo.REPORT07_SUMMARY.LAST_PROCESS_ID, dbo.REPORT07_SUMMARY.LAST_PROCESS_GROUP, 
                      dbo.REPORT07_SUMMARY.LAST_PROCESS_DATE, dbo.REPORT07_SUMMARY.EMP_ID, dbo.REPORT07_SUMMARY.LEVEL_ID, 
                      dbo.REPORT07_SUMMARY.LEVEL_NAME, 
                      CASE dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID WHEN '01' THEN '1_CREDIT' WHEN '07' THEN '2_REVIEW' ELSE '3_OTHER' END AS SUBJECT_GROUP,
                       CASE dbo.REPORT07_SUMMARY.SUBJECT_DETAIL_ID WHEN '101' THEN '1_YES' ELSE '2_NO' END AS NEW_CUS, 
                      dbo.REPORT07_SUMMARY.Customer_Size
FROM         dbo.REPORT07_SUMMARY INNER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL ON dbo.REPORT07_SUMMARY.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID

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
         Begin Table = "REPORT07_SUMMARY"
            Begin Extent = 
               Top = 7
               Left = 251
               Bottom = 255
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 8
               Left = 29
               Bottom = 123
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 31
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1635
         Width = 2025
         Width = 1800
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9210
         Alias = 1545
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
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT36_07_SUBJECT_NEW_CUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT36_07_SUBJECT_NEW_CUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT36_07_SUBJECT_NEW_CUS';

