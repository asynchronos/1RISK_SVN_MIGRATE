CREATE VIEW dbo.V_Report_Approve
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CREDIT.ID, dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, 
                      dbo.ANNALS_CREDIT_PROCESS.EMP_ID, dbo.TB_EMPLOYEE.EMPNAME, dbo.TB_EMPLOYEE.EMPSURNAME, dbo.ANNALS_PROCESS.PROCESS_ID, 
                      dbo.ANNALS_PROCESS.PROCESS, dbo.ANNALS_GL_TYPE.DECB_RD, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_APPROVE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.VALUE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD, dbo.ANNALS_CREDIT_ACCOUNT.Value_Customer, 
                      dbo.ANNALS_PROCESS.PROCESS_GROUP, dbo.ANNALS_GL_TYPE.DECB_RD_ID, dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID, 
                      dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.Id_Branch.Id_Branch, 
                      dbo.Id_Branch.Branch_T, dbo.Id_Region.Id_Region, dbo.Id_Region.Region_Name, dbo.TB_TITLE.TITLE_NAME, dbo.ANNALS_CREDIT.Result, 
                      ANNALS_PROCESS_1.PROCESS_GROUP AS Result_Board
FROM         dbo.TB_TITLE INNER JOIN
                      dbo.ANNALS_CREDIT INNER JOIN
                      dbo.TB_EMPLOYEE INNER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON dbo.TB_EMPLOYEE.EMP_ID = dbo.ANNALS_CREDIT_PROCESS.EMP_ID INNER JOIN
                      dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID ON 
                      dbo.ANNALS_CREDIT.ID = dbo.ANNALS_CREDIT_PROCESS.ID INNER JOIN
                      dbo.ANNALS_GL_TYPE INNER JOIN
                      dbo.ANNALS_CREDIT_ACCOUNT ON dbo.ANNALS_GL_TYPE.DECB_RD_ID = dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID ON 
                      dbo.ANNALS_CREDIT.ID = dbo.ANNALS_CREDIT_ACCOUNT.ID INNER JOIN
                      dbo.CUSTOMER ON dbo.ANNALS_CREDIT_ACCOUNT.CIF = dbo.CUSTOMER.CIF INNER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL ON dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID ON 
                      dbo.TB_TITLE.TITLE_CODE = dbo.TB_EMPLOYEE.TITLE_CODE LEFT OUTER JOIN
                      dbo.ANNALS_PROCESS AS ANNALS_PROCESS_1 ON dbo.ANNALS_CREDIT.Result = ANNALS_PROCESS_1.PROCESS_ID LEFT OUTER JOIN
                      dbo.Id_Region INNER JOIN
                      dbo.Id_Branch ON dbo.Id_Region.Id_Region = dbo.Id_Branch.Id_Region ON dbo.ANNALS_CREDIT.BRANCH_ID = dbo.Id_Branch.Id_Branch
WHERE     (dbo.ANNALS_PROCESS.PROCESS_GROUP = 'D') OR
                      (ANNALS_PROCESS_1.PROCESS_GROUP = 'D')
ORDER BY dbo.ANNALS_CREDIT.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[4] 2[22] 3) )"
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
         Top = -621
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 106
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 230
               Bottom = 121
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 108
               Left = 38
               Bottom = 223
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_PROCESS"
            Begin Extent = 
               Top = 126
               Left = 241
               Bottom = 241
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 228
               Left = 38
               Bottom = 343
               Right = 314
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_GL_TYPE"
            Begin Extent = 
               Top = 246
               Left = 244
               Bottom = 361
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_ACCOUNT"
            Begin Extent = 
               Top = 348
               Left = 38
               Bottom = 463
               Right =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_Approve';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 126
               Left = 438
               Bottom = 241
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 366
               Left = 258
               Bottom = 481
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_PROCESS_1"
            Begin Extent = 
               Top = 468
               Left = 38
               Bottom = 583
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 486
               Left = 244
               Bottom = 601
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 588
               Left = 38
               Bottom = 798
               Right = 223
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
         Column = 1920
         Alias = 1605
         Table = 2235
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_Approve';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_Approve';

