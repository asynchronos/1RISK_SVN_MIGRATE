CREATE VIEW CA_REPORT.V_002_ANNALS_CREDIT_SUBJECT
AS
SELECT A.OLD_ID, A.CA_NO_ID, A.CA_CREATE_DATE, A.REFERENCE, A.REFERENCE_DATE, dbo.ANNALS_CREDIT_ACCOUNT.IDEN AS SUBJECT_IDEN, 
               dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID, 
               CASE dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID WHEN '01' THEN '1_CREDIT' WHEN '07' THEN '2_REVIEW' ELSE '3_OTHER' END AS SUBJECT_GROUP,
                dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION, dbo.ANNALS_CREDIT_ACCOUNT.CIF, 
               dbo.ANNALS_CREDIT_ACCOUNT.ACCNO, dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID, dbo.ANNALS_GL_TYPE.DECB_RD, 
               dbo.ANNALS_GL_TYPE.CASHTYPE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD AS OLD_VALUE, 
               CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) * Value_Customer ELSE Value_Customer END AS RM_VALUE, 
               CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) * VALUE ELSE VALUE END AS CM_VALUE, 
               CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) 
               * VALUE_APPROVE ELSE VALUE_APPROVE END AS APPROVE_VALUE, A.Customer_Size AS SIZE_ID, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, 
               A.Send_To_Board, A.Authority, A.EMP_REQUEST_ID, A.EMP_REQUEST_NAME, A.EMP_APPROVE_ID, A.EMP_APPROVE1_NAME, 
               A.EMP_APPROVE2_ID, A.EMP_APPROVE2_NAME, A.EMP_APPROVE3_ID, A.EMP_APPROVE3_NAME, A.EMP_APPROVE4_ID, 
               A.EMP_APPROVE4_NAME, dbo.ANNALS_CREDIT_ACCOUNT.PRODUCT_CODE, dbo.ANNALS_CREDIT_ACCOUNT.PROJECT_CODE, 
               A.SUB_COMMITTEE_1, A.EMP_SUB_COMM1_NAME, A.SUB_COMMITTEE_2, A.EMP_SUB_COMM2_NAME, A.SUB_COMMITTEE_3, 
               A.EMP_SUB_COMM3_NAME, A.RM_ID, A.COVENANT_FLAG, A.DO_KFS_FLAG, A.OUT_OF_SCOPE_ID, A.GROUP_EXPOSURE, A.REVIEW_DATE, 
               A.ID_OUT, A.BRANCH_ID, A.BRANCH_DESC, A.REGION_ID, A.REGION_DESC, A.EMP_CONTROL, dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID, 
               dbo.ANNALS_PROPOSAL.PROPOSAL_NAME
FROM  dbo.ANNALS_CREDIT_ACCOUNT LEFT OUTER JOIN
               dbo.ANNALS_PROPOSAL ON dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID = dbo.ANNALS_PROPOSAL.PROPOSAL_ID RIGHT OUTER JOIN
               CA_REPORT.V_001_ANNALS_CREDIT AS A ON dbo.ANNALS_CREDIT_ACCOUNT.ID = A.OLD_ID LEFT OUTER JOIN
               dbo.CUSTOMER_SME_SIZE ON A.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
               dbo.ANNALS_SUBJECT_DETAIL ON 
               dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
               dbo.ANNALS_GL_TYPE ON dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID = dbo.ANNALS_GL_TYPE.DECB_RD_ID

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
         Begin Table = "ANNALS_CREDIT_ACCOUNT"
            Begin Extent = 
               Top = 8
               Left = 331
               Bottom = 144
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 32
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 22
               Left = 587
               Bottom = 140
               Right = 761
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 147
               Left = 48
               Bottom = 283
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_GL_TYPE"
            Begin Extent = 
               Top = 287
               Left = 48
               Bottom = 423
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROPOSAL"
            Begin Extent = 
               Top = 5
               Left = 785
               Bottom = 141
               Right = 972
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
      Begin ColumnWidths = 51
         Width = 284', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_002_ANNALS_CREDIT_SUBJECT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1332
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_002_ANNALS_CREDIT_SUBJECT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_002_ANNALS_CREDIT_SUBJECT';

