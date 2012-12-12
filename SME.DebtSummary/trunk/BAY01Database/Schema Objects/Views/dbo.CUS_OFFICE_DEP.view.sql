CREATE VIEW dbo.CUS_OFFICE_DEP
AS
SELECT     dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS Oname, dbo.TB_DEPBRANCH.DepTranT, 
                      dbo.TB_RISK_MANAGE.RISK_ID, dbo.Detail.Cif, dbo.Detail.Name, dbo.Detail.Class AS ClassE, dbo.Detail.Principal
FROM         dbo.Detail INNER JOIN
                      dbo.TB_DEPBRANCH ON dbo.Detail.CUS_DEPT_FLAG = dbo.TB_DEPBRANCH.Flag AND 
                      dbo.Detail.CUS_DEPT_TRAN = dbo.TB_DEPBRANCH.Id_DepTran INNER JOIN
                      dbo.TB_RISK_MANAGE ON dbo.Detail.Cif = dbo.TB_RISK_MANAGE.CIF INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.Detail.OFFICR_ID = dbo.TB_EMPLOYEE.EMP_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[23] 2[9] 3) )"
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
         Begin Table = "Detail"
            Begin Extent = 
               Top = 4
               Left = 247
               Bottom = 258
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_DEPBRANCH"
            Begin Extent = 
               Top = 169
               Left = 27
               Bottom = 373
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_RISK_MANAGE"
            Begin Extent = 
               Top = 18
               Left = 31
               Bottom = 111
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 87
               Left = 545
               Bottom = 259
               Right = 709
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 2355
         Width = 2730
         Width = 1185
         Width = 1230
         Width = 2250
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 8640
         Alias = 900
         Table = 2265
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP';

