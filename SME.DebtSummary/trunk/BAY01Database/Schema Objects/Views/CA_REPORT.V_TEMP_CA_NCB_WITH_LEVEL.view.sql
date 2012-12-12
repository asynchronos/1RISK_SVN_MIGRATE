/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW CA_REPORT.V_TEMP_CA_NCB_WITH_LEVEL
AS
SELECT A1.CA_NO_ID, A2.ID, A2.CIF, A2.CUS_NCB_TYPE_ID, dbo.ANNALS_CUS_NCB_TYPE.CUS_NCB_TYPE, A2.CUS_NCB_DATE, 
               A2.CUS_NCB_EXCEPT_TYPE_ID, dbo.ANNALS_CUS_NCB_EXCEPT_TYPE.CUS_NCB_EXCEPT_TYPE, A2.DETAIL, A1.LAST_PROCESS_DATE, 
               A1.EMP_ID, A1.EMP_NAME, A1.LEVEL_ID, A1.LEVEL_NAME, A1.Send_To_Board, A1.Authority
FROM  (SELECT DISTINCT OLD_ID, CA_NO_ID, LAST_PROCESS_DATE, EMP_ID, EMP_NAME, LEVEL_ID, LEVEL_NAME, Send_To_Board, Authority
               FROM   CA_REPORT.V_006_CA_SUBJECT_SUMMARY) AS A1 INNER JOIN
               dbo.ANNALS_CUS_NCB AS A2 ON A1.OLD_ID = A2.ID LEFT OUTER JOIN
               dbo.ANNALS_CUS_NCB_EXCEPT_TYPE ON 
               A2.CUS_NCB_EXCEPT_TYPE_ID = dbo.ANNALS_CUS_NCB_EXCEPT_TYPE.CUS_NCB_EXCEPT_TYPE_ID LEFT OUTER JOIN
               dbo.ANNALS_CUS_NCB_TYPE ON A2.CUS_NCB_TYPE_ID = dbo.ANNALS_CUS_NCB_TYPE.CUS_NCB_TYPE_ID
WHERE (A2.CUS_NCB_DATE >= CONVERT(datetime, '01/06/2011', 103)) AND (A2.CUS_NCB_DATE < CONVERT(datetime, '01/07/2011', 103))

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
         Begin Table = "A2"
            Begin Extent = 
               Top = 7
               Left = 311
               Bottom = 194
               Right = 557
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CUS_NCB_TYPE"
            Begin Extent = 
               Top = 1
               Left = 587
               Bottom = 119
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CUS_NCB_EXCEPT_TYPE"
            Begin Extent = 
               Top = 118
               Left = 587
               Bottom = 236
               Right = 833
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A1"
            Begin Extent = 
               Top = 8
               Left = 40
               Bottom = 144
               Right = 255
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2928
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_TEMP_CA_NCB_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_TEMP_CA_NCB_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_TEMP_CA_NCB_WITH_LEVEL';

