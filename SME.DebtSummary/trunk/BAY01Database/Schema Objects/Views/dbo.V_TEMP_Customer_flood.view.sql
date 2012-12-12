CREATE VIEW dbo.V_TEMP_Customer_flood
AS
SELECT     TOP (100) PERCENT dbo.CUSTOMER.CIF, dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, 
                      dbo.CUSTOMER.CTITLE_E, dbo.CUSTOMER.CFIRST_E, dbo.CUSTOMER.CLAST_E, dbo.CUSTOMER.PROV, dbo.TB_PROVINCE.PROV_NAME, 
                      dbo.TB_PROVINCE.PROV_NAME_E, dbo.ByCustomer.Principal, dbo.ByCustomer.Contingent, dbo.Id_DepBranchLeader.LendingT, 
                      dbo.Id_DepBranchLeader.ProvinceT, dbo.Id_DepBranchLeader.ProvinceE, dbo.Id_DepBranchLeader.Hub_Name_T, dbo.ByCustomer.BaySize, 
                      dbo.CUSTOMER_SME01_VIEW.CM_CODE, dbo.CUSTOMER_SME01_VIEW.CM_NAME, dbo.EMPLOYEE01.EMPNAME_E, 
                      dbo.EMPLOYEE01.EMPSURNAME_E, dbo.CONTROLLING_LINE_FULL.LEAD_NAME, dbo.ByCustomer.Busi_Type, dbo.Id_Bus_Type.Bus_TypeD, 
                      dbo.Id_Bus_Type.Bus_TypeE
FROM         dbo.ByCustomer INNER JOIN
                      dbo.Id_DepBranchLeader ON dbo.ByCustomer.BranchMaxPrin = dbo.Id_DepBranchLeader.Id_DepTran LEFT OUTER JOIN
                      dbo.Id_Bus_Type ON dbo.ByCustomer.Busi_Type = dbo.Id_Bus_Type.Id_Bus_Type LEFT OUTER JOIN
                      dbo.CUSTOMER_SME01_VIEW LEFT OUTER JOIN
                      dbo.EMPLOYEE01 LEFT OUTER JOIN
                      dbo.CONTROLLING_LINE_FULL ON dbo.EMPLOYEE01.EMP_ID = dbo.CONTROLLING_LINE_FULL.EMP_ID ON 
                      dbo.CUSTOMER_SME01_VIEW.CM_CODE = dbo.EMPLOYEE01.EMP_ID ON dbo.ByCustomer.Cif = dbo.CUSTOMER_SME01_VIEW.CIF LEFT OUTER JOIN
                      dbo.TB_PROVINCE INNER JOIN
                      dbo.CUSTOMER ON dbo.TB_PROVINCE.PROV_CODE = dbo.CUSTOMER.PROV ON dbo.ByCustomer.Cif = dbo.CUSTOMER.CIF
WHERE     (dbo.ByCustomer.BaySize IN ('SME_S', 'SME_M')) AND (dbo.Id_DepBranchLeader.ProvinceT IN ('กระบี่', 'ชุมพร', 'ตรัง', 'นครศรีธรรมราช', 'พังงา', 'ระนอง', 
                      'สงขลา', 'สุราษฏร์ธานี', 'ภูเก็ต', 'สตูล', 'พัทลุง', 'ปัตตานี', 'ยะลา', 'นราธิวาส'))
ORDER BY dbo.Id_DepBranchLeader.ProvinceT

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[16] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[32] 4[45] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[75] 3) )"
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
         Begin Table = "ByCustomer"
            Begin Extent = 
               Top = 44
               Left = 230
               Bottom = 334
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_DepBranchLeader"
            Begin Extent = 
               Top = 195
               Left = 457
               Bottom = 489
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Bus_Type"
            Begin Extent = 
               Top = 267
               Left = 0
               Bottom = 446
               Right = 162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME01_VIEW"
            Begin Extent = 
               Top = 11
               Left = 447
               Bottom = 169
               Right = 682
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 9
               Left = 727
               Bottom = 206
               Right = 892
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CONTROLLING_LINE_FULL"
            Begin Extent = 
               Top = 4
               Left = 957
               Bottom = 222
               Right = 1109
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "TB_PROVINCE"
            Begin Extent = 
               Top = 414
               Left = 234
               Bottom = 558
               Right = 406', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_Customer_flood';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 8
               Left = 18
               Bottom = 251
               Right = 170
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
      Begin ColumnWidths = 34
         Width = 284
         Width = 1230
         Width = 1110
         Width = 2070
         Width = 1755
         Width = 1890
         Width = 1605
         Width = 1500
         Width = 1875
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2220
         Width = 1500
         Width = 1140
         Width = 2205
         Width = 1260
         Width = 1500
         Width = 2070
         Width = 1080
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_Customer_flood';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_Customer_flood';

