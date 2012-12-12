CREATE VIEW dbo.CM_HEAD
AS
SELECT     dbo.CUSTOMER_SME00_ALL_STATUS.CIF, dbo.CUSTOMER_SME00_ALL_STATUS.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE, EMPLOYEE01_1.EMPNAME_E, EMPLOYEE01_1.EMPSURNAME_E, 
                      dbo.CONTROLLING_LINE_FULL.LEAD_ID, dbo.EMPLOYEE01.EMPNAME_E AS LEADNAME_E, 
                      dbo.EMPLOYEE01.EMPSURNAME_E AS LEADSURNAME_E, dbo.CUSTOMER_SME00_ALL_STATUS.CUSTOMER_NAME_E, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_ID
FROM         dbo.EMPLOYEE01 INNER JOIN
                      dbo.CONTROLLING_LINE_FULL ON dbo.EMPLOYEE01.EMP_ID = dbo.CONTROLLING_LINE_FULL.LEAD_ID RIGHT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMPLOYEE01_1 ON dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE = EMPLOYEE01_1.EMP_ID ON 
                      dbo.CONTROLLING_LINE_FULL.EMP_ID = dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE

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
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CONTROLLING_LINE_FULL"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 121
               Right = 393
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 6
               Left = 431
               Bottom = 121
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01_1"
            Begin Extent = 
               Top = 6
               Left = 704
               Bottom = 121
               Right = 869
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CM_HEAD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CM_HEAD';

