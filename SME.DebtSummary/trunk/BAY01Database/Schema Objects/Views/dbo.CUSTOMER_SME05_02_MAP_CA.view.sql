CREATE VIEW dbo.CUSTOMER_SME05_02_MAP_CA
AS
SELECT     dbo.CUSTOMER_SME02_01_WITH_LEVEL.CIF, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CM_CODE, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CM_NAME, dbo.CUSTOMER_SME02_01_WITH_LEVEL.LEVEL_NAME, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.LEVEL_NAME_NO_HUB, dbo.CUSTOMER_SME02_01_WITH_LEVEL.OLD_CM_CODE, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.OLD_CM_NAME, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BRANCH_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BRANCH_NAME, dbo.CUSTOMER_SME02_01_WITH_LEVEL.Id_Region, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.Region_Name, dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_SIZE_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.GROUP_SIZE_DETAIL, dbo.CUSTOMER_SME02_01_WITH_LEVEL.JUDGEMENT_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.JUDGEMENT_DETAIL, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK1_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK2_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK2_DETAIL, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK3_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_RISK3_DETAIL, dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_BY, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_BY_NAME, dbo.CUSTOMER_SME02_01_WITH_LEVEL.UPDATE_DATE, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSI_TYPE_CIM, dbo.CUSTOMER_SME02_01_WITH_LEVEL.DEPTFLAG, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.DEPTTRAN, dbo.CUSTOMER_SME02_01_WITH_LEVEL.CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.REGION_CONTROLLING_UNIT, dbo.CUSTOMER_SME_LAST_CA.LAST_PROCESS, 
                      dbo.CUSTOMER_SME_LAST_CA.LAST_PROCESS_DATE, dbo.ANNALS_JOB_TYPE.Job_Type, dbo.CUSTOMER_SME_LAST_CA.CA_NO_ID, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSINESS_DESTINATION_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.BUSINESS_DESTINATION_DESC, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.EXPORT_WEIGHT, dbo.CUSTOMER_SME02_01_WITH_LEVEL.LOCAL_WEIGHT, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.STATUS_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.STATUS_DETAIL, 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.SIZE_ID, dbo.CUSTOMER_SME02_01_WITH_LEVEL.SIZE_DETAIL, 
                      dbo.ANNALS_CREDIT.Send_To_Board
FROM         dbo.CUSTOMER_SME02_01_WITH_LEVEL LEFT OUTER JOIN
                      dbo.CUSTOMER_SME_LAST_CA INNER JOIN
                      dbo.ANNALS_CREDIT ON dbo.CUSTOMER_SME_LAST_CA.OLD_ID = dbo.ANNALS_CREDIT.ID ON 
                      dbo.CUSTOMER_SME02_01_WITH_LEVEL.CIF = dbo.CUSTOMER_SME_LAST_CA.CIF LEFT OUTER JOIN
                      dbo.ANNALS_JOB_TYPE ON dbo.ANNALS_CREDIT.Job_Type_Id = dbo.ANNALS_JOB_TYPE.Job_Type_Id

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[63] 4[4] 2[15] 3) )"
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
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
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
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -476
      End
      Begin Tables = 
         Begin Table = "CUSTOMER_SME02_01_WITH_LEVEL"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 253
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 27
         End
         Begin Table = "CUSTOMER_SME_LAST_CA"
            Begin Extent = 
               Top = 6
               Left = 298
               Bottom = 253
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 1
               Left = 701
               Bottom = 249
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ANNALS_JOB_TYPE"
            Begin Extent = 
               Top = 0
               Left = 920
               Bottom = 85
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 48
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME05_02_MAP_CA';


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
         Width = 1740
         Width = 1860
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
      PaneHidden = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME05_02_MAP_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME05_02_MAP_CA';

