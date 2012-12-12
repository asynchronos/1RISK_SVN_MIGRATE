CREATE VIEW dbo.CreditFilter05_FULL_CA_WITH_CUSTOMER
AS
SELECT     dbo.CreditFilter04_Credit_Account_Process_Viewer.ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.ANNALS_TYPE, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.ANNALS_SEQ_NO, dbo.CreditFilter04_Credit_Account_Process_Viewer.ANNALS_YEAR, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.Viewer, dbo.CreditFilter04_Credit_Account_Process_Viewer.Undertaker, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.UndertakerName, dbo.CreditFilter04_Credit_Account_Process_Viewer.PROCESS_GROUP, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.PROCESS_ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.PROCESS, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.PROCESS_DATE, dbo.CreditFilter04_Credit_Account_Process_Viewer.CIF, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.MAIN_CIF, ISNULL(dbo.CUSTOMER.CUS_TITLE, N'') + ISNULL(dbo.CUSTOMER.CUS_FIRST, N'') 
                      + N'  ' + ISNULL(dbo.CUSTOMER.CUS_LAST, N'') AS MAIN_CIF_NAME, dbo.CreditFilter04_Credit_Account_Process_Viewer.ACCNO, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.SUBJECT_ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.SUBJECT, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.SUBJECT_DETAIL_ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.SUBJECT_DETAIL, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.ID_OUT, dbo.CreditFilter04_Credit_Account_Process_Viewer.EMP_APPROVE_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.EMP_REQUEST_ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.EMP_APPROVE2_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.Send_To_Board, dbo.CreditFilter04_Credit_Account_Process_Viewer.BOARD_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.BOARD_Others, dbo.CreditFilter04_Credit_Account_Process_Viewer.RM_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.BRANCH_ID, dbo.CreditFilter04_Credit_Account_Process_Viewer.DEP_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.Others, dbo.CreditFilter04_Credit_Account_Process_Viewer.REGION_ID, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.Others2, dbo.CreditFilter04_Credit_Account_Process_Viewer.Result, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.CM_Judgement, dbo.CreditFilter04_Credit_Account_Process_Viewer.OLD_VALUE, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.RM_VALUE, dbo.CreditFilter04_Credit_Account_Process_Viewer.VALUE, 
                      dbo.CreditFilter04_Credit_Account_Process_Viewer.VALUE_APPROVE, dbo.CreditFilter04_Credit_Account_Process_Viewer.COVENANT_FLAG
FROM         dbo.CreditFilter04_Credit_Account_Process_Viewer INNER JOIN
                      dbo.CUSTOMER ON dbo.CreditFilter04_Credit_Account_Process_Viewer.MAIN_CIF = dbo.CUSTOMER.CIF

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
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 121
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CreditFilter04_Credit_Account_Process_Viewer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 213
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 28
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 36
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
         Column = 5505
         Alias = 1515
         Table = 4755
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         Sor', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter05_FULL_CA_WITH_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'tOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter05_FULL_CA_WITH_CUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter05_FULL_CA_WITH_CUSTOMER';

