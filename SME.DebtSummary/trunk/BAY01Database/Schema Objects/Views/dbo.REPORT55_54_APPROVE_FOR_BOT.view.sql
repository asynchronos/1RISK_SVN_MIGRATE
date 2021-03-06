CREATE VIEW dbo.REPORT55_54_APPROVE_FOR_BOT
AS
SELECT     TOP (100) PERCENT A.MONTH, A.CIF, ISNULL(A.CUSTOMER_NAME, dbo.GetName(C.CUS_TITLE, C.CUS_FIRST, C.CUS_LAST)) AS CUSTOMER_NAME, 
                      ISNULL(A.BUSI_RISK1_DETAIL, B.Bus_TypeD) AS BUSINESS, A.RM_VALUEs_OLD_CUS, A.RM_VALUEs_NEW_CUS, A.APPROVE_VALUEs_OLD_CUS, 
                      A.APPROVE_VALUEs_NEW_CUS, A.RM_VALUEs_OLD_CUS - A.APPROVE_VALUEs_OLD_CUS AS APPROVE_DIFF_OLD_CUS, 
                      A.RM_VALUEs_NEW_CUS - A.APPROVE_VALUEs_NEW_CUS AS APPROVE_DIFF_NEW_CUS, A.LAST_PROCESS, A.Reason, 
                      CASE WHEN A.CUSTOMER_NAME IS NULL THEN 'Y' ELSE 'N' END AS CIM_NAME, CASE WHEN A.BUSI_RISK1_DETAIL IS NULL 
                      THEN 'Y' ELSE 'N' END AS CIM_BUSINESS, ByCus.BaySize, A.SIZE_DETAIL AS MIS_SIZE, A.LAST_PROCESS_DATE, A.EMP_ID, A.EMPNAME, 
                      A.LEVEL_ID, A.LEVEL_NAME, A.CA_NO_ID, A.OLD_ID
FROM         dbo.CUSTOMER AS C LEFT OUTER JOIN
                      dbo.ByCustomer AS ByCus ON C.CIF = ByCus.Cif LEFT OUTER JOIN
                      dbo.Bus_Type AS B ON C.BUSI_TYPE = B.Id_Bus_Type RIGHT OUTER JOIN
                      dbo.REPORT54_53_APPROVE_SME_S AS A ON C.CIF = A.CIF

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
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 238
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 39
         End
         Begin Table = "ByCus"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 121
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 129
               Left = 482
               Bottom = 244
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 14
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1785
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2295
         Width = 2340
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Colu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT55_54_APPROVE_FOR_BOT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'mn = 3750
         Alias = 2490
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT55_54_APPROVE_FOR_BOT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT55_54_APPROVE_FOR_BOT';

