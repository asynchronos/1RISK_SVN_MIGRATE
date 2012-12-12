CREATE VIEW dbo.V_014_REPORT_S_APPROVE_FOR_BOT
AS
SELECT     R.MONTH, R.CIF, R.CUSTOMER_NAME, R.BUSINESS, SUM(R.RM_VALUEs_OLD_CUS) AS RM_VALUEs_OLD_CUS, SUM(R.RM_VALUEs_NEW_CUS) 
                      AS RM_VALUEs_NEW_CUS, dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_Cash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_NonCash, dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_NA,
                       SUM(R.APPROVE_VALUEs_OLD_CUS) AS APPROVE_VALUEs_OLD_CUS, SUM(R.APPROVE_VALUEs_NEW_CUS) AS APPROVE_VALUEs_NEW_CUS, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_Cash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_NonCash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_NA, SUM(R.APPROVE_DIFF_OLD_CUS) AS APPROVE_DIFF_OLD_CUS, 
                      SUM(R.APPROVE_DIFF_NEW_CUS) AS APPROVE_DIFF_NEW_CUS, R.LAST_PROCESS, R.Reason, R.CIM_NAME, R.CIM_BUSINESS, R.BaySize, 
                      R.MIS_SIZE, R.LAST_PROCESS_DATE, R.EMP_ID, R.EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.CA_NO_ID
FROM         dbo.REPORT55_54_APPROVE_FOR_BOT AS R INNER JOIN
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE ON R.OLD_ID = dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.OLD_ID AND 
                      R.CIF = dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.CIF
GROUP BY R.MONTH, R.CIF, R.CUSTOMER_NAME, R.BUSINESS, dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_Cash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_NonCash, dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.RM_VALUEs_NA,
                       dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_Cash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_NonCash, 
                      dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE.APPROVE_VALUEs_NA, R.LAST_PROCESS, R.Reason, R.CIM_NAME, R.CIM_BUSINESS, 
                      R.BaySize, R.MIS_SIZE, R.LAST_PROCESS_DATE, R.EMP_ID, R.EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.CA_NO_ID
HAVING      (R.LAST_PROCESS_DATE >= CONVERT(DATETIME, '1/' + CONVERT(varchar, MONTH(GETDATE())) + '/' + CONVERT(varchar, YEAR(GETDATE())), 103)) 
                      AND (R.LAST_PROCESS_DATE <= GETDATE())

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[19] 3) )"
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
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 253
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE"
            Begin Extent = 
               Top = 6
               Left = 291
               Bottom = 185
               Right = 509
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
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2400
         Width = 1965
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
      Begin ColumnWidths = 12
         Column = 2715
         Alias = 2700
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_014_REPORT_S_APPROVE_FOR_BOT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_014_REPORT_S_APPROVE_FOR_BOT';

