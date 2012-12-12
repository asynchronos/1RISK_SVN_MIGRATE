CREATE VIEW dbo.BUSINESS_TYPE
AS
SELECT DISTINCT 
                      dbo.BUSINESS_TYPE_1.TYPE1_ID, dbo.BUSINESS_TYPE_1.RESEARCH_CODE AS RESEARCH_CODE_1, 
                      dbo.BUSINESS_TYPE_1.DESCRIPTION AS DESCRIPTION_1, dbo.BUSINESS_TYPE_1.DESCRIPTION_EN AS DESCRIPTION_EN_1, 
                      dbo.BUSINESS_TYPE_2.TYPE2_ID, dbo.BUSINESS_TYPE_2.RESEARCH_CODE AS RESEARCH_CODE_2, 
                      dbo.BUSINESS_TYPE_2.DESCRIPTION AS DESCRIPTION_2, dbo.BUSINESS_TYPE_2.DESCRIPTION_EN AS DESCRIPTION_EN_2, 
                      dbo.BUSINESS_TYPE_3.TYPE3_ID, dbo.BUSINESS_TYPE_3.RESEARCH_CODE AS RESEARCH_CODE_3, 
                      dbo.BUSINESS_TYPE_3.DESCRIPTION AS DESCRIPTION_3, dbo.BUSINESS_TYPE_3.DESCRIPTION_EN AS DESCRIPTION_EN_3, 
                      dbo.BUSINESS_TYPE_4.TYPE4_ID, dbo.BUSINESS_TYPE_4.RESEARCH_CODE AS RESEARCH_CODE_4, 
                      dbo.BUSINESS_TYPE_4.DESCRIPTION AS DESCRIPTION_4, dbo.BUSINESS_TYPE_4.DESCRIPTION_EN AS DESCRIPTION_EN_4
FROM         dbo.BUSINESS_TYPE_1 INNER JOIN
                      dbo.BUSINESS_TYPE_2 ON dbo.BUSINESS_TYPE_1.TYPE1_ID = dbo.BUSINESS_TYPE_2.TYPE1_ID INNER JOIN
                      dbo.BUSINESS_TYPE_3 ON dbo.BUSINESS_TYPE_2.TYPE2_ID = dbo.BUSINESS_TYPE_3.TYPE2_ID INNER JOIN
                      dbo.BUSINESS_TYPE_4 ON dbo.BUSINESS_TYPE_3.TYPE3_ID = dbo.BUSINESS_TYPE_4.TYPE3_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[13] 3) )"
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
         Begin Table = "BUSINESS_TYPE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 191
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSINESS_TYPE_2"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 196
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSINESS_TYPE_3"
            Begin Extent = 
               Top = 6
               Left = 450
               Bottom = 195
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSINESS_TYPE_4"
            Begin Extent = 
               Top = 6
               Left = 656
               Bottom = 195
               Right = 824
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
      Begin ColumnWidths = 13
         Width = 284
         Width = 900
         Width = 1680
         Width = 3885
         Width = 900
         Width = 1500
         Width = 4455
         Width = 900
         Width = 1680
         Width = 5040
         Width = 900
         Width = 1680
         Width = 6795
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1500
         Alias = 2025
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'BUSINESS_TYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'BUSINESS_TYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'BUSINESS_TYPE';

