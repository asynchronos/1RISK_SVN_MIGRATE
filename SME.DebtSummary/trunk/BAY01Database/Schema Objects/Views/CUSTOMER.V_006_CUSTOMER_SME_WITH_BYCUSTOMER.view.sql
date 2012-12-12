CREATE VIEW CUSTOMER.V_006_CUSTOMER_SME_WITH_BYCUSTOMER
AS
SELECT     V03.CIF, V03.CUSTOMER_NAME, V03.CUSTOMER_NAME_E, V03.GROUP_ID, V03.GROUP_SIZE_ID, V03.GROUP_SIZE_DESC, V03.GROUP_EXPOSURE,
                       V03.MAIN_CIF, V03.SIZE_ID, V03.SIZE_DETAIL, V03.STATUS_ID, V03.STATUS_DETAIL, V03.CM_EMP_ID, V03.CM_TITLE_NAME, V03.CM_FIRSTNAME, 
                      V03.CM_LASTNAME, V03.CM_TITLE_NAME_E, V03.CM_FIRSTNAME_E, V03.CM_LASTNAME_E, V03.CM_CONTROLLING, V03.HEAD_EMP_ID, 
                      V03.HEAD_TITLE_NAME, V03.HEAD_FIRSTNAME, V03.HEAD_LASTNAME, V03.HEAD_TITLE_NAME_E, V03.HEAD_FIRSTNAME_E, 
                      V03.HEAD_LASTNAME_E, V03.MANAGER_EMP_ID, V03.MANAGER_TITLE_NAME, V03.MANAGER_FIRSTNAME, V03.MANAGER_LASTNAME, 
                      V03.MANAGER_TITLE_NAME_E, V03.MANAGER_FIRSTNAME_E, V03.MANAGER_LASTNAME_E, V03.OLD_CM_EMP_ID, V03.OLD_CM_TITLE_NAME, 
                      V03.OLD_CM_FIRSTNAME, V03.OLD_CM_LASTNAME, V03.BRANCH_ID, V03.BRANCH_DESC, V03.BRANCH_DESC_TH, V03.REGION_ID, 
                      V03.REGION_DESC, V03.REGION_DESC_TH, V03.JUDGEMENT_ID, V03.JUDGEMENT_DESC, V03.BUSI_RISK1_ID, V03.BUSI_RISK1_DESC, 
                      V03.BUSI_RISK1_DESC_EN, V03.BUSI_RISK2_ID, V03.BUSI_RISK2_DESC, V03.BUSI_RISK2_DESC_EN, V03.BUSI_RISK3_ID, V03.BUSI_RISK3_DESC, 
                      V03.BUSI_RISK3_DESC_EN, V03.BUSINESS_DESTINATION_ID, V03.BUSINESS_DESTINATION_DESC, V03.EXPORT_WEIGHT, V03.LOCAL_WEIGHT, 
                      V03.UPDATE_DATE, V03.UPDATED_EMP_ID, V03.UPDATED_EMP_TITLE, V03.UPDATED_EMP_FIRSTNAME, V03.UPDATED_EMP_LASTNAME, 
                      V03.RATING_KEY, V03.RATING_DESC, V03.RATING_UPDATE_DATE, V03.EXTERNAL_SOURCE_MEMO, V03.NEXT_REVIEW_DATE, V03.BAYRATING, 
                      V03.RATING, V03.CLASS, V03.DEPTFLAG, V03.DEPTTRAN, V03.CONTROLLING_UNIT_BRANCH, V03.CONTROLLING_UNIT, V03.EIGHT_UP, 
                      V03.EIGHT_UP_NAME, CASE WHEN ByCus.CIF IS NULL THEN NULL ELSE D .ASOF END AS ByCustomer_ASOF, ByCus.Rating AS BYCUS_RATING, 
                      ByCus.Class AS BYCUS_CLASS, ByCus.BaySize, ByCus.BranchMaxPrin, ByCus.Principal, ByCus.Accru, ByCus.Susp, ByCus.NplFlag, ByCus.TdrFlag, 
                      ByCus.AgingMax, ByCus.AO_SME
FROM         CUSTOMER.V_003_CUSTOMER_SME AS V03 LEFT OUTER JOIN
                      dbo.ByCus_CIF AS ByCus ON V03.CIF = ByCus.Cif CROSS JOIN
                      dbo.DEBTDATE AS D
WHERE     (D.Upd_TABLE = 'ByCus_CIF')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[13] 3) )"
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
         Begin Table = "V03"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 217
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 68
         End
         Begin Table = "ByCus"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 216
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 7
               Left = 597
               Bottom = 143
               Right = 771
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 86
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_006_CUSTOMER_SME_WITH_BYCUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4695
         Alias = 1590
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
End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_006_CUSTOMER_SME_WITH_BYCUSTOMER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_006_CUSTOMER_SME_WITH_BYCUSTOMER';

