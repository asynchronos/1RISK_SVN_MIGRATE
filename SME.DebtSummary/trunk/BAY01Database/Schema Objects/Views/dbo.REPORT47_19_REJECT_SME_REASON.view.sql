CREATE VIEW dbo.REPORT47_19_REJECT_SME_REASON
AS
SELECT     TOP (100) PERCENT R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.REFERENCE, R.REFERENCE_DATE, R.CIF, SUM(R.OLD_VALUE) 
                      AS OLD_VALUEs, SUM(R.RM_VALUE) AS RM_VALUEs, SUM(R.CM_VALUE) AS CM_VALUEs, SUM(R.APPROVE_VALUE) AS APPROVE_VALUEs, 
                      R.APPROVE_DATE, R.REJECT_DATE, R.REJECT_REASON, R.LAST_PROCESS, R.LAST_PROCESS_ID, R.LAST_PROCESS_GROUP, 
                      R.LAST_PROCESS_DATE, CONVERT(varchar(4), YEAR(R.LAST_PROCESS_DATE)) + RIGHT('0' + CONVERT(varchar(2), 
                      MONTH(R.LAST_PROCESS_DATE)), 2) AS MONTH_LAST_PROCESS, R.EMP_ID, dbo.GetName(E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME) 
                      AS EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.NEW_CUS, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')) AS Reason, R.Customer_Size, 
                      R.SIZE_DETAIL
FROM         dbo.REPORT19_09_REJECT AS R INNER JOIN
                      dbo.ANNALS_CREDIT AS C ON R.OLD_ID = C.ID INNER JOIN
                      dbo.EMPLOYEE01 AS E ON R.EMP_ID = E.EMP_ID
GROUP BY R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.REFERENCE, R.REFERENCE_DATE, R.CIF, R.APPROVE_DATE, R.REJECT_DATE, 
                      R.REJECT_REASON, R.LAST_PROCESS, R.LAST_PROCESS_ID, R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, R.EMP_ID, R.NEW_CUS, 
                      LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')), R.Customer_Size, R.SIZE_DETAIL, R.LEVEL_NAME, E.TITLE_NAME, E.EMPNAME, 
                      E.EMPSURNAME, R.LEVEL_ID, CONVERT(varchar(4), YEAR(R.LAST_PROCESS_DATE)) + RIGHT('0' + CONVERT(varchar(2), 
                      MONTH(R.LAST_PROCESS_DATE)), 2)

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
         Configuration = "(H (1[50] 4[25] 3) )"
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
               Top = 2
               Left = 231
               Bottom = 250
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 2
               Left = 485
               Bottom = 250
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 4
               Left = 20
               Bottom = 237
               Right = 201
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
      Begin ColumnWidths = 28
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
         Width = 2985
         Width = 2625
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1530
         Width = 1500
         Width = 2355
         Width = 1380
         Width = 1215
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4980
         Alias = 2340
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT47_19_REJECT_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT47_19_REJECT_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT47_19_REJECT_SME_REASON';

