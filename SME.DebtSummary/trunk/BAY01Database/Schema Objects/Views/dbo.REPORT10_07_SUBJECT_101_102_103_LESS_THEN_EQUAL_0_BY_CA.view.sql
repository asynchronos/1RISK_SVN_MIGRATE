CREATE VIEW [dbo].[REPORT10_07_SUBJECT_101_102_103_LESS_THEN_EQUAL_0_BY_CA]
AS
SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, COUNT(DISTINCT CIF) AS CIFs, SUM(OLD_VALUE) AS OLD_VALUEs, 
                      SUM(RM_VALUE) AS RM_VALUEs, SUM(CM_VALUE) AS CM_VALUEs, SUM(APPROVE_VALUE) AS APPROVE_VALUEs, APPROVE_DATE, REJECT_DATE, 
                      REJECT_REASON, LAST_PROCESS, LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME
FROM         (SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, SUBJECT_IDEN, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, CIF, 
                                              ACCNO, DECB_RD_ID, DECB_RD, OLD_VALUE, RM_VALUE, CM_VALUE, APPROVE_VALUE, APPROVE_DATE, REJECT_DATE, 
                                              REJECT_REASON, LAST_PROCESS, LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, 
                                              LEVEL_NAME
                       FROM          dbo.REPORT07_SUMMARY
                       WHERE      (SUBJECT_DETAIL_ID = '101' OR
                                              SUBJECT_DETAIL_ID = '102' OR
                                              SUBJECT_DETAIL_ID = '103') AND (RM_VALUE <= 0)) AS SUBJECT_101_102_103_RM_LESS_THAN_EQUAL_0
GROUP BY OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, 
                      LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME

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
         Begin Table = "SUBJECT_101_102_103_RM_LESS_THAN_EQUAL_0"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1695
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT10_07_SUBJECT_101_102_103_LESS_THEN_EQUAL_0_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT10_07_SUBJECT_101_102_103_LESS_THEN_EQUAL_0_BY_CA';

