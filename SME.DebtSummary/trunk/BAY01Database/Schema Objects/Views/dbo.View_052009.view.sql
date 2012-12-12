CREATE VIEW dbo.View_052009
AS
SELECT     dbo.ANNALS.REFERENCE, dbo.ANNALS_CREDIT.SME_Referral_No, dbo.Temp_Report_Product052009.ID, 
                      dbo.Temp_Report_Product052009.[REG-DATE], dbo.Temp_Report_Product052009.[APP-DATE], dbo.Temp_Report_Product052009.CIF, 
                      dbo.Temp_Report_Product052009.CUSTOMER, dbo.Temp_Report_Product052009.[EMP-ID], dbo.Temp_Report_Product052009.EMPLOYEE, 
                      dbo.Temp_Report_Product052009.[BRANCH-ID], dbo.Temp_Report_Product052009.[BRANCH-NAME], dbo.Temp_Report_Product052009.[REGION-ID], 
                      dbo.Temp_Report_Product052009.[REGION-NAME], dbo.Temp_Report_Product052009.NEW, dbo.Temp_Report_Product052009.OLD, 
                      dbo.Temp_Report_Product052009.REVIEW, dbo.Temp_Report_Product052009.EXCEPTION AS Other, 
                      dbo.Temp_Report_Product052009.APPROVE AS Credit_Line, dbo.Temp_Report_Product052009.[O-D], dbo.Temp_Report_Product052009.[(O-D)], 
                      dbo.Temp_Report_Product052009.[F-L], dbo.Temp_Report_Product052009.[(F-L)], dbo.Temp_Report_Product052009.[L-G], 
                      dbo.Temp_Report_Product052009.[(L-G)], dbo.Temp_Report_Product052009.[STL-PN], dbo.Temp_Report_Product052009.[(STL-PN)], 
                      dbo.Temp_Report_Product052009.[TRADE-FIN], dbo.Temp_Report_Product052009.[(TRADE-FIN)], dbo.Temp_Report_Product052009.OTHERS, 
                      dbo.Temp_Report_Product052009.[(OTHERS)], dbo.Temp_Report_Product052009.[SUM-INCREASE], 
                      dbo.Temp_Report_Product052009.[SUM-RM_VALUE], dbo.Temp_Report_Product052009.PROCESS, dbo.Temp_Report_Product052009.[APP-TYPE], 
                      dbo.Temp_Report_Product052009.LEVEL_NAME, dbo.TB_EMPLOYEE.EMPNAME AS Head_Name, 
                      dbo.TB_EMPLOYEE.EMPSURNAME AS Head_Surname, CASE WHEN Controlling_Level.LEVEL_ID = '00018' OR
                      Controlling_Level.LEVEL_ID = '00019' THEN 'Small SME Credit Risk Section 3' WHEN Controlling_Level.LEVEL_ID = '00027' OR
                      Controlling_Level.LEVEL_ID = '00028' OR
                      Controlling_Level.LEVEL_ID = '00029' THEN 'Small SME Credit Risk Section 3' WHEN Controlling_Level.LEVEL_ID = '00020' OR
                      Controlling_Level.LEVEL_ID = '00021' OR
                      Controlling_Level.LEVEL_ID = '00022' OR
                      Controlling_Level.LEVEL_ID = '00025' OR
                      Controlling_Level.LEVEL_ID = '00026' THEN 'Small SME Credit Risk Section 4' ELSE Controlling_Level.LEVEL_NAME END AS SECTION, 
                      CASE WHEN Controlling_Level.LEVEL_ID = '00018' OR
                      Controlling_Level.LEVEL_ID = '00019' OR
                      Controlling_Level.LEVEL_ID = '00027' OR
                      Controlling_Level.LEVEL_ID = '00028' OR
                      Controlling_Level.LEVEL_ID = '00029' OR
                      Controlling_Level.LEVEL_ID = '00020' OR
                      Controlling_Level.LEVEL_ID = '00021' OR
                      Controlling_Level.LEVEL_ID = '00022' OR
                      Controlling_Level.LEVEL_ID = '00025' OR
                      Controlling_Level.LEVEL_ID = '00026' OR
                      Controlling_Level.LEVEL_ID = '00014' OR
                      Controlling_Level.LEVEL_ID = '00015' OR
                      Controlling_Level.LEVEL_ID = '00016' OR
                      Controlling_Level.LEVEL_ID = '00017' THEN 'SME(S)' ELSE 'SME(L&M) ' END AS SECTION1, dbo.ANNALS_BOARD.Board, 
                      dbo.Temp_Report_Product052009.JOB_TYPE, dbo.Temp_Report_Product052009.TTY AS [TTY_SME(S)], 
                      dbo.Temp_Report_Product052009.PAT AS [TTY_SME(M)]
FROM         dbo.Controlling_LeadsInLevel INNER JOIN
                      dbo.Controlling_Level INNER JOIN
                      dbo.ANNALS_CREDIT INNER JOIN
                      dbo.ANNALS ON dbo.ANNALS_CREDIT.ANNALS_TYPE = dbo.ANNALS.ANNALS_TYPE AND 
                      dbo.ANNALS_CREDIT.ANNALS_SEQ_NO = dbo.ANNALS.ANNALS_SEQ_NO AND 
                      dbo.ANNALS_CREDIT.ANNALS_YEAR = dbo.ANNALS.ANNALS_YEAR INNER JOIN
                      dbo.Temp_Report_Product052009 ON dbo.ANNALS_CREDIT.ID = dbo.Temp_Report_Product052009.ID INNER JOIN
                      dbo.Controlling_UsersInLevel ON dbo.Temp_Report_Product052009.[EMP-ID] = dbo.Controlling_UsersInLevel.EMP_ID ON 
                      dbo.Controlling_Level.LEVEL_ID = dbo.Controlling_UsersInLevel.LEVEL_ID ON 
                      dbo.Controlling_LeadsInLevel.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.Controlling_LeadsInLevel.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID LEFT OUTER JOIN
                      dbo.ANNALS_BOARD ON dbo.ANNALS_CREDIT.BOARD_ID = dbo.ANNALS_BOARD.Id
WHERE     (MONTH(dbo.Temp_Report_Product052009.[APP-DATE]) = 05) AND (YEAR(dbo.Temp_Report_Product052009.[APP-DATE]) = 2009)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[17] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[24] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[81] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[70] 3) )"
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
         Configuration = "(H (4[24] 2) )"
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
         Configuration = "(V (2) )"
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
         Begin Table = "Controlling_LeadsInLevel"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 91
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 18
               Left = 552
               Bottom = 157
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "ANNALS"
            Begin Extent = 
               Top = 155
               Left = 25
               Bottom = 379
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Temp_Report_Product052009"
            Begin Extent = 
               Top = 126
               Left = 260
               Bottom = 241
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_UsersInLevel"
            Begin Extent = 
               Top = 169
               Left = 550
               Bottom = 254
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 275
               Left = 496', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_052009';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Bottom = 436
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_BOARD"
            Begin Extent = 
               Top = 3
               Left = 805
               Bottom = 118
               Right = 957
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
      Begin ColumnWidths = 45
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
         Width = 2880
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2505
         Width = 1170
         Width = 3690
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
         Column = 4770
         Alias = 1635
         Table = 4335
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_052009';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_052009';

