CREATE VIEW dbo.Class_2008_06
AS
SELECT     TOP (100) PERCENT dbo.CreditFilter01_CreditMaxProcessDate.ID, dbo.CreditFilter02_CreditAccount.MAIN_CIF, dbo.CreditFilter02_CreditAccount.CIF, 
                      dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, dbo.CreditFilter02_CreditAccount.ACCNO, 
                      dbo.Cif_Class.Class5106, dbo.CreditFilter01_CreditMaxProcessDate.BRANCH_ID, dbo.CreditFilter01_CreditMaxProcessDate.REGION_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Undertaker, dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS UndertakerName, 
                      dbo.Controlling_Level.LEVEL_NAME, dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.EMP_REQUEST_ID, dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE2_ID, 
                      dbo.CUSTOMER.BUSI_TYPE, dbo.Bus_Type.Bus_TypeD, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_ID, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_DATE, dbo.CreditFilter01_CreditMaxProcessDate.CM_Judgement, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT_ID, dbo.CreditFilter02_CreditAccount.SUBJECT, dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL_ID, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL, dbo.CreditFilter01_CreditMaxProcessDate.BOARD_Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.DEP_ID, dbo.CreditFilter01_CreditMaxProcessDate.Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Others2, dbo.CreditFilter01_CreditMaxProcessDate.Result, dbo.CreditFilter02_CreditAccount.VALUE, 
                      dbo.CreditFilter02_CreditAccount.VALUE_APPROVE
FROM         dbo.Controlling_UsersInLevel LEFT OUTER JOIN
                      dbo.Controlling_Level ON dbo.Controlling_UsersInLevel.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID RIGHT OUTER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_1 ON dbo.Controlling_UsersInLevel.EMP_ID = TB_EMPLOYEE_1.EMP_ID RIGHT OUTER JOIN
                      dbo.CreditFilter02_CreditAccount INNER JOIN
                      dbo.CreditFilter01_CreditMaxProcessDate ON dbo.CreditFilter02_CreditAccount.ID = dbo.CreditFilter01_CreditMaxProcessDate.ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.CreditFilter01_CreditMaxProcessDate.Undertaker = dbo.TB_EMPLOYEE.EMP_ID ON 
                      TB_EMPLOYEE_1.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID LEFT OUTER JOIN
                      dbo.Cif_Class RIGHT OUTER JOIN
                      dbo.Bus_Type INNER JOIN
                      dbo.CUSTOMER ON dbo.Bus_Type.Id_Bus_Type = dbo.CUSTOMER.BUSI_TYPE ON dbo.Cif_Class.Cif_No = dbo.CUSTOMER.CIF ON 
                      dbo.CreditFilter02_CreditAccount.CIF = dbo.CUSTOMER.CIF
WHERE     (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'c') OR
                      (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'd') OR
                      (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'e')
ORDER BY dbo.CreditFilter01_CreditMaxProcessDate.ANNALS_SEQ_NO

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[9] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[52] 4[23] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
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
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 6
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CreditFilter02_CreditAccount"
            Begin Extent = 
               Top = 159
               Left = 17
               Bottom = 274
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CreditFilter01_CreditMaxProcessDate"
            Begin Extent = 
               Top = 155
               Left = 238
               Bottom = 292
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 126
               Left = 472
               Bottom = 306
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cif_Class"
            Begin Extent = 
               Top = 2
               Left = 475
               Bottom = 117
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bus_Type"
            Begin Extent = 
               Top = 31
               Left = 252
               Bottom = 146
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 1
               Left = 16
               Bottom = 141
               Right = 168
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 9
               Left = 919
               Bottom', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Class_2008_06';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 124
               Right = 1071
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_UsersInLevel"
            Begin Extent = 
               Top = 0
               Left = 677
               Bottom = 85
               Right = 829
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_1"
            Begin Extent = 
               Top = 160
               Left = 674
               Bottom = 275
               Right = 839
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
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 43
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1110
         Width = 1500
         Width = 1545
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1830
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
         Width = 1845
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
         Column = 5520
         Alias = 1815
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Class_2008_06';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Class_2008_06';

