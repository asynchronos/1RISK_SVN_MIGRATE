CREATE VIEW [dbo].[V_REPORT_CREDIT_BY_CUSTOMER]
AS
SELECT     T.ID, T.[APP-DATE], T.[REG-DATE], dbo.v_annals_account.CIF, dbo.v_annals_account.Project_Name, dbo.v_annals_account.ACCNO, 
                      dbo.v_annals_account.Value_Customer, dbo.v_annals_account.VALUE_OLD, dbo.v_annals_account.VALUE, dbo.v_annals_account.VALUE_APPROVE, 
                      dbo.v_annals_account.Others, dbo.v_annals_account.SUBJECT_DETAIL_ID, dbo.v_annals_account.SUBJECT_DETAIL, 
                      dbo.v_annals_account.DECB_RD, dbo.v_annals_account.DECB_RD_ID, dbo.v_annals_account.PRODUCT_CODE, 
                      dbo.v_annals_account.PROJECT_CODE, dbo.v_annals_account.PROPOSAL_ID, dbo.v_annals_account.PROPOSAL_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CUSTOMER_NAME, dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_ID, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE, dbo.CUSTOMER_SME00_ALL_STATUS.CM_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.BRANCH_ID, dbo.CUSTOMER_SME00_ALL_STATUS.BRANCH_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.Id_Region, dbo.CUSTOMER_SME00_ALL_STATUS.Region_Name, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_ID, dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_DETAIL, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.JUDGEMENT_ID, dbo.CUSTOMER_SME00_ALL_STATUS.JUDGEMENT_DETAIL, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.SIZE_ID, dbo.CUSTOMER_SME00_ALL_STATUS.SIZE_DETAIL, T.PROCESS_GROUP, T.[EMP-ID], T.EMPLOYEE, 
                      T.[REGION-ID], T.REVIEW, T.EXCEPTION, T.APPROVE, T.EMP_APPROVE, T.EMP_APPROVE2, T.EMP_REQUEST, T.LEVEL_NAME, T.PROCESS_HEAD, 
                      T.REASON_REMARK, T.RESULT_REMARK, T.Send_To_Board, T.Authority
FROM         dbo.v_annals_account LEFT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS ON dbo.v_annals_account.CIF = dbo.CUSTOMER_SME00_ALL_STATUS.CIF RIGHT OUTER JOIN
                      dbo.TEMP_REPORT_PRODUCT AS T ON dbo.v_annals_account.ID = T.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[27] 2[27] 3) )"
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
         Begin Table = "v_annals_account"
            Begin Extent = 
               Top = 14
               Left = 246
               Bottom = 277
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 13
               Left = 459
               Bottom = 271
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 30
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 299
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 38
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 58
         Width = 284
         Width = 1275
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2640
         Width = 2145
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
         W', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'idth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2250
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
         Column = 1755
         Alias = 2790
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_BY_CUSTOMER';

