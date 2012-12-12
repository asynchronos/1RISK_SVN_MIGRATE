CREATE VIEW dbo.CreditFilter03_Credit_Account_Process
AS
SELECT     dbo.CreditFilter01_CreditMaxProcessDate.ID, dbo.CreditFilter01_CreditMaxProcessDate.ANNALS_TYPE, 
                      dbo.CreditFilter01_CreditMaxProcessDate.ANNALS_SEQ_NO, dbo.CreditFilter01_CreditMaxProcessDate.ANNALS_YEAR, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Undertaker, dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS UndertakerName, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_DATE, dbo.CreditFilter02_CreditAccount.CIF,
                       dbo.CreditFilter02_CreditAccount.MAIN_CIF, dbo.CreditFilter02_CreditAccount.ACCNO, dbo.CreditFilter02_CreditAccount.SUBJECT_ID, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT, dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL_ID, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL, dbo.CreditFilter01_CreditMaxProcessDate.ID_OUT, 
                      dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE_ID, dbo.CreditFilter01_CreditMaxProcessDate.EMP_REQUEST_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE2_ID, dbo.CreditFilter01_CreditMaxProcessDate.Send_To_Board, 
                      dbo.CreditFilter01_CreditMaxProcessDate.BOARD_ID, dbo.CreditFilter01_CreditMaxProcessDate.BOARD_Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.RM_ID, dbo.CreditFilter01_CreditMaxProcessDate.BRANCH_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.DEP_ID, dbo.CreditFilter01_CreditMaxProcessDate.Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.REGION_ID, dbo.CreditFilter01_CreditMaxProcessDate.Others2, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Result, dbo.CreditFilter02_CreditAccount.OLD_VALUE, dbo.CreditFilter02_CreditAccount.RM_VALUE, 
                      dbo.CreditFilter02_CreditAccount.VALUE, dbo.CreditFilter02_CreditAccount.VALUE_APPROVE, 
                      dbo.CreditFilter01_CreditMaxProcessDate.CM_Judgement, dbo.Id_Region.Region_Name, 
                      dbo.CreditFilter01_CreditMaxProcessDate.CM_Judgement_Board, dbo.CreditFilter01_CreditMaxProcessDate.CM_Remark, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Comment, dbo.CreditFilter01_CreditMaxProcessDate.Reason, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Reason2, dbo.CreditFilter01_CreditMaxProcessDate.Job_Type_Id, 
                      dbo.CreditFilter01_CreditMaxProcessDate.COVENANT_FLAG, dbo.CreditFilter02_CreditAccount.PROPOSAL_NAME
FROM         dbo.CreditFilter02_CreditAccount INNER JOIN
                      dbo.CreditFilter01_CreditMaxProcessDate ON dbo.CreditFilter02_CreditAccount.ID = dbo.CreditFilter01_CreditMaxProcessDate.ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.CreditFilter01_CreditMaxProcessDate.Undertaker = dbo.TB_EMPLOYEE.EMP_ID INNER JOIN
                      dbo.Id_Region ON dbo.CreditFilter01_CreditMaxProcessDate.REGION_ID = dbo.Id_Region.Id_Region

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[9] 2[50] 3) )"
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
         Configuration = "(H (1[75] 4) )"
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
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CreditFilter01_CreditMaxProcessDate"
            Begin Extent = 
               Top = 0
               Left = 454
               Bottom = 252
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 60
               Left = 244
               Bottom = 212
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 33
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 233
               Left = 261
               Bottom = 348
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CreditFilter02_CreditAccount"
            Begin Extent = 
               Top = 5
               Left = 38
               Bottom = 380
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
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
         Width = 3330
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 15', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter03_Credit_Account_Process';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'00
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
         Column = 4215
         Alias = 900
         Table = 2805
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter03_Credit_Account_Process';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CreditFilter03_Credit_Account_Process';

