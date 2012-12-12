CREATE VIEW dbo.[CUSTOMER_SME09_P'NOI]
AS
SELECT     dbo.CUSTOMER_SME01_VIEW.CIF, dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME, dbo.CUSTOMER_SME01_VIEW.GROUP_ID, 
                      dbo.CUSTOMER_SME01_VIEW.CM_CODE, dbo.CUSTOMER_SME01_VIEW.CM_NAME, dbo.CUSTOMER_SME01_VIEW.OLD_CM_CODE, 
                      dbo.CUSTOMER_SME01_VIEW.OLD_CM_NAME, dbo.CUSTOMER_SME01_VIEW.BRANCH_ID, dbo.CUSTOMER_SME01_VIEW.BRANCH_NAME, 
                      dbo.CUSTOMER_SME01_VIEW.Id_Region, dbo.CUSTOMER_SME01_VIEW.Region_Name, dbo.CUSTOMER_SME01_VIEW.GROUP_SIZE_ID, 
                      dbo.CUSTOMER_SME01_VIEW.GROUP_SIZE_DETAIL, dbo.CUSTOMER_SME01_VIEW.JUDGEMENT_ID, 
                      dbo.CUSTOMER_SME01_VIEW.JUDGEMENT_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_DETAIL, dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_DETAIL, dbo.CUSTOMER_SME01_VIEW.UPDATE_BY, 
                      dbo.CUSTOMER_SME01_VIEW.UPDATE_BY_NAME, dbo.CUSTOMER_SME01_VIEW.UPDATE_DATE, dbo.CUSTOMER_SME01_VIEW.BUSI_TYPE_CIM, 
                      dbo.CUSTOMER_SME01_VIEW.DEPTFLAG, dbo.CUSTOMER_SME01_VIEW.DEPTTRAN, dbo.CUSTOMER_SME01_VIEW.CONTROLLING_UNIT, 
                      dbo.CUSTOMER_SME01_VIEW.REGION_CONTROLLING_UNIT, dbo.CUSTOMER_SME01_VIEW.BUSINESS_DESTINATION_ID, 
                      dbo.CUSTOMER_SME01_VIEW.BUSINESS_DESTINATION_DESC, dbo.CUSTOMER_SME01_VIEW.EXPORT_WEIGHT, 
                      dbo.CUSTOMER_SME01_VIEW.LOCAL_WEIGHT, dbo.CUSTOMER_SME01_VIEW.STATUS_ID, dbo.CUSTOMER_SME01_VIEW.STATUS_DETAIL, 
                      dbo.CUSTOMER_SME01_VIEW.SIZE_ID, dbo.CUSTOMER_SME01_VIEW.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME07_LAST_CA_ONLY_APPROVE.CA_NO_ID, dbo.Detail.Tdr, dbo.Detail.Branch_T, dbo.Detail.Class, dbo.Detail.ByCustomer_AGING, 
                      dbo.Detail.ByCusDaily_AGING, dbo.Detail.AgingTxt, dbo.Detail.Principal, dbo.Detail.Accru, dbo.Detail.Susp, dbo.Detail.PAY_PRIN, dbo.Detail.PAY_INT, 
                      dbo.Detail.PAY_SUSP
FROM         dbo.CUSTOMER_SME01_VIEW INNER JOIN
                      dbo.CUSTOMER_SME07_LAST_CA_ONLY_APPROVE ON 
                      dbo.CUSTOMER_SME01_VIEW.CIF = dbo.CUSTOMER_SME07_LAST_CA_ONLY_APPROVE.CIF LEFT OUTER JOIN
                      dbo.Detail ON dbo.CUSTOMER_SME01_VIEW.CIF = dbo.Detail.Cif
WHERE     (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010199') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010201') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010202') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010203') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010204') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010299') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010301') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010302') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010303') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010304') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010305') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010306') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010307') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '7010399') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '9010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '9010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '9010103') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_ID = '9010104') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010199') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010201') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010202') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010203') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010204') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010299') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010301') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010302') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010303') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010304') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010305') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010306') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010307') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '7010399') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '9010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '9010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '9010103') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK2_ID = '9010104') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010199') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010201') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010202') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010203') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010204') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010299') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010301') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010302') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010303') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010304') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010305') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010306') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010307') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '7010399') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '9010101') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '9010102') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '9010103') OR
                      (dbo.CUSTOMER_SME01_VIEW.BUSI_RISK3_ID = '9010104')

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
         Begin Table = "CUSTOMER_SME01_VIEW"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 239
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME07_LAST_CA_ONLY_APPROVE"
            Begin Extent = 
               Top = 8
               Left = 36
               Bottom = 240
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "Detail"
            Begin Extent = 
               Top = 6
               Left = 529
               Bottom = 239
               Right = 706
            End
            DisplayFlags = 280
            TopColumn = 15
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 65
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
         Width = 4140
         Width = 1500
         Width = 3450
         Width = 1500
         Width = 3450
         Width = 1500
         Width = 2175
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2295
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2340
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
         Width = 2400
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2460
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 68
         Column = 2340
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1755
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI';

