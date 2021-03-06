CREATE VIEW dbo.REPORT65_CIF_PASS_LEADER_LEADER1
AS
SELECT     CIF, CA_NO_ID, CA_CREATE_DATE, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, LAST_PROCESS_ID, LAST_PROCESS, LAST_PROCESS_DATE, EMP_ID, 
                      LEVEL_ID, LEVEL_NAME
FROM         (SELECT     ROW_NUMBER() OVER (PARTITION BY CIF
                       ORDER BY LAST_PROCESS_DATE DESC) AS SEQ, CIF, CA_NO_ID, CA_CREATE_DATE, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, LAST_PROCESS_ID, 
                      LAST_PROCESS, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME
FROM         (SELECT     CIF, CA_NO_ID, CA_CREATE_DATE, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, LAST_PROCESS_ID, LAST_PROCESS, LAST_PROCESS_DATE, 
                                              EMP_ID, LEVEL_ID, LEVEL_NAME
                       FROM          dbo.CUSTOMER_SME_LAST_CA
                       UNION ALL
                       SELECT     CIF, CA_ID, CA_CREATE_DATE, ID_SUBJECT, SUBJECT_DETAIL, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, LEAD_ID, GROUP_ID, 
                                             GROUP_NAME
                       FROM         dbo.V_CA_FROM_LEADER_SME02_01_LAST_CA) AS ALL_CA) ALL_CA_WITH_SEQ
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
         Configuration = "(H (2[50] 3) )"
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
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1665
         Width = 1665
         Width = 1710
         Width = 1500
         Width = 1590
         Width = 1500
         Width = 1815
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
      PaneHidden = 
      Begin ColumnWidths = 5
         Column = 1815
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT65_CIF_PASS_LEADER_LEADER1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT65_CIF_PASS_LEADER_LEADER1';

