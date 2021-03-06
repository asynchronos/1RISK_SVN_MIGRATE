CREATE VIEW [dbo].[V_021_LAST_CREDIT_CA_APPROVE_ONLY_PLUS_ONLY]
AS
SELECT     [CIF], [OLD_ID], [APPROVE_VALUEs], [REASON], [LAST_PROCESS], [LAST_PROCESS_ID], [LAST_PROCESS_GROUP], [LAST_PROCESS_DATE], 
                      [LAST_PROCESS_MONTH], [LAST_PROCESS_BY_ID], [LAST_PROCESS_BY_NAME], [CA_LEVEL_ID], [LEVEL_NAME], [CA_SIZE_ID], [CA_SIZE_DETAIL], 
                      [CA_REGION_ID], [CA_REGION_NAME], [SUBJECT_GROUP], [NEW_CUS], [Send_To_Board], [Authority], [EMP_REQUEST_ID], [EMP_REQUEST_NAME], 
                      [EMP_APPROVE1_ID], [EMP_APPROVE1_NAME], [EMP_APPROVE2_ID], [EMP_APPROVE2_NAME], [EMP_APPROVE3_ID], [EMP_APPROVE3_NAME], 
                      [EMP_APPROVE4_ID], [EMP_APPROVE4_NAME], [SUB_COMMITTEE_1], [EMP_SUB_COMM1_NAME] AS SUB_COMMITTEE_1_NAME, 
                      [SUB_COMMITTEE_2], [EMP_SUB_COMM2_NAME] AS SUB_COMMITTEE_2_NAME, [SUB_COMMITTEE_3], 
                      [EMP_SUB_COMM3_NAME] AS SUB_COMMITTEE_3_NAME
FROM         (SELECT     [CIF], [OLD_ID], [APPROVE_VALUEs], [REASON], [LAST_PROCESS], [LAST_PROCESS_ID], [LAST_PROCESS_GROUP], 
                                              [LAST_PROCESS_DATE], [LAST_PROCESS_MONTH], [LAST_PROCESS_BY_ID], [LAST_PROCESS_BY_NAME], [CA_LEVEL_ID], 
                                              [LEVEL_NAME], [CA_SIZE_ID], [CA_SIZE_DETAIL], [CA_REGION_ID], [CA_REGION_NAME], [SUBJECT_GROUP], [NEW_CUS], 
                                              [Send_To_Board], [Authority], [EMP_REQUEST_ID], [EMP_REQUEST_NAME], [EMP_APPROVE1_ID], [EMP_APPROVE1_NAME], 
                                              [EMP_APPROVE2_ID], [EMP_APPROVE2_NAME], [EMP_APPROVE3_ID], [EMP_APPROVE3_NAME], [EMP_APPROVE4_ID], 
                                              [EMP_APPROVE4_NAME], [SUB_COMMITTEE_1], [EMP_SUB_COMM1_NAME], [SUB_COMMITTEE_2], [EMP_SUB_COMM2_NAME], 
                                              [SUB_COMMITTEE_3], [EMP_SUB_COMM3_NAME], ROW_NUMBER() OVER (PARTITION BY CIF
                       ORDER BY [LAST_PROCESS_MONTH] DESC) AS SEQ
FROM         [dbo].[V_018_APPROVE_CA_101_102_103_114_115]
WHERE     [SUBJECT_GROUP] = N'1_CREDIT') AS T
WHERE     SEQ = 1

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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_021_LAST_CREDIT_CA_APPROVE_ONLY_PLUS_ONLY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_021_LAST_CREDIT_CA_APPROVE_ONLY_PLUS_ONLY';

