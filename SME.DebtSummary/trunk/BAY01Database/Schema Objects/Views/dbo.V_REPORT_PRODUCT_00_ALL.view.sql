CREATE VIEW dbo.V_REPORT_PRODUCT_00_ALL
AS
SELECT     TOP (100) PERCENT dbo.V_REPORT_PRODUCT_01_CREDIT.ID, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.BEGIN_DATE AS [REG-DATE], 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.LAST_DATE AS [APP-DATE], dbo.V_REPORT_PRODUCT_03_CUSTOMER.CIF, 
                      dbo.V_REPORT_PRODUCT_03_CUSTOMER.CUSTOMER, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.EMP_ID AS [EMP-ID], 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.EMPLOYEE, dbo.V_REPORT_PRODUCT_01_CREDIT.[BRANCH-ID], 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.[BRANCH-NAME], dbo.V_REPORT_PRODUCT_01_CREDIT.[REGION-ID], 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.[REGION-NAME], dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.NEW, 
                      dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.OLD, dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.REVIEW, 
                      dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.EXCEPTION, dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.CREDIT AS APPROVE, 
                      CASE WHEN process_group = 'D' THEN OD_INCREASE_VALUE_APPROVE ELSE OD_INCREASE_VALUE_CUSTOMER END AS [O-D], 
                      CASE WHEN process_group = 'D' THEN OD_DECREASE_VALUE_APPROVE ELSE OD_DECREASE_VALUE_CUSTOMER END AS [(O-D)], 
                      CASE WHEN process_group = 'D' THEN TL_INCREASE_VALUE_APPROVE ELSE TL_INCREASE_VALUE_CUSTOMER END AS [F-L], 
                      CASE WHEN process_group = 'D' THEN TL_DECREASE_VALUE_APPROVE ELSE TL_DECREASE_VALUE_CUSTOMER END AS [(F-L)], 
                      CASE WHEN process_group = 'D' THEN LG_INCREASE_VALUE_APPROVE ELSE LG_INCREASE_VALUE_CUSTOMER END AS [L-G], 
                      CASE WHEN process_group = 'D' THEN LG_DECREASE_VALUE_APPROVE ELSE LG_DECREASE_VALUE_CUSTOMER END AS [(L-G)], 
                      CASE WHEN process_group = 'D' THEN PN_INCREASE_VALUE_APPROVE ELSE PN_INCREASE_VALUE_CUSTOMER END AS [STL-PN], 
                      CASE WHEN process_group = 'D' THEN PN_DECREASE_VALUE_APPROVE ELSE PN_DECREASE_VALUE_CUSTOMER END AS [(STL-PN)], 
                      CASE WHEN process_group = 'D' THEN FN_INCREASE_VALUE_APPROVE ELSE FN_INCREASE_VALUE_CUSTOMER END AS [TRADE-FIN], 
                      CASE WHEN process_group = 'D' THEN FN_DECREASE_VALUE_APPROVE ELSE FN_DECREASE_VALUE_CUSTOMER END AS [(TRADE-FIN)], 
                      CASE WHEN process_group = 'D' THEN OTHER_INCREASE_VALUE_APPROVE ELSE OTHER_INCREASE_VALUE_CUSTOMER END AS OTHERS, 
                      CASE WHEN process_group = 'D' THEN OTHER_DECREASE_VALUE_APPROVE ELSE OTHER_DECREASE_VALUE_CUSTOMER END AS [(OTHERS)], 
                      CASE WHEN process_group = 'D' THEN ALL_INCREASE_VALUE_APPROVE ELSE ALL_INCREASE_VALUE_CUSTOMER END AS [SUM-INCREASE], 
                      CASE WHEN process_group = 'D' THEN ALL_DECREASE_VALUE_APPROVE ELSE ALL_DECREASE_VALUE_CUSTOMER END AS [SUM-DECREASE], 
                      CASE WHEN process_group = 'D' THEN ALL_INCREASE_VALUE_APPROVE - ALL_DECREASE_VALUE_APPROVE ELSE ALL_INCREASE_VALUE_CUSTOMER
                       - ALL_DECREASE_VALUE_CUSTOMER END AS NET, 
                      CASE WHEN process_group = 'D' THEN ALL_INCREASE_VALUE_APPROVE ELSE ALL_INCREASE_VALUE_CUSTOMER END AS [SUM-RM_VALUE], 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.PEOCESS_HEAD AS PROCESS_HEAD, 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.PROCESS_GROUP, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.PROCESS, 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.TTY, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.PAT, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.[APP-TYPE], dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.LEVEL_NAME, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.Job_Type, dbo.V_REPORT_PRODUCT_01_CREDIT.Authority, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.REFERRAL_NO, dbo.V_REPORT_PRODUCT_01_CREDIT.REFERENCE, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.Board, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.LEVEL_PROCESS_ID, 
                      dbo.V_REPORT_PRODUCT_03_CUSTOMER.BUSINESS_ID, dbo.V_REPORT_PRODUCT_03_CUSTOMER.BUSINESS_TYPE, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.Customer_Size, dbo.V_REPORT_PRODUCT_01_CREDIT.SIZE_DETAIL, CASE WHEN Send_To_Board = 'True' OR
                      Send_To_Board = '1' THEN reason2 ELSE reason END AS REASON_REMARK, CASE WHEN Send_To_Board = 'True' OR
                      Send_To_Board = '1' THEN CM_Remark ELSE dbo.V_REPORT_PRODUCT_01_CREDIT.Others END AS RESULT_REMARK, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE, dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE2, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE3, dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE4, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_REQUEST, dbo.V_REPORT_PRODUCT_03_CUSTOMER.grp_lim AS LIM_AMT, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.Send_To_Board, dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.PROCESS_ID, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE_ID, dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE2_ID, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE3_ID, dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_APPROVE4_ID, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.EMP_REQUEST_ID, dbo.V_REPORT_PRODUCT_01_CREDIT.OUT_OF_SCOPE_ID, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.OUT_OF_SCOPE, dbo.V_REPORT_PRODUCT_01_CREDIT.GROUP_EXPOSURE, 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.REVIEW_DATE
