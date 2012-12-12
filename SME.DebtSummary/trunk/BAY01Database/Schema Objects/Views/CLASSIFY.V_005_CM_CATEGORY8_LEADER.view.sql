CREATE VIEW CLASSIFY.V_005_CM_CATEGORY8_LEADER
AS
SELECT CLASSIFY.CATE_AND_EMP.EMP_ID, EMP.TITLE_NAME, EMP.EMPNAME, EMP.EMPSURNAME, EMP.TITLE_NAME_E, EMP.EMPNAME_E, 
               EMP.EMPSURNAME_E, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DESC, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DESC_TH, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_VALUE, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_PRIORITY, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_KEY, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DESC, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DESC_TH, 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_VALUE, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_PRIORITY, 
               CATEGORY_8_LEADER.LEADER_EMP_ID, CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DEL_FLAG, 
               CATE_SIZE.CATEGORY_DESC_LINK AS CUS_SIZE
FROM  (SELECT CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_DESC_LINK, CATEGORY_DESC_TH_LINK
               FROM   CLASSIFY.V_004_LINKED_CATEGORY_TYPE_2_INFO
               WHERE (CATEGORY_TYPE_KEY_LINK = 10)) AS CATE_SIZE RIGHT OUTER JOIN
               CLASSIFY.CATE_AND_EMP INNER JOIN
               CLASSIFY.V_002_CATEGORY_MAP_TYPE ON 
               CLASSIFY.CATE_AND_EMP.CATEGORY_KEY = CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY INNER JOIN
               dbo.EMPLOYEE01 AS EMP ON CLASSIFY.CATE_AND_EMP.EMP_ID = EMP.EMP_ID ON 
               CATE_SIZE.CATEGORY_KEY = CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY LEFT OUTER JOIN
                   (SELECT CLASSIFY.CATEGORY.CATEGORY_KEY, CATE_AND_EMP_1.EMP_ID AS LEADER_EMP_ID
                    FROM   CLASSIFY.CATEGORY INNER JOIN
                                   CLASSIFY.CATE_AND_EMP AS CATE_AND_EMP_1 ON 
                                   CLASSIFY.CATEGORY.CATEGORY_KEY = CATE_AND_EMP_1.CATEGORY_KEY
                    WHERE (CATE_AND_EMP_1.HEAD_PRIORITY = 1) AND (CLASSIFY.CATEGORY.CATEGORY_TYPE_KEY = 8) AND 
                                   (CLASSIFY.CATEGORY.DEL_FLAG = 0) AND (CATE_AND_EMP_1.DEL_FLAG = 0)) AS CATEGORY_8_LEADER ON 
               CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_KEY = CATEGORY_8_LEADER.CATEGORY_KEY
WHERE (CLASSIFY.CATE_AND_EMP.DEL_FLAG = 0) AND (CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_DEL_FLAG = 0) AND 
               (CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_DEL_FLAG = 0) AND 
               (CLASSIFY.V_002_CATEGORY_MAP_TYPE.CATEGORY_TYPE_KEY = 8)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[12] 2[17] 3) )"
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
         Begin Table = "CATEGORY_8_LEADER"
            Begin Extent = 
               Top = 95
               Left = 732
               Bottom = 195
               Right = 911
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CATE_AND_EMP (CLASSIFY)"
            Begin Extent = 
               Top = 9
               Left = 232
               Bottom = 165
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_002_CATEGORY_MAP_TYPE (CLASSIFY)"
            Begin Extent = 
               Top = 9
               Left = 454
               Bottom = 181
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP"
            Begin Extent = 
               Top = 8
               Left = 19
               Bottom = 144
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CATE_SIZE"
            Begin Extent = 
               Top = 10
               Left = 919
               Bottom = 146
               Right = 1160
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
      Begin ColumnWidths = 20
         Width = 284
         Width = 756
         Width = 2688
         Width = 3036
         Width = 2616
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1188
         Width = 3828
         Width = 1200
         Width = 1200
         Wid', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_005_CM_CATEGORY8_LEADER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'th = 1440
         Width = 1200
         Width = 3048
         Width = 1500
         Width = 1500
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2532
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_005_CM_CATEGORY8_LEADER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_005_CM_CATEGORY8_LEADER';

