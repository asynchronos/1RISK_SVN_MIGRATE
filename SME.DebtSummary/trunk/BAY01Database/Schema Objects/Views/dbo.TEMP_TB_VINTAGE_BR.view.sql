CREATE VIEW dbo.TEMP_TB_VINTAGE_BR
AS
SELECT     dbo.TB_VINTAGE.CIF, dbo.TB_VINTAGE.CUSTOMER_NAME, dbo.TB_VINTAGE.CM_CODE, dbo.TB_VINTAGE.CM_NAME, dbo.TB_VINTAGE.BRANCH_ID, 
                      dbo.TB_VINTAGE.BRANCH_NAME, dbo.TB_VINTAGE.Id_Region, dbo.TB_VINTAGE.Region_Name, dbo.TB_VINTAGE.GROUP_SIZE_ID, 
                      dbo.TB_VINTAGE.GROUP_SIZE_DETAIL, dbo.TB_VINTAGE.JUDGEMENT_ID, dbo.TB_VINTAGE.JUDGEMENT_DETAIL, dbo.TB_VINTAGE.BUSI_RISK1_ID,
                       dbo.TB_VINTAGE.BUSI_RISK1_DETAIL, dbo.TB_VINTAGE.STATUS_ID, dbo.TB_VINTAGE.STATUS_DETAIL, dbo.TB_VINTAGE.SIZE_ID, 
                      dbo.TB_VINTAGE.SIZE_DETAIL, dbo.TB_VINTAGE.OLD_ID, dbo.TB_VINTAGE.CA_NO_ID, dbo.TB_VINTAGE.CA_CREATE_DATE, 
                      dbo.TB_VINTAGE.APPROVE_VALUEs, dbo.TB_VINTAGE.APPROVE_DATE, dbo.TB_VINTAGE.Reason, dbo.TB_VINTAGE.LAST_PROCESS_ID, 
                      dbo.TB_VINTAGE.LAST_PROCESS, dbo.TB_VINTAGE.LAST_PROCESS_GROUP, dbo.TB_VINTAGE.LAST_PROCESS_DATE, 
                      dbo.TB_VINTAGE.LP_END_OF_MONTH, dbo.TB_VINTAGE.LP_YM, dbo.TB_VINTAGE.EMP_ID, dbo.TB_VINTAGE.EMPNAME, dbo.TB_VINTAGE.LEVEL_ID,
                       dbo.TB_VINTAGE.LEVEL_NAME, dbo.TB_VINTAGE.NEW_CUS, dbo.TB_VINTAGE.SUBJECT_GROUP, dbo.TB_VINTAGE.RECIVER, 
                      dbo.TB_VINTAGE.Send_To_Board, dbo.TB_VINTAGE.Authority, dbo.TB_VINTAGE.EMP_REQUEST_ID, dbo.TB_VINTAGE.EMP_REQUEST_NAME, 
                      dbo.TB_VINTAGE.EMP_APPROVE_ID, dbo.TB_VINTAGE.EMP_APPROVE1_NAME, dbo.TB_VINTAGE.EMP_APPROVE2_ID, 
                      dbo.TB_VINTAGE.EMP_APPROVE2_NAME, dbo.TB_VINTAGE.EMP_APPROVE3_ID, dbo.TB_VINTAGE.EMP_APPROVE3_NAME, 
                      dbo.TB_VINTAGE.EMP_APPROVE4_ID, dbo.TB_VINTAGE.EMP_APPROVE4_NAME, dbo.TB_VINTAGE.EMP_APPR_ID, 
                      dbo.TB_VINTAGE.EMP_APPR_NAME, dbo.Id_DepBranchLeader.ProvinceT AS Province, Bay01_test.dbo.DEBTDATE.ASOF AS ByCusAsOf, 
                      Bay01_test.dbo.ByCustomer.Principal, Bay01_test.dbo.ByCustomer.Class, Bay01_test.dbo.ByCustomer.Contingent, 
                      CASE Bay01_test.dbo.ByCustomer.Class WHEN N'ก' THEN 'NPL' WHEN N'ข' THEN 'NPL' WHEN N'ค' THEN 'NPL' WHEN N'ง' THEN 'SM' WHEN N'จ' THEN
                       'PASS' ELSE NULL END AS STATUS
FROM         dbo.TB_VINTAGE LEFT OUTER JOIN
                      Bay01_test.dbo.ByCustomer ON dbo.TB_VINTAGE.CIF = Bay01_test.dbo.ByCustomer.Cif LEFT OUTER JOIN
                      dbo.Id_DepBranchLeader ON dbo.TB_VINTAGE.BRANCH_ID = dbo.Id_DepBranchLeader.Id_DepTran CROSS JOIN
                      Bay01_test.dbo.DEBTDATE
WHERE     (Bay01_test.dbo.DEBTDATE.Upd_TABLE = N'ByCustomer') AND (dbo.Id_DepBranchLeader.Flag = 2)

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
         Begin Table = "TB_VINTAGE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ByCustomer (Bay01_test.dbo)"
            Begin Extent = 
               Top = 4
               Left = 497
               Bottom = 212
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 30
         End
         Begin Table = "Id_DepBranchLeader"
            Begin Extent = 
               Top = 2
               Left = 286
               Bottom = 226
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DEBTDATE (Bay01_test.dbo)"
            Begin Extent = 
               Top = 5
               Left = 687
               Bottom = 204
               Right = 838
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
      Begin ColumnWidths = 87
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
         Width = 150', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_TB_VINTAGE_BR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'0
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
         Column = 2895
         Alias = 900
         Table = 2460
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_TB_VINTAGE_BR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'TEMP_TB_VINTAGE_BR';