FROM         dbo.V_REPORT_PRODUCT_01_CREDIT INNER JOIN
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST ON 
                      dbo.V_REPORT_PRODUCT_01_CREDIT.NEW_ID = dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.NEW_ID INNER JOIN
                      dbo.V_REPORT_PRODUCT_03_CUSTOMER ON 
                      dbo.V_REPORT_PRODUCT_02_PROCESS_LAST.NEW_ID = dbo.V_REPORT_PRODUCT_03_CUSTOMER.NEW_ID INNER JOIN
                      dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE ON 
                      dbo.V_REPORT_PRODUCT_03_CUSTOMER.NEW_ID = dbo.V_REPORT_PRODUCT_04_ACCOUNT_VALUE.NEW_ID
ORDER BY dbo.V_REPORT_PRODUCT_01_CREDIT.NEW_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[18] 2[22] 3) )"
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
         Begin Table = "V_REPORT_PRODUCT_01_CREDIT"
            Begin Extent = 
               Top = 11
               Left = 33
               Bottom = 291
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 33
         End
         Begin Table = "V_REPORT_PRODUCT_02_PROCESS_LAST"
            Begin Extent = 
               Top = 11
               Left = 282
               Bottom = 285
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_03_CUSTOMER"
            Begin Extent = 
               Top = 10
               Left = 496
               Bottom = 280
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_REPORT_PRODUCT_04_ACCOUNT_VALUE"
            Begin Extent = 
               Top = 7
               Left = 684
               Bottom = 272
               Right = 955
            End
            DisplayFlags = 280
            TopColumn = 29
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 93
         Width = 284
         Width = 1395
         Width = 2025
         Width = 1575
         Width = 1500
         Width = 1620
         Width = 1500
         Width = 1245
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_00_ALL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
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
         Width = 900
         Width = 1500
         Width = 2730
         Width = 2340
         Width = 1500
         Width = 2865
         Width = 1500
         Width = 2895
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3210
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 5775
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
      Begin ColumnWidths = 11
         Column = 7890
         Alias = 2340
         Table = 3945
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_00_ALL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_00_ALL';

