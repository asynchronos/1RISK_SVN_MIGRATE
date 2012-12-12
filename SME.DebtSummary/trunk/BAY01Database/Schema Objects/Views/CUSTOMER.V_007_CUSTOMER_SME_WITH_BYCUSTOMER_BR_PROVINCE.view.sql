CREATE VIEW CUSTOMER.V_007_CUSTOMER_SME_WITH_BYCUSTOMER_BR_PROVINCE
AS
SELECT     SME.CIF, SME.CUSTOMER_NAME, SME.CUSTOMER_NAME_E, SME.GROUP_ID, SME.GROUP_SIZE_ID, SME.GROUP_SIZE_DESC, 
                      SME.GROUP_EXPOSURE, SME.MAIN_CIF, SME.SIZE_ID, SME.SIZE_DETAIL, SME.STATUS_ID, SME.STATUS_DETAIL, SME.CM_EMP_ID, 
                      SME.CM_TITLE_NAME, SME.CM_FIRSTNAME, SME.CM_LASTNAME, SME.CM_TITLE_NAME_E, SME.CM_FIRSTNAME_E, SME.CM_LASTNAME_E, 
                      SME.CM_CONTROLLING, SME.HEAD_EMP_ID, SME.HEAD_TITLE_NAME, SME.HEAD_FIRSTNAME, SME.HEAD_LASTNAME, 
                      SME.HEAD_TITLE_NAME_E, SME.HEAD_FIRSTNAME_E, SME.HEAD_LASTNAME_E, SME.MANAGER_EMP_ID, SME.MANAGER_TITLE_NAME, 
                      SME.MANAGER_FIRSTNAME, SME.MANAGER_LASTNAME, SME.MANAGER_TITLE_NAME_E, SME.MANAGER_FIRSTNAME_E, 
                      SME.MANAGER_LASTNAME_E, SME.OLD_CM_EMP_ID, SME.OLD_CM_TITLE_NAME, SME.OLD_CM_FIRSTNAME, SME.OLD_CM_LASTNAME, 
                      SME.BRANCH_ID, SME.BRANCH_DESC, SME.BRANCH_DESC_TH, SME.REGION_ID, SME.REGION_DESC, SME.REGION_DESC_TH, 
                      SME.JUDGEMENT_ID, SME.JUDGEMENT_DESC, SME.BUSI_RISK1_ID, SME.BUSI_RISK1_DESC, SME.BUSI_RISK1_DESC_EN, SME.BUSI_RISK2_ID, 
                      SME.BUSI_RISK2_DESC, SME.BUSI_RISK2_DESC_EN, SME.BUSI_RISK3_ID, SME.BUSI_RISK3_DESC, SME.BUSI_RISK3_DESC_EN, 
                      SME.BUSINESS_DESTINATION_ID, SME.BUSINESS_DESTINATION_DESC, SME.EXPORT_WEIGHT, SME.LOCAL_WEIGHT, SME.UPDATE_DATE, 
                      SME.UPDATED_EMP_ID, SME.UPDATED_EMP_TITLE, SME.UPDATED_EMP_FIRSTNAME, SME.UPDATED_EMP_LASTNAME, SME.RATING_KEY, 
                      SME.RATING_DESC, SME.RATING_UPDATE_DATE, SME.EXTERNAL_SOURCE_MEMO, SME.NEXT_REVIEW_DATE, SME.BAYRATING, SME.RATING, 
                      SME.CLASS, SME.DEPTFLAG, SME.DEPTTRAN, SME.CONTROLLING_UNIT_BRANCH, SME.CONTROLLING_UNIT, SME.EIGHT_UP, 
                      SME.EIGHT_UP_NAME, SME.ByCustomer_ASOF, SME.BYCUS_RATING, SME.BYCUS_CLASS, SME.BaySize, SME.BranchMaxPrin, SME.Principal, 
                      SME.Accru, SME.Susp, SME.TdrFlag, SME.AgingMax, SME.NplFlag, EDW_AUTO_BRANCH.LOCATION_PROVINCE_TH, SME.AO_SME
FROM         CUSTOMER.V_006_CUSTOMER_SME_WITH_BYCUSTOMER AS SME LEFT OUTER JOIN
                          (SELECT     BRANCH_KEY, BRANCH_CODE, BRANCH_NAME_THAI, BRANCH_NAME_ENG, LOCATION_AUMPHOR_TH, LOCATION_AUMPHOR, 
                                                   CONVERT(VARCHAR, AUTO_BRANCH_1.LOCATION_PROVINCE_TH) AS LOCATION_PROVINCE_TH, LOCATION_PROVINCE, 
                                                   LOCATION_REGION_TH, LOCATION_REGION
                            FROM          EDW..DWHADMIN.AUTO_BRANCH AS AUTO_BRANCH_1
                            WHERE      (LOCATION_AUMPHOR_TH IS NOT NULL)) AS EDW_AUTO_BRANCH ON SME.BRANCH_ID = EDW_AUTO_BRANCH.BRANCH_CODE

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
         Begin Table = "SME"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 77
         End
         Begin Table = "EDW_AUTO_BRANCH"
            Begin Extent = 
               Top = 40
               Left = 304
               Bottom = 155
               Right = 513
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
      Begin ColumnWidths = 10
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2070
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
End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_007_CUSTOMER_SME_WITH_BYCUSTOMER_BR_PROVINCE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_007_CUSTOMER_SME_WITH_BYCUSTOMER_BR_PROVINCE';

