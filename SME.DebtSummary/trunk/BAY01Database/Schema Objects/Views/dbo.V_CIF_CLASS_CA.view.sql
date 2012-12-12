CREATE VIEW dbo.V_CIF_CLASS_CA
AS
SELECT DISTINCT 
                      c.CIF, c.CUS_TITLE, c.CUS_FIRST, c.CUS_LAST, dbo.Cif_Class.Class5001, dbo.Cif_Class.Class5002, dbo.Cif_Class.Class5003, 
                      dbo.Cif_Class.Class5004, dbo.Cif_Class.Class5005, dbo.Cif_Class.Class5006, dbo.Cif_Class.Class5007, dbo.Cif_Class.Class5008, 
                      dbo.Cif_Class.Class5009, dbo.Cif_Class.Class5010, dbo.Cif_Class.Class5011, dbo.Cif_Class.Class5012, dbo.Cif_Class.Class5101, 
                      dbo.Cif_Class.Class5102, dbo.Cif_Class.Class5103, dbo.Cif_Class.Class5104, dbo.Cif_Class.Class5105, dbo.Cif_Class.Class5106, 
                      dbo.Cif_Class.Class5107, dbo.Cif_Class.Class5108, dbo.Cif_Class.Class5109, dbo.Cif_Class.Class5110, dbo.Cif_Class.Class5111, 
                      dbo.Cif_Class.Class5112, dbo.Cif_Class.Cif_No
FROM         dbo.Cif_Class RIGHT OUTER JOIN
                      dbo.ANNALS_CREDIT_ACCOUNT AS a INNER JOIN
                      dbo.CUSTOMER AS c ON a.CIF = c.CIF ON dbo.Cif_Class.Cif_No = a.CIF

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[18] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
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
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 18
               Left = 251
               Bottom = 243
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 8
               Left = 21
               Bottom = 286
               Right = 172
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cif_Class"
            Begin Extent = 
               Top = 21
               Left = 531
               Bottom = 216
               Right = 685
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
      Begin ColumnWidths = 34
         Width = 284
         Width = 1515
         Width = 1455
         Width = 1800
         Width = 2715
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
      End
   End
   Begin CriteriaPane = 
      PaneHidden =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CIF_CLASS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Begin ColumnWidths = 11
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CIF_CLASS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CIF_CLASS_CA';

