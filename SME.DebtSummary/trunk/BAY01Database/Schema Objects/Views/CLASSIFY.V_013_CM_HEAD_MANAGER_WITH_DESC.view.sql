CREATE VIEW CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC
AS
SELECT     EMP.EMP_ID, EMP.TITLE_NAME, EMP.EMPNAME, EMP.EMPSURNAME, EMP.TITLE_NAME_E, EMP.EMPNAME_E, EMP.EMPSURNAME_E, 
                      EMP.CATEGORY_KEY, EMP.CATEGORY_DESC, EMP.HEAD_EMP_ID, EMP.MANAGER_EMP_ID, HEAD.TITLE_NAME AS HEAD_TITLE_NAME, 
                      HEAD.EMPNAME AS HEAD_EMPNAME, HEAD.EMPSURNAME AS HEAD_EMPSURNAME, HEAD.TITLE_NAME_E AS HEAD_TITLE_NAME_E, 
                      HEAD.EMPNAME_E AS HEAD_EMPNAME_E, HEAD.EMPSURNAME_E AS HEAD_EMPSURNAME_E, HEAD.CATEGORY_KEY AS HEAD_CATEGORY_KEY, 
                      HEAD.CATEGORY_DESC AS HEAD_CATEGORY_DESC, MANAGER.TITLE_NAME AS MANAGER_TITLE_NAME, 
                      MANAGER.EMPNAME AS MANAGER_EMPNAME, MANAGER.EMPSURNAME AS MANAGER_EMPSURNAME, 
                      MANAGER.TITLE_NAME_E AS MANAGER_TITLE_NAME_E, MANAGER.EMPNAME_E AS MANAGER_EMPNAME_E, 
                      MANAGER.EMPSURNAME_E AS MANAGER_EMPSURNAME_E, MANAGER.CATEGORY_KEY AS MANAGER_CATEGORY_KEY, 
                      MANAGER.CATEGORY_DESC AS MANAGER_CATEGORY_DESC
FROM         CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY AS EMP INNER JOIN
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY AS HEAD ON EMP.HEAD_EMP_ID = HEAD.EMP_ID INNER JOIN
                      CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY AS MANAGER ON EMP.MANAGER_EMP_ID = MANAGER.EMP_ID

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
         Begin Table = "EMP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 233
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HEAD"
            Begin Extent = 
               Top = 4
               Left = 240
               Bottom = 228
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MANAGER"
            Begin Extent = 
               Top = 6
               Left = 460
               Bottom = 229
               Right = 633
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
End', @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_013_CM_HEAD_MANAGER_WITH_DESC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CLASSIFY', @level1type = N'VIEW', @level1name = N'V_013_CM_HEAD_MANAGER_WITH_DESC';

