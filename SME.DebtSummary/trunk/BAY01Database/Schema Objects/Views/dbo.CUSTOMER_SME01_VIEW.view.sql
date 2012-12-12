CREATE VIEW dbo.CUSTOMER_SME01_VIEW
AS
SELECT     CIF, CUSTOMER_NAME, CUSTOMER_NAME_E, GROUP_ID, CM_CODE, CM_NAME, OLD_CM_CODE, OLD_CM_NAME, BRANCH_ID, BRANCH_NAME, 
                      Id_Region, Region_Name, GROUP_SIZE_ID, GROUP_SIZE_DETAIL, JUDGEMENT_ID, JUDGEMENT_DETAIL, BUSI_RISK1_ID, BUSI_RISK1_DETAIL, 
                      BUSI_RISK2_ID, BUSI_RISK2_DETAIL, BUSI_RISK3_ID, BUSI_RISK3_DETAIL, UPDATE_BY, UPDATE_BY_NAME, UPDATE_DATE, BUSI_TYPE_CIM, 
                      DEPTFLAG, DEPTTRAN, CONTROLLING_UNIT, REGION_CONTROLLING_UNIT, BUSINESS_DESTINATION_ID, BUSINESS_DESTINATION_DESC, 
                      EXPORT_WEIGHT, LOCAL_WEIGHT, STATUS_ID, STATUS_DETAIL, SIZE_ID, SIZE_DETAIL, CONTROLLING_UNIT_E, CUSTOMER_NAME2, 
                      CUSTOMER_NAME_E2
FROM         dbo.CUSTOMER_SME00_ALL_STATUS
WHERE     (STATUS_ID = 1)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[25] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[26] 2[17] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[58] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
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
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 0
               Left = 43
               Bottom = 115
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 5145
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2745
         Width = 2145
         Width = 1755
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1680
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2460
         Width = 2430
         Width = 2745
         Width = 2535
         Width = 1500
         Width = 1500
         Width = 2745
         Width = 2385
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
         Column = 10740
         Alias = 1755
         Table = 2025
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME01_VIEW';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME01_VIEW';

