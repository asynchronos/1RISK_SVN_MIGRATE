﻿CREATE VIEW dbo.CreditFilter01_CreditMaxProcessDate
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CREDIT.ID, dbo.ANNALS_CREDIT.ANNALS_TYPE, dbo.ANNALS_CREDIT.ANNALS_SEQ_NO, 
                      dbo.ANNALS_CREDIT.ANNALS_YEAR, dbo.ANNALS_CREDIT_PROCESS.EMP_ID AS Undertaker, dbo.ANNALS_PROCESS.PROCESS_ID, 
                      dbo.ANNALS_PROCESS.PROCESS, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.ANNALS_CREDIT.ID_OUT, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE_ID, dbo.ANNALS_CREDIT.EMP_REQUEST_ID, dbo.ANNALS_CREDIT.EMP_APPROVE2_ID, 
                      dbo.ANNALS_CREDIT.Send_To_Board, dbo.ANNALS_CREDIT.BOARD_ID, dbo.ANNALS_CREDIT.BOARD_Others, dbo.ANNALS_CREDIT.RM_ID, 
                      dbo.ANNALS_CREDIT.BRANCH_ID, dbo.ANNALS_CREDIT.DEP_ID, dbo.ANNALS_CREDIT.Others, dbo.ANNALS_CREDIT.REGION_ID, 
                      dbo.ANNALS_CREDIT.Others2, dbo.ANNALS_CREDIT.Result, dbo.ANNALS_PROCESS.PROCESS_GROUP, dbo.ANNALS_CREDIT.CM_Judgement, 
                      dbo.ANNALS_CREDIT.CM_Judgement_Board, dbo.ANNALS_CREDIT.CM_Remark, dbo.ANNALS_CREDIT.Comment, dbo.ANNALS_CREDIT.Reason, 
                      dbo.ANNALS_CREDIT.Reason2, dbo.ANNALS_CREDIT.Job_Type_Id, dbo.ANNALS_CREDIT.COVENANT_FLAG
FROM         dbo.ANNALS_CREDIT INNER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON dbo.ANNALS_CREDIT.ID = dbo.ANNALS_CREDIT_PROCESS.ID INNER JOIN
                      dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID
WHERE     (dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE =
                          (SELECT     MAX(PROCESS_DATE) AS Expr1
                            FROM          dbo.ANNALS_CREDIT_PROCESS AS TMP
                            WHERE      (ID = dbo.ANNALS_CREDIT.ID)))
ORDER BY dbo.ANNALS_CREDIT.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[16] 2[4] 3) )"
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
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 0
               Left = 72
               Bottom = 279
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "ANNALS_CREDIT_PROCESS"
            Begin Extent = 
               Top = 15
               Left = 323
               Bottom = 204
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 15
               Left = 506
               Bottom = 130
               Right = 674
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
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4425
         Width = 1575
         Width = 1500
         Width = 4245
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
         Column = 1440
         Alias = 1005
         Table = 2205
         Output = 720
         Append = 1400
         NewValue =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter01_CreditMaxProcessDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 12165
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter01_CreditMaxProcessDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter01_CreditMaxProcessDate';

