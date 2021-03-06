CREATE VIEW dbo.TEMP_KPI_20091117
AS
SELECT     KPI.Class, KPI.Principal, KPI.NPL, KPI.AS_OF_DATE, dbo.CUSTOMER_SME02_00_WITH_LEVEL.CIF, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.CUSTOMER_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.CUSTOMER_NAME_E, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.GROUP_ID, dbo.CUSTOMER_SME02_00_WITH_LEVEL.CM_CODE, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.CM_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.OLD_CM_CODE, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.OLD_CM_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.BRANCH_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BRANCH_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.Id_Region, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.Region_Name, dbo.CUSTOMER_SME02_00_WITH_LEVEL.GROUP_SIZE_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.GROUP_SIZE_DETAIL, dbo.CUSTOMER_SME02_00_WITH_LEVEL.JUDGEMENT_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.JUDGEMENT_DETAIL, dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK1_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK2_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK2_DETAIL, dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK3_ID, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_RISK3_DETAIL, dbo.CUSTOMER_SME02_00_WITH_LEVEL.UPDATE_BY, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.UPDATE_BY_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.UPDATE_DATE, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSI_TYPE_CIM, dbo.CUSTOMER_SME02_00_WITH_LEVEL.DEPTFLAG, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.DEPTTRAN, dbo.CUSTOMER_SME02_00_WITH_LEVEL.CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.CONTROLLING_UNIT_E, dbo.CUSTOMER_SME02_00_WITH_LEVEL.REGION_CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSINESS_DESTINATION_ID, dbo.CUSTOMER_SME02_00_WITH_LEVEL.BUSINESS_DESTINATION_DESC, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.EXPORT_WEIGHT, dbo.CUSTOMER_SME02_00_WITH_LEVEL.LOCAL_WEIGHT, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.STATUS_ID, dbo.CUSTOMER_SME02_00_WITH_LEVEL.STATUS_DETAIL, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.SIZE_ID, dbo.CUSTOMER_SME02_00_WITH_LEVEL.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL.LEVEL_NAME, dbo.CUSTOMER_SME02_00_WITH_LEVEL.LEVEL_NAME_NO_HUB
FROM         dbo.TEMP_KPI_DEBT_20091117 AS KPI INNER JOIN
                      dbo.CUSTOMER_SME02_00_WITH_LEVEL ON KPI.cif = dbo.CUSTOMER_SME02_00_WITH_LEVEL.CIF

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
         Begin Table = "KPI"
            Begin Extent = 
               Top = 7
               Left = 287
               Bottom = 233
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME02_00_WITH_LEVEL"
            Begin Extent = 
               Top = 6
               Left = 477
               Bottom = 232
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 37
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 47
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
         Width = 1575
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Be', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_KPI_20091117';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'gin CriteriaPane = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_KPI_20091117';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_KPI_20091117';

