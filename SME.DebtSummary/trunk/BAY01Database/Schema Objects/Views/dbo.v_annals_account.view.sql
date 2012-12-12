CREATE VIEW dbo.v_annals_account
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CREDIT_ACCOUNT.IDEN, dbo.ANNALS_CREDIT_ACCOUNT.ID, dbo.ANNALS_CREDIT_ACCOUNT.CIF, 
                      dbo.ANNALS_CREDIT_ACCOUNT.ACCNO, CONVERT(nvarchar(20), dbo.ANNALS_CREDIT_ACCOUNT.Value_Customer) AS Value_Customer, 
                      CONVERT(nvarchar(20), dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD) AS VALUE_OLD, CONVERT(nvarchar(20), 
                      dbo.ANNALS_CREDIT_ACCOUNT.VALUE) AS VALUE, CONVERT(nvarchar(20), dbo.ANNALS_CREDIT_ACCOUNT.VALUE_APPROVE) AS VALUE_APPROVE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.Others, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL, 
                      dbo.ANNALS_GL_TYPE.DECB_RD, dbo.ANNALS_GL_TYPE.DECB_RD_ID, dbo.ANNALS_CREDIT_ACCOUNT.PRODUCT_CODE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.PROJECT_CODE, dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID, dbo.ANNALS_PROPOSAL.PROPOSAL_NAME, 
                      dbo.ANNALS_PROJECT.Project_Name, dbo.ANNALS_CREDIT_ACCOUNT.RM_ID
FROM         dbo.ANNALS_SUBJECT_DETAIL INNER JOIN
                      dbo.ANNALS_CREDIT_ACCOUNT ON 
                      dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID = dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID INNER JOIN
                      dbo.ANNALS_GL_TYPE ON dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID = dbo.ANNALS_GL_TYPE.DECB_RD_ID LEFT OUTER JOIN
                      dbo.ANNALS_PROJECT ON dbo.ANNALS_CREDIT_ACCOUNT.PROJECT_CODE = dbo.ANNALS_PROJECT.Project_Code LEFT OUTER JOIN
                      dbo.ANNALS_PROPOSAL ON dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID = dbo.ANNALS_PROPOSAL.PROPOSAL_ID
ORDER BY dbo.ANNALS_CREDIT_ACCOUNT.IDEN

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[9] 2[16] 3) )"
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
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 6
               Left = 32
               Bottom = 114
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_ACCOUNT"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 374
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ANNALS_GL_TYPE"
            Begin Extent = 
               Top = 10
               Left = 539
               Bottom = 213
               Right = 746
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROJECT"
            Begin Extent = 
               Top = 280
               Left = 21
               Bottom = 380
               Right = 173
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROPOSAL"
            Begin Extent = 
               Top = 230
               Left = 514
               Bottom = 345
               Right = 682
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
      Begin ColumnWidths = 10
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
      End
   End
   Begin CriteriaPane = 
      Begin C', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'olumnWidths = 11
         Column = 2430
         Alias = 1935
         Table = 2250
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_annals_account';

