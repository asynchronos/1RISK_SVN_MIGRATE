CREATE VIEW dbo.V_CUSTOMER_BY_PROVINCE
AS
SELECT S.CIF, S.CUSTOMER_NAME, S.CUSTOMER_NAME_E, S.CM_CODE, S.CM_NAME, S.GROUP_SIZE_ID, S.GROUP_SIZE_DETAIL, S.SIZE_ID, 
               S.SIZE_DETAIL, PV.Region_GroupT, PV.Id_Province, PV.Province, C.Name, C.BOTID, C.GLGROUP, C.PDGROUP, C.GECustSize, C.BaySize, C.Rating, 
               C.Busi_Type, C.Tdr, C.Count, C.DateReport, C.DateRegister, C.Date_Report, C.Branch, C.BranchMaxPrin, C.Dept, C.DEPT_APPV, C.DEPT_TRAN, 
               C.Class, C.ClassE, C.AGING, C.NPL, C.Limit, C.PrinResv, C.PrincipalFull, C.PrincipalG, C.Principal, C.Cont, C.CCF1, C.Contingent, C.AccruFull, C.Accru, 
               C.SuspOri, C.Susp, C.UNEARNPRIN, C.UNEARNINT, C.UNCLEAPRIN, C.UNCLEAINT, C.DEFER, C.UseValue, C.BAfterC, C.TdrLoss, C.Reserve, 
               C.PVLOSS, C.ExtraResv, C.BaySpresv, C.Totresv, C.Limit_Out, C.Principal_Out, C.Olddef_Exc, C.ResvExc, C.Full_IAS39, C.ResvFull, C.BotClass, 
               C.AddResv, C.BotColl, C.CUS_DEPT_FLAG, C.CUS_DEPT_TRAN, C.NPLFLAG, C.StatusPAY, C.Affiliate, C.BOT, C.BOTYear, C.BOTClassAfter, 
               S.OFFICR_ID, S.OFFICR_NAME, S.BUSI_RISK3_DETAIL, S.BUSI_RISK3_ID, S.BUSI_RISK2_DETAIL, S.BUSI_RISK2_ID, S.BUSI_RISK1_DETAIL, 
               S.BUSI_RISK1_ID, dbo.Id_Bus_Type.Id_Bus_Type, dbo.Id_Bus_Type.Bus_TypeD, dbo.Id_Bus_Type.Id_Industry, dbo.Id_Bus_Type.Industry, 
               dbo.lim_exp.grp_lim
FROM  dbo.Id_Bus_Type RIGHT OUTER JOIN
               dbo.ByCustomer AS C LEFT OUTER JOIN
               dbo.lim_exp ON C.Cif = dbo.lim_exp.cif ON dbo.Id_Bus_Type.Id_Bus_Type = C.Busi_Type LEFT OUTER JOIN
               dbo.Id_Branch_Province AS PV ON C.BranchMaxPrin = PV.Id_Branch RIGHT OUTER JOIN
               dbo.CUSTOMER_SME00_ALL_STATUS AS S ON C.Cif = S.CIF
WHERE (PV.Region_GroupT = 'ภาคใต้')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[16] 2[14] 3) )"
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
         Configuration = "(H (4 [30] 2 [40] 3))"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -124
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Id_Bus_Type"
            Begin Extent = 
               Top = 1
               Left = 945
               Bottom = 151
               Right = 1150
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 10
               Left = 288
               Bottom = 372
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "lim_exp"
            Begin Extent = 
               Top = 0
               Left = 618
               Bottom = 110
               Right = 831
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "PV"
            Begin Extent = 
               Top = 174
               Left = 741
               Bottom = 399
               Right = 930
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 10
               Left = 29
               Bottom = 368
               Right = 229
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
      Begin ColumnWidths = 92
         Width = 284
         Width = 1500
         Width = 2316
         Width = 2436
         Width = 1272
         Width = 2196
         Width = 1416
         Width = 1212
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CUSTOMER_BY_PROVINCE';


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
         Width = 1428
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CUSTOMER_BY_PROVINCE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CUSTOMER_BY_PROVINCE';

