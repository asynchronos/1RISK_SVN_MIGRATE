CREATE VIEW dbo.CUSTOMER_SME02_00_WITH_LEVEL
AS
SELECT     SME00.CIF, SME00.CUSTOMER_NAME, SME00.CUSTOMER_NAME_E, SME00.GROUP_ID, SME00.CM_CODE, SME00.CM_NAME, 
                      SME00.OLD_CM_CODE, SME00.OLD_CM_NAME, SME00.BRANCH_ID, SME00.BRANCH_NAME, SME00.Id_Region, SME00.Region_Name, 
                      SME00.GROUP_SIZE_ID, SME00.GROUP_SIZE_DETAIL, SME00.JUDGEMENT_ID, SME00.JUDGEMENT_DETAIL, SME00.BUSI_RISK1_ID, 
                      SME00.BUSI_RISK1_DETAIL, SME00.BUSI_RISK2_ID, SME00.BUSI_RISK2_DETAIL, SME00.BUSI_RISK3_ID, SME00.BUSI_RISK3_DETAIL, 
                      SME00.UPDATE_BY, SME00.UPDATE_BY_NAME, SME00.UPDATE_DATE, SME00.BUSI_TYPE_CIM, SME00.DEPTFLAG, SME00.DEPTTRAN, 
                      SME00.CONTROLLING_UNIT, SME00.CONTROLLING_UNIT_E, SME00.REGION_CONTROLLING_UNIT, SME00.BUSINESS_DESTINATION_ID, 
                      SME00.BUSINESS_DESTINATION_DESC, SME00.EXPORT_WEIGHT, SME00.LOCAL_WEIGHT, SME00.STATUS_ID, SME00.STATUS_DETAIL, 
                      SME00.SIZE_ID, SME00.SIZE_DETAIL, SECTION.LEVEL_NAME, CASE WHEN (SECTION.LEVEL_ROOT = '00003' OR
                      SECTION.LEVEL_ROOT = '00004') THEN SECTION.LEVEL_NAME ELSE SECTION.LEVEL_ROOT_NAME END AS LEVEL_NAME_NO_HUB, 
                      SME00.OLD_REGION_ID, SME00.OLD_REGION_NAME
FROM         dbo.CM_SECTION AS SECTION RIGHT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS AS SME00 ON SECTION.EMP_ID = SME00.CM_CODE

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
         Begin Table = "SECTION"
            Begin Extent = 
               Top = 6
               Left = 302
               Bottom = 194
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "SME00"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 194
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 40
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 43
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
         Width = 2340
         Width = 1500
         Width = 2535
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4575
         Alias = 900
         Table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1170
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_LEVEL';

