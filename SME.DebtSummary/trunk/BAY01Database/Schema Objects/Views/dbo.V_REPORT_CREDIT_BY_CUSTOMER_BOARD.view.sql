CREATE VIEW dbo.V_REPORT_CREDIT_BY_CUSTOMER_BOARD
AS
SELECT     TOP (100) PERCENT ID, [APP-DATE], [REG-DATE], CIF, Project_Name, ACCNO, Value_Customer, VALUE_OLD, VALUE, VALUE_APPROVE, Others, 
                      SUBJECT_DETAIL_ID, SUBJECT_DETAIL, DECB_RD, DECB_RD_ID, PRODUCT_CODE, PROJECT_CODE, PROPOSAL_ID, PROPOSAL_NAME, 
                      CUSTOMER_NAME, GROUP_ID, CM_CODE, CM_NAME, BRANCH_ID, BRANCH_NAME, Id_Region, Region_Name, GROUP_SIZE_ID, 
                      GROUP_SIZE_DETAIL, JUDGEMENT_ID, JUDGEMENT_DETAIL, SIZE_ID, SIZE_DETAIL, PROCESS_GROUP, [EMP-ID], EMPLOYEE, [REGION-ID], 
                      REVIEW, EXCEPTION, APPROVE, EMP_APPROVE, EMP_APPROVE2, EMP_REQUEST, LEVEL_NAME, PROCESS_HEAD, REASON_REMARK, 
                      RESULT_REMARK, Send_To_Board, Authority
FROM         dbo.V_Report_Credit_By_Customer
WHERE     (PROCESS_HEAD = N'D') AND (SUBJECT_DETAIL_ID = N'111') OR
                      (SUBJECT_DETAIL_ID = N'113') OR
                      (SUBJECT_DETAIL_ID = N'116') OR
                      (SUBJECT_DETAIL_ID = N'201') OR
                      (SUBJECT_DETAIL_ID = N'202') OR
                      (SUBJECT_DETAIL_ID = N'301') OR
                      (SUBJECT_DETAIL_ID = N'307')
ORDER BY SUBJECT_DETAIL_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[18] 2[20] 3) )"
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
         Begin Table = "V_Report_Credit_By_Customer"
            Begin Extent = 
               Top = 25
               Left = 22
               Bottom = 229
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 39
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 50
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
         Width = 4575
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4020
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
      Begin ColumnWidths = 15
         Column = 1905
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_BOARD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1380
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_BOARD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER_BOARD';

