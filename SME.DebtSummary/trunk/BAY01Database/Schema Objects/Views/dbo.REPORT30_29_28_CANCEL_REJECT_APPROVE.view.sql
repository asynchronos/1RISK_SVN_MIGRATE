CREATE VIEW dbo.REPORT30_29_28_CANCEL_REJECT_APPROVE
AS
SELECT     CASE WHEN dbo.REPORT29_26_27_CANCEL_REJECT.MONTH IS NULL 
                      THEN dbo.REPORT28_25_APPROVE_BY_MONTH.MONTH ELSE dbo.REPORT29_26_27_CANCEL_REJECT.MONTH END AS MONTH, 
                      CASE WHEN dbo.REPORT29_26_27_CANCEL_REJECT.LEVEL_ID IS NULL 
                      THEN dbo.REPORT28_25_APPROVE_BY_MONTH.LEVEL_ID ELSE dbo.REPORT29_26_27_CANCEL_REJECT.LEVEL_ID END AS LEVEL_ID, 
                      CASE WHEN dbo.REPORT29_26_27_CANCEL_REJECT.LEVEL_NAME IS NULL 
                      THEN dbo.REPORT28_25_APPROVE_BY_MONTH.LEVEL_NAME ELSE dbo.REPORT29_26_27_CANCEL_REJECT.LEVEL_NAME END AS LEVEL_NAME, 
                      CASE WHEN dbo.REPORT29_26_27_CANCEL_REJECT.Customer_Size IS NULL 
                      THEN dbo.REPORT28_25_APPROVE_BY_MONTH.Customer_Size ELSE dbo.REPORT29_26_27_CANCEL_REJECT.Customer_Size END AS Customer_Size,
                       CASE WHEN dbo.REPORT29_26_27_CANCEL_REJECT.SIZE_DETAIL IS NULL 
                      THEN dbo.REPORT28_25_APPROVE_BY_MONTH.SIZE_DETAIL ELSE dbo.REPORT29_26_27_CANCEL_REJECT.SIZE_DETAIL END AS SIZE_DETAIL, 
                      ISNULL(dbo.REPORT29_26_27_CANCEL_REJECT.CANCEL_REQUEST, 0) AS CANCEL_REQUEST, 
                      dbo.REPORT29_26_27_CANCEL_REJECT.CANCEL_OLD_VALUEs, dbo.REPORT29_26_27_CANCEL_REJECT.CANCEL_RM_VALUEs, 
                      dbo.REPORT29_26_27_CANCEL_REJECT.CANCEL_CM_VALUEs, dbo.REPORT29_26_27_CANCEL_REJECT.CANCEL_APPROVE_VALUEs, 
                      ISNULL(dbo.REPORT29_26_27_CANCEL_REJECT.REJECT_REQUEST, 0) AS REJECT_REQUEST, 
                      dbo.REPORT29_26_27_CANCEL_REJECT.REJECT_OLD_VALUEs, dbo.REPORT29_26_27_CANCEL_REJECT.REJECT_RM_VALUEs, 
                      dbo.REPORT29_26_27_CANCEL_REJECT.REJECT_CM_VALUEs, dbo.REPORT29_26_27_CANCEL_REJECT.REJECT_APPROVE_VALUEs, 
                      ISNULL(dbo.REPORT28_25_APPROVE_BY_MONTH.REQUEST, 0) AS APPROVE_REQUEST, 
                      dbo.REPORT28_25_APPROVE_BY_MONTH.OLD_VALUEs AS APPROVE_OLD_VALUEs, 
                      dbo.REPORT28_25_APPROVE_BY_MONTH.RM_VALUEs AS APPROVE_RM_VALUEs, 
                      dbo.REPORT28_25_APPROVE_BY_MONTH.CM_VALUEs AS APPROVE_CM_VALUEs, 
                      dbo.REPORT28_25_APPROVE_BY_MONTH.APPROVE_VALUEs AS APPROVE_APPROVE_VALUEs
FROM         dbo.REPORT29_26_27_CANCEL_REJECT FULL OUTER JOIN
                      dbo.REPORT28_25_APPROVE_BY_MONTH ON 
                      dbo.REPORT29_26_27_CANCEL_REJECT.Customer_Size = dbo.REPORT28_25_APPROVE_BY_MONTH.Customer_Size AND 
                      dbo.REPORT29_26_27_CANCEL_REJECT.MONTH = dbo.REPORT28_25_APPROVE_BY_MONTH.MONTH AND 
                      dbo.REPORT29_26_27_CANCEL_REJECT.LEVEL_ID = dbo.REPORT28_25_APPROVE_BY_MONTH.LEVEL_ID

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
         Begin Table = "REPORT28_25_APPROVE_BY_MONTH"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 260
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT29_26_27_CANCEL_REJECT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 262
               Right = 252
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
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2835
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
      Begin ColumnWidths = 11
         Column = 6945
         Alias = 2295
         Table = 2925
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT30_29_28_CANCEL_REJECT_APPROVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT30_29_28_CANCEL_REJECT_APPROVE';

