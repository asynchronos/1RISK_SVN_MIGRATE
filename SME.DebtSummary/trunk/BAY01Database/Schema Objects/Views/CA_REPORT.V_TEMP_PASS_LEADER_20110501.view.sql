/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW CA_REPORT.V_TEMP_PASS_LEADER_20110501
AS
SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, SIZE_ID, SIZE_DETAIL, SUBJECT_GROUP, CIF, SUM_COUNT_DECB_RD, 
                      SUM_OLD_VALUE, SUM_REQUEST_VALUE_PLUS, SUM_REQUEST_VALUE_MINUS, SUM_CM_VALUE_PLUS, SUM_CM_VALUE_MINUS, 
                      SUM_APPROVE_VALUE_PLUS, SUM_APPROVE_VALUE_MINUS, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, LAST_PROCESS_EMP_ID, 
                      LAST_PROCESS_LEVEL_ID, LAST_PROCESS_LEVEL_NAME, ID_OUT, ID_OUT_CREATED_DATE, AUTHORITY_ID, AUTHORITY_DESC, 
                      EMP_REQUEST_ID, EMP_REQUEST_NAME, EMP_APPROVE1_ID, EMP_APPROVE1_NAME, EMP_APPROVE2_ID, EMP_APPROVE2_NAME, 
                      EMP_APPROVE3_ID, EMP_APPROVE3_NAME, EMP_APPROVE4_ID, EMP_APPROVE4_NAME, SUB_COMMITTEE_1_ID, EMP_SUB_COMM1_NAME, 
                      SUB_COMMITTEE_2_ID, EMP_SUB_COMM2_NAME, SUB_COMMITTEE_3_ID, EMP_SUB_COMM3_NAME, RM_ID, RM_NAME, BRANCH_ID, 
                      BRANCH_DESC, REGION_ID, REGION_DESC, GROUP_EXPOSURE, NEXT_REVIEW_DATE, PRODUCT_CODE, PROJECT_CODE, PROJECT_DESC, 
                      COVENANT_FLAG, COVENANT_DESC, DO_KFS_FLAG, DO_KFS_DESC, OUT_OF_SCOPE_ID, OUT_OF_SCOPE
FROM         CA_REPORT.V_014_CA_CIF_SUMMARY
WHERE     (ID_OUT_CREATED_DATE > CONVERT(datetime, '01/05/2011', 103))

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
         Begin Table = "V_014_CA_CIF_SUMMARY"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 268
               Right = 267
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_TEMP_PASS_LEADER_20110501';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_TEMP_PASS_LEADER_20110501';

