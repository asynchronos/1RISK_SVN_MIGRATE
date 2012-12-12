CREATE VIEW dbo.CUSTOMER_SME02_01_WITH_LEVEL
AS
SELECT     dbo.CUSTOMER_SME01_VIEW.CIF, dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME, dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME_E, 
                      dbo.CUSTOMER_SME01_VIEW.GROUP_ID, dbo.CUSTOMER_SME01_VIEW.CM_CODE, dbo.CUSTOMER_SME01_VIEW.CM_NAME, 
                      SECTION.LEVEL_NAME, CASE WHEN (SECTION.LEVEL_ROOT = '00003' OR
                      SECTION.LEVEL_ROOT = '00004') THEN SECTION.LEVEL_NAME ELSE SECTION.LEVEL_ROOT_NAME END AS LEVEL_NAME_NO_HUB, 
                      dbo.CUSTOMER_SME01_VIEW.OLD_CM_CODE, dbo.CUSTOMER_SME01_VIEW.OLD_CM_NAME, dbo.CUSTOMER_SME01_VIEW.BRANCH_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BRANCH_NAME, dbo.CUSTOMER_SME01_VIEW.Id_Region, dbo.CUSTOMER_SME01_VIEW.Region_Name, 
                      dbo.CUSTOMER_SME01_VIEW.GROUP_SIZE_ID, dbo.CUSTOMER_SME01_VIEW.GROUP_SIZE_DETAIL, 
                      dbo.CUSTOMER_SME01_VIEW.JUDGEMENT_ID, dbo.CUSTOMER_SME01_VIEW.JUDGEMENT_DETAIL, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_TYPE_CIM, dbo.CUSTOMER_SME01_VIEW.UPDATE_BY, 
                      dbo.CUSTOMER_SME01_VIEW.UPDATE_BY_NAME, dbo.CUSTOMER_SME01_VIEW.UPDATE_DATE, dbo.CUSTOMER_SME01_VIEW.DEPTFLAG, 
                      dbo.CUSTOMER_SME01_VIEW.DEPTTRAN, dbo.CUSTOMER_SME01_VIEW.CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME01_VIEW.CONTROLLING_UNIT_E, dbo.CUSTOMER_SME01_VIEW.REGION_CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME01_VIEW.BUSINESS_DESTINATION_ID, dbo.CUSTOMER_SME01_VIEW.BUSINESS_DESTINATION_DESC, 
                      dbo.CUSTOMER_SME01_VIEW.EXPORT_WEIGHT, dbo.CUSTOMER_SME01_VIEW.LOCAL_WEIGHT, dbo.CUSTOMER_SME01_VIEW.STATUS_ID, 
                      dbo.CUSTOMER_SME01_VIEW.STATUS_DETAIL, dbo.CUSTOMER_SME01_VIEW.SIZE_ID, dbo.CUSTOMER_SME01_VIEW.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME2, dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME_E2
FROM         dbo.CUSTOMER_SME01_VIEW LEFT OUTER JOIN
                      dbo.CM_SECTION AS SECTION ON dbo.CUSTOMER_SME01_VIEW.CM_CODE = SECTION.EMP_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[32] 2[19] 3) )"
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
         Begin Table = "CUSTOMER_SME01_VIEW"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 260
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 28
         End
         Begin Table = "SECTION"
            Begin Extent = 
               Top = 1
               Left = 381
               Bottom = 248
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 36
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2190
         Width = 2325
         Width = 2430
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4275
         Alias = 2385
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_01_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_01_WITH_LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_01_WITH_LEVEL';

