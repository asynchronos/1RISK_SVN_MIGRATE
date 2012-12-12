CREATE VIEW dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER
AS
SELECT     dbo.CUSTOMER_SME02_01_WITH_LEVEL.CIF, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CUSTOMER_NAME_E, dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CM_CODE, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CM_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.LEVEL_NAME, dbo.CUSTOMER_SME02_01_WITH_LEVEL.LEVEL_NAME_NO_HUB, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.OLD_CM_CODE, dbo.CUSTOMER_SME02_01_WITH_LEVEL.OLD_CM_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BRANCH_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BRANCH_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.Id_Region, dbo.CUSTOMER_SME02_01_WITH_LEVEL.Region_Name, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_SIZE_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_SIZE_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.JUDGEMENT_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.JUDGEMENT_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK1_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK1_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK2_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK2_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK3_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK3_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_BY, dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_BY_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_DATE, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_TYPE_CIM, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.DEPTFLAG, dbo.CUSTOMER_SME02_01_WITH_LEVEL.DEPTTRAN, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CONTROLLING_UNIT, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CONTROLLING_UNIT_E, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.REGION_CONTROLLING_UNIT, CASE WHEN dbo.ByCustomer.CIF IS NULL THEN NULL 
                      ELSE dbo.DEBTDATE.ASOF END AS ByCustomer_ASOF, dbo.ByCustomer.BaySize, dbo.ByCustomer.Rating, dbo.ByCustomer.Class, 
                      dbo.ByCustomer.Tdr, dbo.ByCustomer.Principal, dbo.ByCustomer.Accru, dbo.ByCustomer.Susp, dbo.ByCustomer.UseValue, dbo.ByCustomer.Totresv, 
                      dbo.ByCustomer.Full_IAS39, dbo.ByCustomer.ResvFull, dbo.ByCustomer.Contingent, dbo.ByCustomer.AGING, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSINESS_DESTINATION_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSINESS_DESTINATION_DESC, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.EXPORT_WEIGHT, dbo.CUSTOMER_SME02_01_WITH_LEVEL.LOCAL_WEIGHT, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.STATUS_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.STATUS_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.SIZE_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CUSTOMER_NAME2, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CUSTOMER_NAME_E2
FROM         dbo.CUSTOMER_SME02_01_WITH_LEVEL LEFT OUTER JOIN
                      dbo.ByCustomer ON dbo.CUSTOMER_SME02_01_WITH_LEVEL.CIF = dbo.ByCustomer.Cif CROSS JOIN
                      dbo.DEBTDATE
WHERE     (dbo.DEBTDATE.Upd_TABLE = 'ByCustomer')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[17] 3) )"
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
         Begin Table = "CUSTOMER_SME02_01_WITH_LEVEL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 30
         End
         Begin Table = "ByCustomer"
            Begin Extent = 
               Top = 6
               Left = 303
               Bottom = 254
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DEBTDATE"
            Begin Extent = 
               Top = 6
               Left = 496
               Bottom = 121
               Right = 648
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
      Begin ColumnWidths = 46
         Width = 284
         Width = 1500
         Width = 1905
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
         Width = 1620
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME03_02_WITH_BYCUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
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
         Column = 4785
         Alias = 2220
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME03_02_WITH_BYCUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME03_02_WITH_BYCUSTOMER';

