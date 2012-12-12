CREATE VIEW dbo.V_ANNALS_CUS_NCB
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CUS_NCB.ID, dbo.ANNALS_CUS_NCB.CIF, dbo.CUSTOMER_INFO.Cifname, 
                      dbo.ANNALS_CUS_NCB.CUS_NCB_TYPE_ID, dbo.ANNALS_CUS_NCB_TYPE.CUS_NCB_TYPE, dbo.ANNALS_CUS_NCB.CUS_NCB_TYPE_DETAIL_ID, 
                      dbo.ANNALS_CUS_NCB_TYPE_DETAIL.CUS_NCB_TYPE_DETAIL, CONVERT(varchar, dbo.ANNALS_CUS_NCB.CUS_NCB_DATE, 103) 
                      AS CUS_NCB_DATE, dbo.ANNALS_CUS_NCB.DETAIL, dbo.ANNALS_CUS_NCB.DEPT_ID, 
                      CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_DESC_TH AS DEPT, dbo.ANNALS_CUS_NCB.CUS_TYPE_ID, 
                      CLASSIFY.V_009_CUSTOMER_NCB_TYPE_11.CATEGORY_DESC_TH AS CUS_TYPE, dbo.ANNALS_CUS_NCB.AUTH_1_ID, 
                      dbo.EMPLOYEE01.TITLE_NAME + dbo.EMPLOYEE01.EMPNAME + ' ' + dbo.EMPLOYEE01.EMPSURNAME AS AUTH_1_NAME, 
                      dbo.ANNALS_CUS_NCB.AUTH_2_ID, 
                      EMPLOYEE01_1.TITLE_NAME + EMPLOYEE01_1.EMPNAME + ' ' + EMPLOYEE01_1.EMPSURNAME AS AUTH_2_NAME
FROM         dbo.ANNALS_CUS_NCB LEFT OUTER JOIN
                      dbo.CUSTOMER_INFO ON dbo.ANNALS_CUS_NCB.CIF = dbo.CUSTOMER_INFO.CIF LEFT OUTER JOIN
                      dbo.ANNALS_CUS_NCB_TYPE_DETAIL INNER JOIN
                      dbo.ANNALS_CUS_NCB_TYPE ON dbo.ANNALS_CUS_NCB_TYPE_DETAIL.CUS_NCB_TYPE_ID = dbo.ANNALS_CUS_NCB_TYPE.CUS_NCB_TYPE_ID ON
                       dbo.ANNALS_CUS_NCB.CUS_NCB_TYPE_DETAIL_ID = dbo.ANNALS_CUS_NCB_TYPE_DETAIL.CUS_NCB_TYPE_DETAIL_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMPLOYEE01_1 ON dbo.ANNALS_CUS_NCB.AUTH_2_ID = EMPLOYEE01_1.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 ON dbo.ANNALS_CUS_NCB.AUTH_1_ID = dbo.EMPLOYEE01.EMP_ID LEFT OUTER JOIN
                      CLASSIFY.V_009_CUSTOMER_NCB_TYPE_11 ON 
                      dbo.ANNALS_CUS_NCB.CUS_TYPE_ID = CLASSIFY.V_009_CUSTOMER_NCB_TYPE_11.CATEGORY_KEY LEFT OUTER JOIN
                      CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO ON 
                      dbo.ANNALS_CUS_NCB.DEPT_ID = CLASSIFY.V_003_LINKED_CATEGORY_TYPE_1_INFO.CATEGORY_KEY
ORDER BY dbo.ANNALS_CUS_NCB.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[14] 2[26] 3) )"
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
         Begin Table = "ANNALS_CUS_NCB"
            Begin Extent = 
               Top = 9
               Left = 346
               Bottom = 133
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CUSTOMER_INFO"
            Begin Extent = 
               Top = 152
               Left = 337
               Bottom = 267
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CUS_NCB_TYPE_DETAIL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CUS_NCB_TYPE"
            Begin Extent = 
               Top = 16
               Left = 557
               Bottom = 191
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01_1"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_009_CUSTOMER_NCB_TYPE_11 (CLASSIFY)"
            Begin Extent = 
               Top = 270
               Left = 240
               Bottom = 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_NCB';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'78
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_003_LINKED_CATEGORY_TYPE_1_INFO (CLASSIFY)"
            Begin Extent = 
               Top = 378
               Left = 38
               Bottom = 486
               Right = 257
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_NCB';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_ANNALS_CUS_NCB';

