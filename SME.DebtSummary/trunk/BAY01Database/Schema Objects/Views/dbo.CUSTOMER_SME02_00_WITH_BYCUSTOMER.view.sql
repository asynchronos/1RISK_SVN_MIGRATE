CREATE VIEW dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER
AS
SELECT SME00.CIF, SME00.CUSTOMER_NAME, SME00.CUSTOMER_NAME2, SME00.CUSTOMER_NAME_E, SME00.CUSTOMER_NAME_E2, SME00.GROUP_ID, 
               SME00.CM_CODE, SME00.CM_NAME, SME00.CM_NAME_E, SME00.OLD_CM_CODE, SME00.OLD_CM_NAME, SME00.OLD_CM_NAME_E, 
               SME00.BRANCH_ID, SME00.BRANCH_NAME, SME00.Id_Region, SME00.Region_Name, SME00.REGION_NAME2, SME00.GROUP_SIZE_ID, 
               SME00.GROUP_SIZE_DETAIL, SME00.JUDGEMENT_ID, SME00.JUDGEMENT_DETAIL, SME00.BUSI_RISK1_ID, SME00.BUSI_RISK1_DETAIL, 
               SME00.BUSI_RISK2_ID, SME00.BUSI_RISK2_DETAIL, SME00.BUSI_RISK3_ID, SME00.BUSI_RISK3_DETAIL, SME00.UPDATE_BY, 
               SME00.UPDATE_BY_NAME, SME00.UPDATE_DATE, SME00.BUSI_TYPE_CIM, SME00.DEPTFLAG, SME00.DEPTTRAN, SME00.CONTROLLING_UNIT, 
               SME00.REGION_CONTROLLING_UNIT, SME00.BUSINESS_DESTINATION_ID, SME00.BUSINESS_DESTINATION_DESC, SME00.EXPORT_WEIGHT, 
               SME00.LOCAL_WEIGHT, SME00.STATUS_ID, SME00.STATUS_DETAIL, SME00.SIZE_ID, SME00.SIZE_DETAIL, CASE WHEN ByCus.CIF IS NULL 
               THEN NULL ELSE D .ASOF END AS ByCustomer_ASOF, ByCus.BaySize, ByCus.Rating, ByCus.Busi_Type, ByCus.Tdr, ByCus.Class, ByCus.AGING, 
               ByCus.Limit, ByCus.Principal, ByCus.Accru, ByCus.Susp, ByCus.NPLFLAG, SME00.OLD_REGION_ID, SME00.OLD_REGION_NAME
FROM  dbo.CUSTOMER_SME00_ALL_STATUS AS SME00 LEFT OUTER JOIN
               dbo.ByCustomer AS ByCus ON SME00.CIF = ByCus.Cif CROSS JOIN
               dbo.DEBTDATE AS D
WHERE (D.Upd_TABLE = 'ByCustomer')

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
         Begin Table = "ByCus"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 238
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 514
               Bottom = 158
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SME00"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 8
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_BYCUSTOMER';


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
         Column = 2016
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_BYCUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME02_00_WITH_BYCUSTOMER';

