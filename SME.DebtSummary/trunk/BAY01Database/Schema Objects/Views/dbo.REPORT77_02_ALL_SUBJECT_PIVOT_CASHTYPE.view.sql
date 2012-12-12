CREATE VIEW dbo.REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE
AS
SELECT     T1.[OLD_ID], T1.[CIF], [RM_VALUEs_Cash], [RM_VALUEs_NonCash], [RM_VALUEs_NA], [APPROVE_VALUEs_Cash], [APPROVE_VALUEs_NonCash], 
                      [APPROVE_VALUEs_NA]
FROM         (SELECT     [OLD_ID], [CIF], [Cash] AS [RM_VALUEs_Cash], [NonCash] AS [RM_VALUEs_NonCash], [NA] AS [RM_VALUEs_NA]
                       FROM          (SELECT     [OLD_ID], [CIF], [CASHTYPE], SUM([RM_VALUE]) [RM_VALUEs]
                                               FROM          REPORT02_ANNALS_CREDIT_SUBJECT
                                               WHERE      (SUBJECT_DETAIL_ID IN (N'101', N'102', N'103')) AND (RM_VALUE > 0)
                                               GROUP BY [OLD_ID], [CIF], [CASHTYPE], SUBJECT_DETAIL_ID) P PIVOT (SUM([RM_VALUEs]) FOR [CASHTYPE] IN ([Cash], [NonCash], [NA])) 
                                              AS PVT) T1 INNER JOIN
                          (SELECT     [OLD_ID], [CIF], [Cash] AS [APPROVE_VALUEs_Cash], [NonCash] AS [APPROVE_VALUEs_NonCash], [NA] AS [APPROVE_VALUEs_NA]
                            FROM          (SELECT     [OLD_ID], [CIF], [CASHTYPE], SUM([APPROVE_VALUE]) [APPROVE_VALUEs]
                                                    FROM          REPORT02_ANNALS_CREDIT_SUBJECT
                                                    WHERE      (SUBJECT_DETAIL_ID IN (N'101', N'102', N'103')) AND (RM_VALUE > 0)
                                                    GROUP BY [OLD_ID], [CIF], [CASHTYPE], SUBJECT_DETAIL_ID) P PIVOT (SUM([APPROVE_VALUEs]) FOR [CASHTYPE] IN ([Cash], 
                                                   [NonCash], [NA])) AS PVT) T2 ON T1.[OLD_ID] = T2.[OLD_ID] AND T1.[CIF] = T2.[CIF]

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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[53] 3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
      PaneHidden = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT77_02_ALL_SUBJECT_PIVOT_CASHTYPE';

