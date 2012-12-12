CREATE VIEW CLASSIFY.V_007_CM_CATEGORY8_HEAD_MANAGER
AS
WITH CATEGORY_CTE AS (SELECT EMP_ID, TITLE_NAME, EMPNAME, EMPSURNAME, TITLE_NAME_E, EMPNAME_E, EMPSURNAME_E, CATEGORY_KEY, 
                                                                     CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_PRIORITY, CATEGORY_TYPE_KEY, 
                                                                     CATEGORY_TYPE_DESC, CATEGORY_TYPE_DESC_TH, CATEGORY_TYPE_VALUE, CATEGORY_TYPE_PRIORITY, 
                                                                     LEADER_EMP_ID, PARENT_CATEGORY_KEY, 0 AS TREE_LV, CONVERT(varchar(MAX), CATEGORY_KEY) 
                                                                     AS TREE_LEVEL, CONVERT(varchar(MAX), LEADER_EMP_ID) AS TREE_LEADER_EMP_ID, CONVERT(varchar(MAX), 
                                                                     LEADER_EMP_ID) AS LEADER_EMP_ID_1, CONVERT(varchar(MAX), LEADER_EMP_ID) AS LEADER_EMP_ID_2, 
                                                                     CONVERT(varchar(MAX), LEADER_EMP_ID) AS LEADER_EMP_ID_3, CONVERT(varchar(MAX), LEADER_EMP_ID) 
                                                                     AS LEADER_EMP_ID_4
                                                      FROM   CLASSIFY.V_006_CM_CATEGORY8_LEADER_PARENT
                                                      WHERE (PARENT_CATEGORY_KEY = 1156)
                                                      UNION ALL
                                                      SELECT C.EMP_ID, C.TITLE_NAME, C.EMPNAME, C.EMPSURNAME, C.TITLE_NAME_E, C.EMPNAME_E, C.EMPSURNAME_E, 
                                                                     C.CATEGORY_KEY, C.CATEGORY_DESC, C.CATEGORY_DESC_TH, C.CATEGORY_VALUE, C.CATEGORY_PRIORITY, 
                                                                     C.CATEGORY_TYPE_KEY, C.CATEGORY_TYPE_DESC, C.CATEGORY_TYPE_DESC_TH, C.CATEGORY_TYPE_VALUE, 
                                                                     C.CATEGORY_TYPE_PRIORITY, C.LEADER_EMP_ID, C.PARENT_CATEGORY_KEY, 
                                                                     CATEGORY_CTE_2.TREE_LV + 1 AS TREE_LV, CATEGORY_CTE_2.TREE_LEVEL + '_' + CONVERT(varchar(MAX), 
                                                                     C.CATEGORY_KEY) AS Expr2, CATEGORY_CTE_2.TREE_LEADER_EMP_ID + '_' + CONVERT(varchar(MAX), 
                                                                     C.LEADER_EMP_ID) AS Expr3, CONVERT(varchar(MAX), CATEGORY_CTE_2.LEADER_EMP_ID) AS LEADER_EMP_ID_1, 
                                                                     CONVERT(varchar(MAX), CATEGORY_CTE_2.LEADER_EMP_ID_1) AS LEADER_EMP_ID_2, CONVERT(varchar(MAX), 
                                                                     CATEGORY_CTE_2.LEADER_EMP_ID_2) AS LEADER_EMP_ID_3, CONVERT(varchar(MAX), 
                                                                     CATEGORY_CTE_2.LEADER_EMP_ID_3) AS LEADER_EMP_ID_4
                                                      FROM  CLASSIFY.V_006_CM_CATEGORY8_LEADER_PARENT AS C INNER JOIN
                                                                     CATEGORY_CTE AS CATEGORY_CTE_2 ON C.PARENT_CATEGORY_KEY = CATEGORY_CTE_2.CATEGORY_KEY)
    SELECT EMP_ID, TITLE_NAME, EMPNAME, EMPSURNAME, TITLE_NAME_E, EMPNAME_E, EMPSURNAME_E, CATEGORY_KEY, CATEGORY_DESC, 
                   CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_PRIORITY, CATEGORY_TYPE_KEY, CATEGORY_TYPE_DESC, 
                   CATEGORY_TYPE_DESC_TH, CATEGORY_TYPE_VALUE, CATEGORY_TYPE_PRIORITY, LEADER_EMP_ID, PARENT_CATEGORY_KEY, TREE_LV, 
                   TREE_LEVEL, TREE_LEADER_EMP_ID, LEADER_EMP_ID_1, LEADER_EMP_ID_2, LEADER_EMP_ID_3, LEADER_EMP_ID_4, 
                   CASE TREE_LV WHEN 0 THEN [LEADER_EMP_ID] WHEN 1 THEN [LEADER_EMP_ID] WHEN 2 THEN [LEADER_EMP_ID] WHEN 3 THEN [LEADER_EMP_ID]
                    WHEN 4 THEN LEADER_EMP_ID_1 ELSE NULL END AS HEAD_EMP_ID, 
                   CASE TREE_LV WHEN 0 THEN [LEADER_EMP_ID_1] WHEN 1 THEN [LEADER_EMP_ID] WHEN 2 THEN [LEADER_EMP_ID_1] WHEN 3 THEN [LEADER_EMP_ID_2]
                    WHEN 4 THEN [LEADER_EMP_ID_3] ELSE NULL END AS MANAGER_EMP_ID
    FROM  CATEGORY_CTE AS CATEGORY_CTE_1

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
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
         Begin Table = "CATEGORY_CTE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 256
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
         Column = 14808
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_007_CM_CATEGORY8_HEAD_MANAGER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_007_CM_CATEGORY8_HEAD_MANAGER';

