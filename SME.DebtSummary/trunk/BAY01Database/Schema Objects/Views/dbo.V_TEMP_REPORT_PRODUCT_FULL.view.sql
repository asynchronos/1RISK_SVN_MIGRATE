CREATE VIEW dbo.V_TEMP_REPORT_PRODUCT_FULL
AS
SELECT     TOP (100) PERCENT TM.ID, TM.[REG-DATE], TM.[APP-DATE], TM.CIF, TM.CUSTOMER, TM.[EMP-ID], TM.EMPLOYEE, TM.[BRANCH-ID], 
                      TM.[BRANCH-NAME], TM.[REGION-ID], TM.[REGION-NAME], TM.NEW, TM.OLD, TM.REVIEW, TM.EXCEPTION, TM.APPROVE AS CREDIT_LINE, TM.[O-D], 
                      TM.[(O-D)], TM.[F-L], TM.[(F-L)], TM.[L-G], TM.[(L-G)], TM.[STL-PN], TM.[(STL-PN)], TM.[TRADE-FIN], TM.[(TRADE-FIN)], TM.OTHERS, TM.[(OTHERS)], 
                      TM.[SUM-INCREASE], TM.[SUM-DECREASE], TM.NET, TM.[SUM-RM_VALUE], TM.PROCESS_HEAD, TM.PROCESS_GROUP, TM.PROCESS, 
                      TM.TTY AS [TTY_SME(S)], TM.PAT AS [TTY_SME(M)], TM.[APP-TYPE], TM.LEVEL_NAME, TM.Job_Type, TM.Authority, TM.REFERRAL_NO, 
                      TM.REFERENCE, TM.Board, TM.LEVEL_PROCESS_ID, TM.BUSINESS_ID, TM.BUSINESS_TYPE, TM.Customer_Size, TM.SIZE_DETAIL, 
                      TM.REASON_REMARK, TM.RESULT_REMARK, TM.EMP_APPROVE, TM.EMP_APPROVE2, TM.LIM_AMT, dbo.Id_Branch.Branch_T AS BRANCH_NAME, 
                      dbo.Id_Branch.Out_Of_Scope, LIM.principal, LIM.grp_lim, LIM.grp_coll, CASE isnull(LIM.grp_coll, 0) WHEN 0 THEN 0 ELSE isnull(LIM.grp_lim, 0) 
                      / isnull(LIM.[grp_coll], 0) END AS LTV_S, LIM.cons_ltv, dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_ID, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_DETAIL, dbo.TB_BRANCH.Region AS REGION_NEW, dbo.TB_BRANCH.Region_Code, 
                      dbo.ByCustomer.Class, HM.HEAD_EMP_ID, HM.HEAD_TITLE_NAME, HM.HEAD_EMPNAME, HM.HEAD_EMPSURNAME, HM.HEAD_TITLE_NAME_E, 
                      HM.HEAD_EMPNAME_E, HM.HEAD_EMPSURNAME_E, HM.MANAGER_EMP_ID, HM.MANAGER_TITLE_NAME, HM.MANAGER_EMPNAME, 
                      HM.MANAGER_EMPSURNAME, HM.MANAGER_TITLE_NAME_E, HM.MANAGER_EMPNAME_E, HM.MANAGER_EMPSURNAME_E
FROM         (SELECT DISTINCT 
                                              CATEGORY_KEY, HEAD_EMP_ID, HEAD_TITLE_NAME, HEAD_EMPNAME, HEAD_EMPSURNAME, HEAD_TITLE_NAME_E, 
                                              HEAD_EMPNAME_E, HEAD_EMPSURNAME_E, HEAD_CATEGORY_KEY, HEAD_CATEGORY_DESC, MANAGER_EMP_ID, 
                                              MANAGER_TITLE_NAME, MANAGER_EMPNAME, MANAGER_EMPSURNAME, MANAGER_TITLE_NAME_E, MANAGER_EMPNAME_E, 
                                              MANAGER_EMPSURNAME_E, MANAGER_CATEGORY_KEY, MANAGER_CATEGORY_DESC
                       FROM          CLASSIFY.V_013_CM_HEAD_MANAGER_WITH_DESC) AS HM RIGHT OUTER JOIN
                      dbo.TEMP_REPORT_PRODUCT AS TM ON HM.CATEGORY_KEY = TM.LEVEL_PROCESS_ID LEFT OUTER JOIN
                      dbo.ByCustomer ON TM.CIF = dbo.ByCustomer.Cif LEFT OUTER JOIN
                      dbo.TB_BRANCH ON TM.[BRANCH-ID] = dbo.TB_BRANCH.Id_Branch LEFT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS ON TM.CIF = dbo.CUSTOMER_SME00_ALL_STATUS.CIF LEFT OUTER JOIN
                      dbo.Id_Branch ON TM.[BRANCH-ID] = dbo.Id_Branch.Id_Branch LEFT OUTER JOIN
                      DBF_IMPORT.dbo.lim_exp AS LIM ON TM.CIF = LIM.cif

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[28] 2[14] 3) )"
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
         Configuration = "(H (4[42] 2[28] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[59] 3) )"
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
         Top = -289
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HM"
            Begin Extent = 
               Top = 373
               Left = 255
               Bottom = 634
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TM"
            Begin Extent = 
               Top = 12
               Left = 40
               Bottom = 589
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 26
         End
         Begin Table = "ByCustomer"
            Begin Extent = 
               Top = 227
               Left = 284
               Bottom = 342
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "TB_BRANCH"
            Begin Extent = 
               Top = 14
               Left = 688
               Bottom = 168
               Right = 874
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 18
               Left = 459
               Bottom = 408
               Right = 694
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 90
               Left = 475
               Bottom = 242
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "LIM"
            Begin Extent = 
               Top = 94
               Left = 291
               Bottom = 209
               Right = 443
            End
            Disp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_REPORT_PRODUCT_FULL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'layFlags = 280
            TopColumn = 20
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
         Width = 1500
         Width = 1860
         Width = 3075
         Width = 1500
         Width = 2745
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
         Width = 2610
         Width = 2700
         Width = 2385
         Width = 1500
         Width = 1500
         Width = 2580
         Width = 1980
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
         Width = 1635
         Width = 1965
         Width = 1560
         Width = 1500
         Width = 1410
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
         Column = 3675
         Alias = 1620
         Table = 2865
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_REPORT_PRODUCT_FULL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_REPORT_PRODUCT_FULL';

