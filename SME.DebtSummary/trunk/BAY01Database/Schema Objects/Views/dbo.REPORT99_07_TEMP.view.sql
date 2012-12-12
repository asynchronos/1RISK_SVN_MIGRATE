CREATE VIEW dbo.REPORT99_07_TEMP
AS
SELECT     CONVERT(varchar(6), dbo.REPORT07_SUMMARY.CA_CREATE_DATE, 112) AS CREATE_MONTH, dbo.REPORT07_SUMMARY.CA_CREATE_DATE, 
                      dbo.REPORT07_SUMMARY.OLD_ID, dbo.REPORT07_SUMMARY.CA_NO_ID, CUSTOMER_SME03_NO_LEVEL_ID30.CIF, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.CUSTOMER_NAME, CUSTOMER_SME03_NO_LEVEL_ID30.GROUP_ID, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.GROUP_SIZE_DETAIL, CUSTOMER_SME03_NO_LEVEL_ID30.BaySize, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.Principal, CUSTOMER_SME03_NO_LEVEL_ID30.Accru, CUSTOMER_SME03_NO_LEVEL_ID30.Susp, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.UseValue, CUSTOMER_SME03_NO_LEVEL_ID30.Totresv, CUSTOMER_SME03_NO_LEVEL_ID30.Full_IAS39, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.ResvFull, CUSTOMER_SME03_NO_LEVEL_ID30.Contingent, CUSTOMER_SME03_NO_LEVEL_ID30.Class, 
                      dbo.REPORT07_SUMMARY.SUBJECT_DETAIL, dbo.REPORT07_SUMMARY.OLD_VALUE, dbo.REPORT07_SUMMARY.RM_VALUE, 
                      dbo.REPORT07_SUMMARY.CM_VALUE, dbo.REPORT07_SUMMARY.APPROVE_VALUE, dbo.REPORT07_SUMMARY.LAST_PROCESS, 
                      dbo.REPORT07_SUMMARY.LAST_PROCESS_DATE, dbo.GetName(dbo.TB_TITLE.TITLE_NAME, dbo.TB_EMPLOYEE.EMPNAME, 
                      dbo.TB_EMPLOYEE.EMPSURNAME) AS LAST_PROCESS_BY, CUSTOMER_SME03_NO_LEVEL_ID30.CONTROLLING_UNIT, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.REGION_CONTROLLING_UNIT, CUSTOMER_SME03_NO_LEVEL_ID30.CM_NAME, 
                      CUSTOMER_SME03_NO_LEVEL_ID30.LEVEL_NAME, CUSTOMER_SME03_NO_LEVEL_ID30.LEVEL_NAME_NO_HUB
FROM         dbo.REPORT07_SUMMARY INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.REPORT07_SUMMARY.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE LEFT OUTER JOIN
                          (SELECT     CIF, CUSTOMER_NAME, GROUP_ID, CM_CODE, CM_NAME, LEVEL_NAME, LEVEL_NAME_NO_HUB, OLD_CM_CODE, OLD_CM_NAME, 
                                                   BRANCH_ID, BRANCH_NAME, Id_Region, Region_Name, GROUP_SIZE_ID, GROUP_SIZE_DETAIL, JUDGEMENT_ID, 
                                                   JUDGEMENT_DETAIL, BUSI_RISK1_ID, BUSI_RISK1_DETAIL, BUSI_RISK2_ID, BUSI_RISK2_DETAIL, BUSI_RISK3_ID, 
                                                   BUSI_RISK3_DETAIL, UPDATE_BY, UPDATE_BY_NAME, UPDATE_DATE, BUSI_TYPE_CIM, DEPTFLAG, DEPTTRAN, CONTROLLING_UNIT, 
                                                   REGION_CONTROLLING_UNIT, ByCustomer_ASOF, BaySize, Rating, Class, Tdr, Principal, Accru, Susp, UseValue, Totresv, Full_IAS39, 
                                                   ResvFull, Contingent, AGING, BUSINESS_DESTINATION_ID, BUSINESS_DESTINATION_DESC, EXPORT_WEIGHT, LOCAL_WEIGHT
                            FROM          dbo.CUSTOMER_SME03_02_WITH_BYCUSTOMER
                            WHERE      (LEVEL_NAME <> 'Small SME Credit Risk ภูมิภาค')) AS CUSTOMER_SME03_NO_LEVEL_ID30 ON 
                      dbo.REPORT07_SUMMARY.CIF = CUSTOMER_SME03_NO_LEVEL_ID30.CIF

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
         Begin Table = "REPORT07_SUMMARY"
            Begin Extent = 
               Top = 6
               Left = 337
               Bottom = 253
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "CUSTOMER_SME03_NO_LEVEL_ID30"
            Begin Extent = 
               Top = 6
               Left = 759
               Bottom = 253
               Right = 994
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 26
               Left = 565
               Bottom = 141
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 155
               Left = 569
               Bottom = 255
               Right = 723
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
      Begin ColumnWidths = 32
         Width = 284
         Width = 1500
         Width = 1665
         Width = 1665
         Width = 1665
         Width = 1500
         Width = 5070
         Width = 1500
         Width = 1755
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3660
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1785
         W', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT99_07_TEMP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'idth = 1815
         Width = 2640
         Width = 2640
         Width = 2700
         Width = 2385
         Width = 2220
         Width = 2340
         Width = 2340
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5670
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT99_07_TEMP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT99_07_TEMP';

