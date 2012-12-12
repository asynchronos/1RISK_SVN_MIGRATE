CREATE VIEW dbo.CUSTOMER_SME00_ALL_STATUS
AS
SELECT dbo.CUSTOMER_SME.CIF, dbo.GetName(dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST) 
               AS CUSTOMER_NAME, ISNULL(dbo.CUSTOMER.CUS_FIRST, N'') + ' ' + ISNULL(dbo.CUSTOMER.CUS_LAST, N'') AS CUSTOMER_NAME2, 
               dbo.GetNameEng(dbo.CUSTOMER.CTITLE_E, dbo.CUSTOMER.CFIRST_E, dbo.CUSTOMER.CLAST_E) AS CUSTOMER_NAME_E, 
               ISNULL(dbo.CUSTOMER.CFIRST_E, N'') + ISNULL(dbo.CUSTOMER.CLAST_E, N'') AS CUSTOMER_NAME_E2, dbo.CUSTOMER_SME.GROUP_ID, 
               dbo.CUSTOMER_SME.CM_CODE, dbo.GetName(CM_TITLE.TITLE_NAME, CM.EMPNAME, CM.EMPSURNAME) AS CM_NAME, 
               dbo.GetName(CM_TITLE.TITLE_NAME_E, CM.EMPNAME_E, CM.EMPSURNAME_E) AS CM_NAME_E, dbo.CUSTOMER_SME.OLD_CM_CODE, 
               dbo.GetName(OLD_CM_TITLE.TITLE_NAME, OLD_CM.EMPNAME, OLD_CM.EMPSURNAME) AS OLD_CM_NAME, 
               dbo.GetName(OLD_CM_TITLE.TITLE_NAME_E, OLD_CM.EMPNAME_E, OLD_CM.EMPSURNAME_E) AS OLD_CM_NAME_E, 
               dbo.CUSTOMER_SME.BRANCH_ID, dbo.Id_Branch.Branch_T AS BRANCH_NAME, dbo.Id_Branch.Id_Region, dbo.Id_Region.Region_Name, 
               CASE WHEN REGION10_DESC.DESCRIPTION IS NOT NULL 
               THEN REGION10_DESC.DESCRIPTION ELSE Id_Region.Region_Name END AS REGION_NAME2, 
               ISNULL(dbo.CUSTOMER_SME_GROUP.GROUP_SIZE_ID, 1) AS GROUP_SIZE_ID, dbo.GROUP_SIZE.DESCRIPTION AS GROUP_SIZE_DETAIL, 
               dbo.CUSTOMER_SME_GROUP.GROUP_EXPOSURE, dbo.CUSTOMER_SME.NEXT_REVIEW_DATE, ISNULL(dbo.CUSTOMER_SME.JUDGEMENT_ID, 
               N'000') AS JUDGEMENT_ID, dbo.ANNALS_JUDGEMENT.Judgement AS JUDGEMENT_DETAIL, dbo.CUSTOMER_SME.BUSI_RISK1_ID, 
               BUSI_RISK1.DESCRIPTION AS BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME.BUSI_RISK2_ID, BUSI_RISK2.DESCRIPTION AS BUSI_RISK2_DETAIL, 
               dbo.CUSTOMER_SME.BUSI_RISK3_ID, BUSI_RISK3.DESCRIPTION AS BUSI_RISK3_DETAIL, dbo.CUSTOMER_SME.UPDATE_BY, 
               ISNULL(UPDATE_BY_TITLE.TITLE_NAME, N'') + ISNULL(UPDATE_BY.EMPNAME, N'') + N' ' + ISNULL(UPDATE_BY.EMPSURNAME, N'') 
               AS UPDATE_BY_NAME, dbo.CUSTOMER_SME.UPDATE_DATE, dbo.CUSTOMER.BUSI_TYPE AS BUSI_TYPE_CIM, dbo.CUSTOMER.DEPTFLAG, 
               dbo.CUSTOMER.DEPTTRAN, RIGHT('000000' + CONVERT(varchar, dbo.CUSTOMER.OFFICR_ID), 6) AS OFFICR_ID, dbo.GetName(OFFICR.TITLE_NAME, 
               OFFICR.EMPNAME, OFFICR.EMPSURNAME) AS OFFICR_NAME, DEPTBR.DepTranT AS CONTROLLING_UNIT, 
               DEPTBR.DepTranE AS CONTROLLING_UNIT_E, DEPTBR.Region AS REGION_CONTROLLING_UNIT, 
               dbo.CUSTOMER_SME.BUSINESS_DESTINATION_ID, dbo.BUSINESS_DESTINATION.BUSINESS_DESTINATION_DESC, 
               dbo.CUSTOMER_SME.EXPORT_WEIGHT, dbo.CUSTOMER_SME.LOCAL_WEIGHT, dbo.CUSTOMER_SME.STATUS_ID, 
               dbo.CUSTOMER_STATUS.STATUS_DETAIL, dbo.CUSTOMER_SME.SIZE_ID, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, 
               ISNULL(dbo.CUSTOMER_SME.RATING_TYPE_KEY, 1) AS RATING_TYPE_KEY, ISNULL(dbo.CUSTOMER_SME.RATING_KEY, 1) AS RATING_KEY, 
               dbo.CUSTOMER_SME.RATING_UPDATE_DATE, L.CATEGORY_VALUE_LINK AS OLD_REGION_ID, 
               L.CATEGORY_DESC_TH_LINK AS OLD_REGION_NAME
