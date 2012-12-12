CREATE VIEW [dbo].[V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP]
AS
SELECT OLD_ID, CA_CREATE_DATE, IS_CREDIT_UP, Authority_id, Authority, EMP_APPROVE_OR_REQUEST_ID, EMP_APPROVE_OR_REQUEST_NAME, 
                      EMP_APPROVE_LEVEL_ID, EMP_APPROVE_LEVEL_NAME, APPROVE_DATE, CIF, CA_NO_ID, LAST_PROCESS_EMP, LAST_PROCESS_LEVEL_ID, 
                      LAST_PROCESS_LEVEL_NAME, REGION_ID, Region_Name, OLD_REGION_ID, OLD_REGION, SIZE_IN_CA, CM_CODE, SIZE_BY_CM_STRUCTURE, 
                      SME_MIS_FINAL_SIZE
FROM (
SELECT     OLD_ID, CA_CREATE_DATE, IS_CREDIT_UP, Authority_id, Authority, EMP_APPROVE_OR_REQUEST_ID, EMP_APPROVE_OR_REQUEST_NAME, 
                      EMP_APPROVE_LEVEL_ID, EMP_APPROVE_LEVEL_NAME, APPROVE_DATE, CIF, CA_NO_ID, LAST_PROCESS_EMP, LAST_PROCESS_LEVEL_ID, 
                      LAST_PROCESS_LEVEL_NAME, REGION_ID, Region_Name, OLD_REGION_ID, OLD_REGION, SIZE_IN_CA, CM_CODE, SIZE_BY_CM_STRUCTURE, 
                      SME_MIS_FINAL_SIZE,ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY IS_CREDIT_UP DESC, APPROVE_DATE DESC) SEQ
FROM         dbo.V_028_ALL_APPROVE_CIF_CA_PRIORITY_BY_CREDIT_UP
) AS T
WHERE SEQ=1


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
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Begin Table = "V_028_ALL_APPROVE_CA_PRIORITY_BY_CREDIT_UP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 253
               Right = 298
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
      Begin ColumnWidths = 25
         Width = 284
         Width = 1500
         Width = 1995
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP';

