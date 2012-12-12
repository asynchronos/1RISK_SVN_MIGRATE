CREATE VIEW [dbo].[REPORT76_39_PIVOT_PRODUCT_TEST]
AS
SELECT     R.[CREATE_MONTH], R.[OLD_ID], R.[CA_NO_ID], R.[CA_CREATE_DATE], R.[REFERENCE], R.[REFERENCE_DATE], R.[SUBJECT_GROUP], 
                      R.[NEW_CUS], R.SUBJECTs, R.[CIFs], dbo.FN_GET_CIF_IN_CA(R.OLD_ID) AS CIF_LIST, [O/D], [-O/D], [T/L], [-T/L], [L/G], [-L/G], [PN], [-PN], [OTHER], 
                      [-OTHER], R.[OLD_VALUEs], R.[RM_VALUEs], R.[CM_VALUEs], R.[APPROVE_VALUEs], R.[APPROVE_DATE], R.[REJECT_DATE], R.[REJECT_REASON], 
                      R.[LAST_PROCESS], R.[LAST_PROCESS_ID], R.[LAST_PROCESS_GROUP], R.[LAST_PROCESS_DATE], R.[EMP_ID], R.[LEVEL_ID], R.[LEVEL_NAME], 
                      R.[Region_Name], R.[Id_Region], R.[Customer_Size]
FROM         (SELECT     OLD_ID, [CA_NO_ID], [O/D], [-O/D], [T/L], [-T/L], [L/G], [-L/G], [PN], [-PN], [OTHER], [-OTHER]
                       FROM          (SELECT     OLD_ID, [CA_NO_ID], CASE WHEN SUBJECT_ACTION = (- 1) THEN '-' + DECB_RD2 ELSE DECB_RD2 END AS DECB_RD3, 
                                                                      APPROVE_VALUE
                                               FROM          DBO.REPORT07_SUMMARY) AS T PIVOT (SUM(APPROVE_VALUE) FOR DECB_RD3 IN ([O/D], [-O/D], [T/L], [-T/L], [L/G], 
                                              [-L/G], [PN], [-PN], [OTHER], [-OTHER])) AS PVT) AS P INNER JOIN
                      dbo.REPORT39_38_BY_CA R ON P.OLD_ID = R.OLD_ID

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
         Configuration = "(H (2[66] 3) )"
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
      Begin ColumnWidths = 53
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1965
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
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 2835
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
         Or = 1350', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT76_39_PIVOT_PRODUCT_TEST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT76_39_PIVOT_PRODUCT_TEST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT76_39_PIVOT_PRODUCT_TEST';

