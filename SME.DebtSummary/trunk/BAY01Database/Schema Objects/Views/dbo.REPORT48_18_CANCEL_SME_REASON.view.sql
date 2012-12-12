CREATE VIEW dbo.REPORT48_18_CANCEL_SME_REASON
AS
SELECT     TOP (100) PERCENT CANCEL.OLD_ID, CANCEL.CA_NO_ID, CANCEL.CA_CREATE_DATE, CANCEL.REFERENCE, CANCEL.REFERENCE_DATE, 
                      CANCEL.CIF, SUM(CANCEL.OLD_VALUE) AS OLD_VALUEs, SUM(CANCEL.RM_VALUE) AS RM_VALUEs, SUM(CANCEL.CM_VALUE) AS CM_VALUEs, 
                      SUM(CANCEL.APPROVE_VALUE) AS APPROVE_VALUEs, CANCEL.APPROVE_DATE, CANCEL.REJECT_DATE, CANCEL.REJECT_REASON, 
                      CANCEL.LAST_PROCESS, CANCEL.LAST_PROCESS_ID, CANCEL.LAST_PROCESS_GROUP, CANCEL.LAST_PROCESS_DATE, CONVERT(varchar(4), 
                      YEAR(CANCEL.LAST_PROCESS_DATE)) + RIGHT('0' + CONVERT(varchar(2), MONTH(CANCEL.LAST_PROCESS_DATE)), 2) AS MONTH_LAST_PROCESS, 
                      CANCEL.EMP_ID, dbo.GetName(E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME) AS EMPNAME, CANCEL.LEVEL_ID, CANCEL.LEVEL_NAME, 
                      CANCEL.NEW_CUS, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')) AS Reason, CANCEL.Customer_Size, CANCEL.SIZE_DETAIL
FROM         dbo.REPORT18_09_CANCEL_ONLY_C020_C050 AS CANCEL INNER JOIN
                      dbo.ANNALS_CREDIT AS C ON CANCEL.OLD_ID = C.ID INNER JOIN
                      dbo.EMPLOYEE01 AS E ON CANCEL.EMP_ID = E.EMP_ID
GROUP BY CANCEL.OLD_ID, CANCEL.CA_NO_ID, CANCEL.CA_CREATE_DATE, CANCEL.REFERENCE, CANCEL.REFERENCE_DATE, CANCEL.CIF, 
                      CANCEL.APPROVE_DATE, CANCEL.REJECT_DATE, CANCEL.REJECT_REASON, CANCEL.LAST_PROCESS, CANCEL.LAST_PROCESS_ID, 
                      CANCEL.LAST_PROCESS_GROUP, CANCEL.LAST_PROCESS_DATE, CANCEL.EMP_ID, CANCEL.NEW_CUS, LTRIM(ISNULL(C.Reason, N'') 
                      + N' ' + ISNULL(C.Others, N'')), CANCEL.Customer_Size, CANCEL.SIZE_DETAIL, E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME, CANCEL.LEVEL_ID, 
                      CANCEL.LEVEL_NAME, CONVERT(varchar(4), YEAR(CANCEL.LAST_PROCESS_DATE)) + RIGHT('0' + CONVERT(varchar(2), 
                      MONTH(CANCEL.LAST_PROCESS_DATE)), 2)

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
         Begin Table = "CANCEL"
            Begin Extent = 
               Top = 7
               Left = 293
               Bottom = 256
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 8
               Left = 521
               Bottom = 256
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 48
               Bottom = 222
               Right = 229
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
      Begin ColumnWidths = 24
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
         Width = 3135
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2145
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2310
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT48_18_CANCEL_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT48_18_CANCEL_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT48_18_CANCEL_SME_REASON';

