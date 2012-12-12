CREATE VIEW CUSTOMER.V_003_CUSTOMER_SME
AS
SELECT SME.CIF, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS CUSTOMER_NAME, dbo.GetNameEng(CUS.CTITLE_E, 
               CUS.CFIRST_E, CUS.CLAST_E) AS CUSTOMER_NAME_E, SME.GROUP_ID, GROUP_DETAIL.GROUP_SIZE_ID, GROUP_DETAIL.GROUP_SIZE_DESC, 
               GROUP_DETAIL.GROUP_EXPOSURE, GROUP_DETAIL.MAIN_CIF, SME.SIZE_ID, SIZE.SIZE_DETAIL, SME.STATUS_ID, STATUS.STATUS_DETAIL, 
               SME.CM_CODE AS CM_EMP_ID, O.TITLE_NAME AS CM_TITLE_NAME, O.EMPNAME AS CM_FIRSTNAME, O.EMPSURNAME AS CM_LASTNAME, 
               O.TITLE_NAME_E AS CM_TITLE_NAME_E, O.EMPNAME_E AS CM_FIRSTNAME_E, O.EMPSURNAME_E AS CM_LASTNAME_E, 
               O.CATEGORY_DESC AS CM_CONTROLLING, O.HEAD_EMP_ID, HEAD_EMP.TITLE_NAME AS HEAD_TITLE_NAME, 
               HEAD_EMP.EMPNAME AS HEAD_FIRSTNAME, HEAD_EMP.EMPSURNAME AS HEAD_LASTNAME, 
               HEAD_EMP.TITLE_NAME_E AS HEAD_TITLE_NAME_E, HEAD_EMP.EMPNAME_E AS HEAD_FIRSTNAME_E, 
               HEAD_EMP.EMPSURNAME_E AS HEAD_LASTNAME_E, O.MANAGER_EMP_ID, MANAGER_EMP.TITLE_NAME AS MANAGER_TITLE_NAME, 
               MANAGER_EMP.EMPNAME AS MANAGER_FIRSTNAME, MANAGER_EMP.EMPSURNAME AS MANAGER_LASTNAME, 
               MANAGER_EMP.TITLE_NAME_E AS MANAGER_TITLE_NAME_E, MANAGER_EMP.EMPNAME_E AS MANAGER_FIRSTNAME_E, 
               MANAGER_EMP.EMPSURNAME_E AS MANAGER_LASTNAME_E, SME.OLD_CM_CODE AS OLD_CM_EMP_ID, 
               OLD_CM.TITLE_NAME AS OLD_CM_TITLE_NAME, OLD_CM.EMPNAME AS OLD_CM_FIRSTNAME, OLD_CM.EMPSURNAME AS OLD_CM_LASTNAME, 
               SME.BRANCH_ID, BR_FROM_CATEGORY.BRANCH_DESC, BR_FROM_CATEGORY.BRANCH_DESC_TH, BR_FROM_CATEGORY.REGION_ID, 
               BR_FROM_CATEGORY.REGION_DESC, BR_FROM_CATEGORY.REGION_DESC_TH, SME.JUDGEMENT_ID, JUDG.Judgement AS JUDGEMENT_DESC, 
               SME.BUSI_RISK1_ID, BUSI_DESC1.DESCRIPTION_4 AS BUSI_RISK1_DESC, BUSI_DESC1.DESCRIPTION_EN_4 AS BUSI_RISK1_DESC_EN, 
               SME.BUSI_RISK2_ID, BUSI_DESC2.DESCRIPTION_4 AS BUSI_RISK2_DESC, BUSI_DESC2.DESCRIPTION_EN_4 AS BUSI_RISK2_DESC_EN, 
               SME.BUSI_RISK3_ID, BUSI_DESC3.DESCRIPTION_4 AS BUSI_RISK3_DESC, BUSI_DESC3.DESCRIPTION_EN_4 AS BUSI_RISK3_DESC_EN, 
               SME.BUSINESS_DESTINATION_ID, BUSI_DESTI.BUSINESS_DESTINATION_DESC, SME.EXPORT_WEIGHT, SME.LOCAL_WEIGHT, 
               SME.UPDATE_DATE, SME.UPDATE_BY AS UPDATED_EMP_ID, UPDATE_EMP.TITLE_NAME AS UPDATED_EMP_TITLE, 
               UPDATE_EMP.EMPNAME AS UPDATED_EMP_FIRSTNAME, UPDATE_EMP.EMPSURNAME AS UPDATED_EMP_LASTNAME, SME.RATING_KEY, 
               dbo.CUSTOMER_SME_RATING.RATING_DESC, SME.RATING_UPDATE_DATE, SME.EXTERNAL_SOURCE_MEMO, SME.NEXT_REVIEW_DATE, 
               CUS.BAYRATING, CUS.RATING, CUS.CLASS, CUS.DEPTFLAG, CUS.DEPTTRAN, 
               CLASSIFY.V_010_BRANCH.CATEGORY_DESC_TH AS CONTROLLING_UNIT_BRANCH, 
               CASE CUS.DEPTFLAG WHEN 1 THEN ISNULL(ISNULL(BRANCH_MAP_RM.Grp_RMSME, RM_CONTROLLING.CATEGORY_DESC_TH), 
               CLASSIFY.V_015_DEPARTMENT.CATEGORY_DESC_TH) WHEN 2 THEN ISNULL(BRANCH_MAP_RM.Grp_RMSME, 
               CLASSIFY.V_010_BRANCH.CATEGORY_DESC_TH) ELSE NULL END AS CONTROLLING_UNIT, BRANCH_MAP_RM.[8up] AS EIGHT_UP, 
               BRANCH_MAP_RM.[8up_name] AS EIGHT_UP_NAME
