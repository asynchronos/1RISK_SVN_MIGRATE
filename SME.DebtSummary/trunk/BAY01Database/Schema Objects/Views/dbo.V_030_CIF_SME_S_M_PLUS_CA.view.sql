CREATE VIEW dbo.V_030_CIF_SME_S_M_PLUS_CA
AS
SELECT     T.Cif, dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.OLD_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.CA_CREATE_DATE, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.IS_CREDIT_UP, dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.Authority_id, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.Authority, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.EMP_APPROVE_OR_REQUEST_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.EMP_APPROVE_OR_REQUEST_NAME, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.EMP_APPROVE_LEVEL_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.EMP_APPROVE_LEVEL_NAME, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.APPROVE_DATE, dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.CA_NO_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.LAST_PROCESS_EMP, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.LAST_PROCESS_LEVEL_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.LAST_PROCESS_LEVEL_NAME, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.REGION_ID, dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.Region_Name, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.OLD_REGION_ID, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.OLD_REGION, dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.SIZE_IN_CA, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.CM_CODE, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.SIZE_BY_CM_STRUCTURE, 
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.SME_MIS_FINAL_SIZE, ByCustomer_1.BaySize, ByCustomer_1.Class, 
                      ByCustomer_1.Principal
FROM         (SELECT DISTINCT Cif
                       FROM          dbo.ByCustomer
                       WHERE      (BaySize = N'SME_S') OR
                                              (BaySize = N'SME_M')
                       UNION
                       SELECT DISTINCT CIF
                       FROM         dbo.REPORT07_SUMMARY
                       WHERE     (LAST_PROCESS_GROUP = 'D')) AS T LEFT OUTER JOIN
                      dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP ON 
                      T.Cif = dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP.CIF LEFT OUTER JOIN
                      dbo.ByCustomer AS ByCustomer_1 ON T.Cif = ByCustomer_1.Cif

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
         Begin Table = "T"
            Begin Extent = 
               Top = 7
               Left = 317
               Bottom = 77
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP"
            Begin Extent = 
               Top = 6
               Left = 28
               Bottom = 269
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ByCustomer_1"
            Begin Extent = 
               Top = 6
               Left = 498
               Bottom = 268
               Right = 663
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
      Begin ColumnWidths = 28
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
         Width = 1500
         Width = 1500
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
         Append =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_030_CIF_SME_S_M_PLUS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1400
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_030_CIF_SME_S_M_PLUS_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_030_CIF_SME_S_M_PLUS_CA';