FROM  dbo.REGION10_DESC RIGHT OUTER JOIN
               dbo.Id_Region INNER JOIN
               dbo.Id_Branch ON dbo.Id_Region.Id_Region = dbo.Id_Branch.Id_Region ON 
               dbo.REGION10_DESC.BRANCH_KEY = dbo.Id_Branch.Id_Branch RIGHT OUTER JOIN
               dbo.ANNALS_JUDGEMENT RIGHT OUTER JOIN
               dbo.TB_EMPLOYEE AS UPDATE_BY INNER JOIN
               dbo.TB_TITLE AS UPDATE_BY_TITLE ON UPDATE_BY.TITLE_CODE = UPDATE_BY_TITLE.TITLE_CODE RIGHT OUTER JOIN
               dbo.BUSINESS_DESTINATION RIGHT OUTER JOIN
               dbo.CUSTOMER_SME LEFT OUTER JOIN
               dbo.CUSTOMER_SME_SIZE ON dbo.CUSTOMER_SME.SIZE_ID = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
               dbo.CUSTOMER_STATUS ON dbo.CUSTOMER_SME.STATUS_ID = dbo.CUSTOMER_STATUS.STATUS_ID LEFT OUTER JOIN
                   (SELECT CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_TYPE_KEY, PRIORITY, DEL_FLAG, 
                                   LINKED_TYPE_KEY, CATEGORY_RECURSIVE_DEL_FLAG, CATEGORY_KEY_LINK, CATEGORY_DESC_LINK, CATEGORY_DESC_TH_LINK, 
                                   CATEGORY_VALUE_LINK, CATEGORY_TYPE_KEY_LINK, PRIORITY_LINK, DEL_FLAG_LINK
                    FROM   CLASSIFY.V_004_LINKED_CATEGORY_TYPE_2_INFO
                    WHERE (CATEGORY_TYPE_KEY = 2) AND (CATEGORY_TYPE_KEY_LINK = 7)) AS L ON dbo.CUSTOMER_SME.BRANCH_ID = CONVERT(int, 
               L.CATEGORY_VALUE) ON dbo.BUSINESS_DESTINATION.BUSINESS_DESTINATION_ID = dbo.CUSTOMER_SME.BUSINESS_DESTINATION_ID ON 
               UPDATE_BY.EMP_ID = dbo.CUSTOMER_SME.UPDATE_BY LEFT OUTER JOIN
               dbo.BUSINESS_TYPE_4 AS BUSI_RISK3 ON dbo.CUSTOMER_SME.BUSI_RISK3_ID = BUSI_RISK3.TYPE4_ID LEFT OUTER JOIN
               dbo.BUSINESS_TYPE_4 AS BUSI_RISK2 ON dbo.CUSTOMER_SME.BUSI_RISK2_ID = BUSI_RISK2.TYPE4_ID LEFT OUTER JOIN
               dbo.BUSINESS_TYPE_4 AS BUSI_RISK1 ON dbo.CUSTOMER_SME.BUSI_RISK1_ID = BUSI_RISK1.TYPE4_ID ON CONVERT(int, 
               dbo.ANNALS_JUDGEMENT.ID) = CONVERT(smallint, ISNULL(dbo.CUSTOMER_SME.JUDGEMENT_ID, N'000')) ON 
               dbo.Id_Branch.Id_Branch = dbo.CUSTOMER_SME.BRANCH_ID LEFT OUTER JOIN
               dbo.TB_EMPLOYEE AS OLD_CM INNER JOIN
               dbo.TB_TITLE AS OLD_CM_TITLE ON OLD_CM.TITLE_CODE = OLD_CM_TITLE.TITLE_CODE ON 
               dbo.CUSTOMER_SME.OLD_CM_CODE = OLD_CM.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS OFFICR RIGHT OUTER JOIN
               dbo.Id_DepBranch AS DEPTBR RIGHT OUTER JOIN
               dbo.CUSTOMER ON DEPTBR.Flag = dbo.CUSTOMER.DEPTFLAG AND DEPTBR.Id_DepTran = dbo.CUSTOMER.DEPTTRAN ON 
               OFFICR.EMP_ID = RIGHT('000000' + CONVERT(varchar, dbo.CUSTOMER.OFFICR_ID), 6) ON 
               dbo.CUSTOMER_SME.CIF = dbo.CUSTOMER.CIF LEFT OUTER JOIN
               dbo.TB_TITLE AS CM_TITLE INNER JOIN
               dbo.TB_EMPLOYEE AS CM ON CM_TITLE.TITLE_CODE = CM.TITLE_CODE ON dbo.CUSTOMER_SME.CM_CODE = CM.EMP_ID LEFT OUTER JOIN
               dbo.GROUP_SIZE INNER JOIN
               dbo.CUSTOMER_SME_GROUP ON dbo.GROUP_SIZE.GROUP_SIZE_ID = ISNULL(dbo.CUSTOMER_SME_GROUP.GROUP_SIZE_ID, 1) ON 
               dbo.CUSTOMER_SME.GROUP_ID = dbo.CUSTOMER_SME_GROUP.GROUP_ID

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
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = -380
      End
      Begin Tables = 
         Begin Table = "REGION10_DESC"
            Begin Extent = 
               Top = 2
               Left = 1239
               Bottom = 87
               Right = 1391
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 118
               Left = 1076
               Bottom = 233
               Right = 1229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 119
               Left = 876
               Bottom = 234
               Right = 1045
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_JUDGEMENT"
            Begin Extent = 
               Top = 2
               Left = 411
               Bottom = 102
               Right = 563
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UPDATE_BY"
            Begin Extent = 
               Top = 448
               Left = 847
               Bottom = 563
               Right = 1012
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UPDATE_BY_TITLE"
            Begin Extent = 
               Top = 523
               Left = 1042
               Bottom = 623
               Right = 1196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSINESS_DESTINATION"
            Begin Extent = 
               Top = 339
               Left = 1228
               Bottom = 439', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME00_ALL_STATUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Right = 1463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME"
            Begin Extent = 
               Top = 150
               Left = 596
               Bottom = 601
               Right = 816
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 400
               Left = 1064
               Bottom = 500
               Right = 1216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_STATUS"
            Begin Extent = 
               Top = 546
               Left = 407
               Bottom = 646
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 541
               Left = 895
               Bottom = 677
               Right = 1180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSI_RISK3"
            Begin Extent = 
               Top = 251
               Left = 1051
               Bottom = 366
               Right = 1219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSI_RISK2"
            Begin Extent = 
               Top = 181
               Left = 1233
               Bottom = 296
               Right = 1401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSI_RISK1"
            Begin Extent = 
               Top = 425
               Left = 398
               Bottom = 540
               Right = 566
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OLD_CM"
            Begin Extent = 
               Top = 306
               Left = 400
               Bottom = 421
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OLD_CM_TITLE"
            Begin Extent = 
               Top = 353
               Left = 217
               Bottom = 453
               Right = 371
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OFFICR"
            Begin Extent = 
               Top = 106
               Left = 0
               Bottom = 300
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DEPTBR"
            Begin Extent = 
               Top = 6
               Left = 203
               Bottom = 121
               Right = 381
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 107
               Left = 413
               Bottom = 302
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 34
         End
         Begin Table = "CM_TITLE"
            Begin Extent = 
               Top = 559
               Left = 195
               Bottom = 659
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM"
            Begin Extent = 
               Top = 307
               Left = 0
               Bottom = 422
               Right = 165', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME00_ALL_STATUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GROUP_SIZE"
            Begin Extent = 
               Top = 0
               Left = 1035
               Bottom = 115
               Right = 1196
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CUSTOMER_SME_GROUP"
            Begin Extent = 
               Top = 3
               Left = 845
               Bottom = 117
               Right = 1016
            End
            DisplayFlags = 280
            TopColumn = 4
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
         Width = 1800
         Width = 6444
         Width = 1500
         Width = 1500
         Width = 2796
         Width = 3048
         Width = 1500
         Width = 2352
         Width = 2340
         Width = 1500
         Width = 1740
         Width = 2376
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1956
         Width = 2352
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2748
         Width = 2748
         Width = 3420
         Width = 2052
         Width = 2352
         Width = 2580
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 9792
         Alias = 2832
         Table = 2316
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME00_ALL_STATUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME00_ALL_STATUS';