FROM  (SELECT Flag, Id_DepTran, DepTranT, ID, [8up], [8up_name], Section, Section_name, Grp_RMSME, RegionNew_No, RegionNewTx, VP_Branch, 
                              RegionType, RegionOld, Flag2, BranchCode, BranchName, SBC
               FROM   dbo.Id_DepBranch_NewRegion_Maping_RM) AS BRANCH_MAP_RM RIGHT OUTER JOIN
               dbo.CUSTOMER AS CUS ON BRANCH_MAP_RM.Flag = CUS.DEPTFLAG AND BRANCH_MAP_RM.Id_DepTran = CUS.DEPTTRAN LEFT OUTER JOIN
                   (SELECT CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_PRIORITY, CATEGORY_DEL_FLAG, 
                                   CATEGORY_TYPE_KEY, CATEGORY_TYPE_DESC, CATEGORY_TYPE_DESC_TH, CATEGORY_TYPE_VALUE, CATEGORY_TYPE_PRIORITY, 
                                   CATEGORY_TYPE_DEL_FLAG
                    FROM   CLASSIFY.V_002_CATEGORY_MAP_TYPE
                    WHERE (CATEGORY_TYPE_KEY = 12)) AS RM_CONTROLLING ON CUS.DEPTTRAN = RM_CONTROLLING.CATEGORY_VALUE LEFT OUTER JOIN
               CLASSIFY.V_015_DEPARTMENT ON CUS.DEPTTRAN = CLASSIFY.V_015_DEPARTMENT.CATEGORY_VALUE LEFT OUTER JOIN
               CLASSIFY.V_010_BRANCH ON CUS.DEPTTRAN = CLASSIFY.V_010_BRANCH.CATEGORY_VALUE RIGHT OUTER JOIN
               dbo.CUSTOMER_SME AS SME LEFT OUTER JOIN
               dbo.CUSTOMER_SME_RATING ON SME.RATING_KEY = dbo.CUSTOMER_SME_RATING.RATING_KEY LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS UPDATE_EMP ON SME.UPDATE_BY = UPDATE_EMP.EMP_ID LEFT OUTER JOIN
               dbo.BUSINESS_DESTINATION AS BUSI_DESTI ON SME.BUSINESS_DESTINATION_ID = BUSI_DESTI.BUSINESS_DESTINATION_ID LEFT OUTER JOIN
               dbo.BUSINESS_TYPE AS BUSI_DESC3 ON SME.BUSI_RISK3_ID = BUSI_DESC3.TYPE4_ID LEFT OUTER JOIN
               dbo.BUSINESS_TYPE AS BUSI_DESC2 ON SME.BUSI_RISK2_ID = BUSI_DESC2.TYPE4_ID LEFT OUTER JOIN
               dbo.BUSINESS_TYPE AS BUSI_DESC1 ON SME.BUSI_RISK1_ID = BUSI_DESC1.TYPE4_ID LEFT OUTER JOIN
               dbo.ANNALS_JUDGEMENT AS JUDG ON SME.JUDGEMENT_ID = JUDG.ID LEFT OUTER JOIN
                   (SELECT BRANCH_CATEGORY_KEY, BRANCH_DESC, BRANCH_DESC_TH, BRANCH_ID, BRANCH_CATEGORY_TYPE_KEY, BRANCH_PRIORITY, 
                                   BRANCH_DEL_FLAG, LINKED_MAP_DEL_FLAG, REGION_CATEGORY_KEY, REGION_DESC, REGION_DESC_TH, REGION_ID, 
                                   REGION_PRIORITY, REGION_DEL_FLAG, REGION_CATEGORY_TYPE_KEY
                    FROM   CLASSIFY.V_014_BRANCH_AND_REGION) AS BR_FROM_CATEGORY ON SME.BRANCH_ID = CONVERT(smallint, 
               BR_FROM_CATEGORY.BRANCH_ID) LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS OLD_CM ON SME.OLD_CM_CODE = OLD_CM.EMP_ID LEFT OUTER JOIN
               CUSTOMER.V_002_GROUP_SIZE_DETAIL AS GROUP_DETAIL ON SME.GROUP_ID = GROUP_DETAIL.GROUP_ID LEFT OUTER JOIN
               dbo.CUSTOMER_STATUS AS STATUS ON SME.STATUS_ID = STATUS.STATUS_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS HEAD_EMP INNER JOIN
               CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY AS O ON HEAD_EMP.EMP_ID = O.HEAD_EMP_ID INNER JOIN
               dbo.EMPLOYEE01 AS MANAGER_EMP ON O.MANAGER_EMP_ID = MANAGER_EMP.EMP_ID ON SME.CM_CODE = O.EMP_ID LEFT OUTER JOIN
               dbo.CUSTOMER_SME_SIZE AS SIZE ON SME.SIZE_ID = SIZE.SIZE_ID ON CUS.CIF = SME.CIF
