CREATE VIEW [dbo].[CUS_OFFICE_DEP_old]
AS
SELECT     dbo.TB_CUSTOMER_RISK.Cif, dbo.TB_CUSTOMER_RISK.Name, dbo.TB_CUSTOMER_RISK.GECustSize, dbo.TB_CUSTOMER_RISK.ClassE, 
                      dbo.TB_CUSTOMER_RISK.Class, dbo.TB_CUSTOMER_RISK.Principal, 
                      dbo.TB_OFFICE.Office_CNameE + dbo.TB_OFFICE.Office_FNameE + N'  ' + dbo.TB_OFFICE.Office_LNameE AS Oname, 
                      dbo.TB_DEPBRANCH.DepTranT, dbo.TB_RISK_MANAGE.RISK_ID
FROM         dbo.TB_RISK_MANAGE RIGHT OUTER JOIN
                      dbo.TB_DEPBRANCH INNER JOIN
                      dbo.TB_CUSTOMER_RISK ON dbo.TB_DEPBRANCH.Flag = dbo.TB_CUSTOMER_RISK.CUS_DEPT_FLAG AND 
                      dbo.TB_DEPBRANCH.Id_DepTran = dbo.TB_CUSTOMER_RISK.CUS_DEPT_TRAN ON 
                      dbo.TB_RISK_MANAGE.CIF = dbo.TB_CUSTOMER_RISK.Cif LEFT OUTER JOIN
                      dbo.TB_OFFICE ON dbo.TB_CUSTOMER_RISK.OFFICR_ID = dbo.TB_OFFICE.Id_Office

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[34] 2[23] 3) )"
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
         Begin Table = "TB_RISK_MANAGE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_DEPBRANCH"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 190
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_CUSTOMER_RISK"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 191
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_OFFICE"
            Begin Extent = 
               Top = 6
               Left = 644
               Bottom = 205
               Right = 799
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
      Begin ColumnWidths = 10
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 8880
         Alias = 795
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP_old';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUS_OFFICE_DEP_old';

