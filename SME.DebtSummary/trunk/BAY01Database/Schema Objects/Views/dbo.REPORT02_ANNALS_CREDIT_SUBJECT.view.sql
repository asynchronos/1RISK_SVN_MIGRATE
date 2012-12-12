CREATE VIEW dbo.REPORT02_ANNALS_CREDIT_SUBJECT
AS
SELECT     dbo.REPORT01_ANNALS_CREDIT.OLD_ID, dbo.REPORT01_ANNALS_CREDIT.CA_NO_ID, dbo.REPORT01_ANNALS_CREDIT.CA_CREATE_DATE, 
                      dbo.REPORT01_ANNALS_CREDIT.REFERENCE, dbo.REPORT01_ANNALS_CREDIT.REFERENCE_DATE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.IDEN AS SUBJECT_IDEN, dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID, 
                      dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION, dbo.ANNALS_CREDIT_ACCOUNT.CIF, 
                      dbo.ANNALS_CREDIT_ACCOUNT.ACCNO, dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID, dbo.ANNALS_GL_TYPE.DECB_RD, 
                      dbo.ANNALS_GL_TYPE.CASHTYPE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD AS OLD_VALUE, 
                      CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) * Value_Customer ELSE Value_Customer END AS RM_VALUE, 
                      CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) * VALUE ELSE VALUE END AS CM_VALUE, 
                      CASE WHEN dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION = (- 1) THEN (- 1) * VALUE_APPROVE ELSE VALUE_APPROVE END AS APPROVE_VALUE,
                       dbo.REPORT01_ANNALS_CREDIT.Customer_Size, dbo.REPORT01_ANNALS_CREDIT.RECIVER, dbo.REPORT01_ANNALS_CREDIT.Send_To_Board, 
                      dbo.REPORT01_ANNALS_CREDIT.Authority, dbo.REPORT01_ANNALS_CREDIT.EMP_REQUEST_ID, 
                      dbo.REPORT01_ANNALS_CREDIT.EMP_REQUEST_NAME, dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE_ID, 
                      dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE1_NAME, dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE2_ID, 
                      dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE2_NAME, dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE3_ID, 
                      dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE3_NAME, dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE4_ID, 
                      dbo.REPORT01_ANNALS_CREDIT.EMP_APPROVE4_NAME, dbo.ANNALS_CREDIT_ACCOUNT.PRODUCT_CODE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.PROJECT_CODE, dbo.REPORT01_ANNALS_CREDIT.REGION_ID, dbo.REPORT01_ANNALS_CREDIT.Region_Name, 
                      dbo.REPORT01_ANNALS_CREDIT.SUB_COMMITTEE_1, dbo.REPORT01_ANNALS_CREDIT.EMP_SUB_COMM1_NAME, 
                      dbo.REPORT01_ANNALS_CREDIT.SUB_COMMITTEE_2, dbo.REPORT01_ANNALS_CREDIT.EMP_SUB_COMM2_NAME, 
                      dbo.REPORT01_ANNALS_CREDIT.SUB_COMMITTEE_3, dbo.REPORT01_ANNALS_CREDIT.EMP_SUB_COMM3_NAME, 
                      dbo.REPORT01_ANNALS_CREDIT.BRANCH_ID
FROM         dbo.ANNALS_CREDIT_ACCOUNT INNER JOIN
                      dbo.REPORT01_ANNALS_CREDIT ON dbo.ANNALS_CREDIT_ACCOUNT.ID = dbo.REPORT01_ANNALS_CREDIT.OLD_ID LEFT OUTER JOIN
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
               Top = 57
               Left = 250
               Bottom = 172
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT01_ANNALS_CREDIT"
            Begin Extent = 
               Top = 0
               Left = 24
               Bottom = 115
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 125
               Left = 29
               Bottom = 240
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ANNALS_GL_TYPE"
            Begin Extent = 
               Top = 0
               Left = 459
               Bottom = 115
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 42
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1950
         Width = 1215
         Width = 1755
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
         Width = 150', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT02_ANNALS_CREDIT_SUBJECT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'0
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
         Column = 9585
         Alias = 1530
         Table = 2310
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT02_ANNALS_CREDIT_SUBJECT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT02_ANNALS_CREDIT_SUBJECT';