WHERE (SME.CIF <> 0)

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
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SME"
            Begin Extent = 
               Top = 10
               Left = 19
               Bottom = 434
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_RATING"
            Begin Extent = 
               Top = 435
               Left = 48
               Bottom = 571
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UPDATE_EMP"
            Begin Extent = 
               Top = 446
               Left = 612
               Bottom = 582
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "BUSI_DESTI"
            Begin Extent = 
               Top = 669
               Left = 264
               Bottom = 787
               Right = 532
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BUSI_DESC3"
            Begin Extent = 
               Top = 585
               Left = 509
               Bottom = 721
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "BUSI_DESC2"
            Begin Extent = 
               Top = 585
               Left = 41
               Bottom = 721
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "BUSI_DESC1"
            Begin Extent = 
               Top = 584
               Left = 278
               Bottom = 720
               Right = 478', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_003_CUSTOMER_SME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "JUDG"
            Begin Extent = 
               Top = 568
               Left = 296
               Bottom = 686
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BR_FROM_CATEGORY"
            Begin Extent = 
               Top = 443
               Left = 249
               Bottom = 558
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OLD_CM"
            Begin Extent = 
               Top = 9
               Left = 520
               Bottom = 145
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GROUP_DETAIL"
            Begin Extent = 
               Top = 11
               Left = 297
               Bottom = 147
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "STATUS"
            Begin Extent = 
               Top = 151
               Left = 295
               Bottom = 269
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HEAD_EMP"
            Begin Extent = 
               Top = 309
               Left = 695
               Bottom = 445
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "O"
            Begin Extent = 
               Top = 152
               Left = 493
               Bottom = 288
               Right = 685
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MANAGER_EMP"
            Begin Extent = 
               Top = 306
               Left = 291
               Bottom = 442
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIZE"
            Begin Extent = 
               Top = 309
               Left = 508
               Bottom = 427
               Right = 682
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUS"
            Begin Extent = 
               Top = 0
               Left = 762
               Bottom = 136
               Right = 936
            End
            DisplayFlags = 280
            TopColumn = 38
         End
         Begin Table = "V_010_BRANCH (CLASSIFY)"
            Begin Extent = 
               Top = 0
               Left = 966
               Bottom = 136
               Right = 1214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_015_DEPARTMENT (CLASSIFY)"
            Begin Extent = 
               Top = 137
               Left = 966
               Bottom = 273
               Right = 1214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RM_CONTROLLING"
            Begin Extent = 
               Top = 273
               Left = 926
               Bottom = 409
               Right = 1174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BRANCH_MAP_RM"
            Begin Extent = 
               Top = 143
               Left = 722
               Bottom = 279
               Right = 896
            End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_003_CUSTOMER_SME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 81
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
         Width = 1596
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2220
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
         Width = 1476
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
         Width = 1896
         Width = 2052
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
         Width = 1500
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2508
         Width = 2148
         Width = 2040
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3060
         Alias = 2652
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
End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_003_CUSTOMER_SME';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_003_CUSTOMER_SME';

