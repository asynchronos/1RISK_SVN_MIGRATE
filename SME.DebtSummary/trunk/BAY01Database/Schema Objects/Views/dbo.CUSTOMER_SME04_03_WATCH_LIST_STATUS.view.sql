CREATE VIEW dbo.CUSTOMER_SME04_03_WATCH_LIST_STATUS
AS
SELECT     dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CIF, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CUSTOMER_NAME_E, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.GROUP_ID, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CM_CODE, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CM_NAME, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.LEVEL_NAME, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.LEVEL_NAME_NO_HUB, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.OLD_CM_CODE, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.OLD_CM_NAME, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BRANCH_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BRANCH_NAME, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Id_Region, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Region_Name, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.GROUP_SIZE_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.GROUP_SIZE_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.JUDGEMENT_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.JUDGEMENT_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK1_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK1_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK2_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK2_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK3_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_RISK3_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.UPDATE_BY, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.UPDATE_BY_NAME, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.UPDATE_DATE, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSI_TYPE_CIM, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.DEPTFLAG, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.DEPTTRAN, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CONTROLLING_UNIT, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CONTROLLING_UNIT_E, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.REGION_CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSINESS_DESTINATION_ID, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BUSINESS_DESTINATION_DESC, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.EXPORT_WEIGHT, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.LOCAL_WEIGHT, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.STATUS_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.STATUS_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.SIZE_ID, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.ByCustomer_ASOF, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.BaySize, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Rating, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.AGING, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Class, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Tdr, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Principal, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Accru, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Susp, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Contingent, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.UseValue, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Totresv, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.Full_IAS39, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.ResvFull, 
                      dbo.CUSTOMER_SME_LAST_CA.LAST_PROCESS_DATE AS PASS_LEADER, dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CUSTOMER_NAME2, 
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CUSTOMER_NAME_E2
FROM         dbo.CUSTOMER_SME_LAST_CA RIGHT OUTER JOIN
                      dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER ON dbo.CUSTOMER_SME_LAST_CA.CIF = dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER.CIF

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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CUSTOMER_SME_LAST_CA"
            Begin Extent = 
               Top = 6
               Left = 295
               Bottom = 238
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "CUSTOMER_SME03_02_WITH_BYCUSTOMER"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 45
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 54
         Width = 284
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
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME04_03_WATCH_LIST_STATUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
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
         Column = 3600
         Alias = 1950
         Table = 4230
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME04_03_WATCH_LIST_STATUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME04_03_WATCH_LIST_STATUS';

