CREATE VIEW dbo.CreditFilter02_CreditAccount
AS
SELECT TOP (100) PERCENT dbo.ANNALS_CREDIT_ACCOUNT.ID, dbo.ANNALS_CREDIT_ACCOUNT.CIF, TB_MAIN_CIF.CIF AS MAIN_CIF, 
               dbo.ANNALS_CREDIT_ACCOUNT.ACCNO, dbo.ANNALS_SUBJECT.SUBJECT_ID, dbo.ANNALS_SUBJECT.SUBJECT, 
               dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL, 
               dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD AS OLD_VALUE, dbo.ANNALS_CREDIT_ACCOUNT.Value_Customer AS RM_VALUE, 
               dbo.ANNALS_CREDIT_ACCOUNT.VALUE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_APPROVE, dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID, 
               dbo.ANNALS_GL_TYPE.DECB_RD, dbo.ANNALS_GL_TYPE.GROUP_DECB_RD, dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID, 
               dbo.ANNALS_PROPOSAL.PROPOSAL_NAME
FROM  dbo.ANNALS_CREDIT_ACCOUNT INNER JOIN
               dbo.ANNALS_SUBJECT_DETAIL ON 
               dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID INNER JOIN
               dbo.ANNALS_SUBJECT ON dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID = dbo.ANNALS_SUBJECT.SUBJECT_ID INNER JOIN
                   (SELECT ID, CIF
                    FROM   (SELECT ID, CIF
                                    FROM   (SELECT ID, CIF, ROW_NUMBER() OVER (PARTITION BY ID
                                                    ORDER BY IDEN) SEQ
                                    FROM   dbo.ANNALS_CREDIT_ACCOUNT AS TMP2) AS TEMP3
                    WHERE SEQ = 1) AS TEMP4) AS TB_MAIN_CIF ON dbo.ANNALS_CREDIT_ACCOUNT.ID = TB_MAIN_CIF.ID INNER JOIN
dbo.ANNALS_GL_TYPE ON dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID = dbo.ANNALS_GL_TYPE.DECB_RD_ID LEFT OUTER JOIN
dbo.ANNALS_PROPOSAL ON dbo.ANNALS_CREDIT_ACCOUNT.PROPOSAL_ID = dbo.ANNALS_PROPOSAL.PROPOSAL_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[31] 2[11] 3) )"
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
         Configuration = "(H (1[60] 4) )"
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
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1716
         Width = 1500
         Width = 2232
         Width = 1572
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2676
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
         Alias = 2352
         Table = 2256
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter02_CreditAccount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter02_CreditAccount';

