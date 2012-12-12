CREATE VIEW dbo.REPORT53_20_APPROVE_SME_REASON
AS
SELECT     TOP (100) PERCENT A.OLD_ID, A.CA_NO_ID, A.CA_CREATE_DATE, A.REFERENCE, A.REFERENCE_DATE, A.CIF, 
                      dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER.CUSTOMER_NAME, SUM(A.OLD_VALUE) AS OLD_VALUEs, SUM(A.RM_VALUE) AS RM_VALUEs, 
                      SUM(A.CM_VALUE) AS CM_VALUEs, SUM(A.APPROVE_VALUE) AS APPROVE_VALUEs, A.APPROVE_DATE, A.REJECT_DATE, A.REJECT_REASON, 
                      A.LAST_PROCESS, A.LAST_PROCESS_ID, A.LAST_PROCESS_GROUP, A.LAST_PROCESS_DATE, CONVERT(varchar(4), YEAR(A.LAST_PROCESS_DATE)) 
                      + RIGHT('0' + CONVERT(varchar(2), MONTH(A.LAST_PROCESS_DATE)), 2) AS MONTH_LAST_PROCESS, A.EMP_ID, dbo.GetName(E.TITLE_NAME, 
                      E.EMPNAME, E.EMPSURNAME) AS EMPNAME, A.LEVEL_ID, A.LEVEL_NAME, A.NEW_CUS, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')) 
                      AS Reason, C.Reason2, A.Customer_Size, A.SIZE_DETAIL, C.BOARD_Others, C.Others, C.Others2
FROM         dbo.REPORT20_09_APPROVE AS A INNER JOIN
                      dbo.ANNALS_CREDIT AS C ON A.OLD_ID = C.ID INNER JOIN
                      dbo.EMPLOYEE01 AS E ON A.EMP_ID = E.EMP_ID LEFT OUTER JOIN
                      dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER ON A.CIF = dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER.CIF
GROUP BY A.OLD_ID, A.CA_NO_ID, A.CA_CREATE_DATE, A.REFERENCE, A.REFERENCE_DATE, A.CIF, A.APPROVE_DATE, A.REJECT_DATE, A.REJECT_REASON, 
                      A.LAST_PROCESS, A.LAST_PROCESS_ID, A.LAST_PROCESS_GROUP, A.LAST_PROCESS_DATE, A.EMP_ID, A.NEW_CUS, LTRIM(ISNULL(C.Reason, N'') 
                      + N' ' + ISNULL(C.Others, N'')), A.Customer_Size, A.SIZE_DETAIL, E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME, A.LEVEL_ID, A.LEVEL_NAME, 
                      CONVERT(varchar(4), YEAR(A.LAST_PROCESS_DATE)) + RIGHT('0' + CONVERT(varchar(2), MONTH(A.LAST_PROCESS_DATE)), 2), C.BOARD_Others, 
                      C.Reason2, C.Others, C.Others2, dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER.CUSTOMER_NAME

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
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
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[67] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 12
               Left = 308
               Bottom = 244
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 11
               Left = 555
               Bottom = 245
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 15
               Left = 78
               Bottom = 262
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME02_00_WITH_BYCUSTOMER"
            Begin Extent = 
               Top = 285
               Left = 590
               Bottom = 400
               Right = 841
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
      Begin ColumnWidths = 32
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
         Width = 2835
         Width = 1500
         Width = 1500
         Width = 1500
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT53_20_APPROVE_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1500
         Width = 1500
         Width = 1500
         Width = 3060
         Width = 1635
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 4635
         Alias = 2565
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT53_20_APPROVE_SME_REASON';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT53_20_APPROVE_SME_REASON';

