CREATE VIEW dbo.V_031_ADD_BYCUS_EMP_NAME_ON_V_029
AS
SELECT     V.OLD_ID, V.CA_CREATE_DATE, V.IS_CREDIT_UP, V.Authority_id, V.Authority, V.EMP_APPROVE_OR_REQUEST_ID, 
                      V.EMP_APPROVE_OR_REQUEST_NAME, V.EMP_APPROVE_LEVEL_ID, V.EMP_APPROVE_LEVEL_NAME, V.APPROVE_DATE, V.CIF, V.CA_NO_ID, 
                      V.LAST_PROCESS_EMP, dbo.GetName(LAST_EMP.TITLE_NAME, LAST_EMP.EMPNAME, LAST_EMP.EMPSURNAME) AS LAST_PROCESS_EMP_NAME, 
                      V.LAST_PROCESS_LEVEL_ID, V.LAST_PROCESS_LEVEL_NAME, V.REGION_ID, V.Region_Name, V.OLD_REGION_ID, V.OLD_REGION, V.SIZE_IN_CA, 
                      V.CM_CODE, dbo.GetName(CM.TITLE_NAME, CM.EMPNAME, CM.EMPSURNAME) AS CM_NAME, V.SIZE_BY_CM_STRUCTURE, 
                      V.SME_MIS_FINAL_SIZE, B.Name AS CUS_NAME, B.BaySize, B.Class, B.Principal
FROM         dbo.V_029_LAST_APPROVE_CA_PRIORITY_BY_CREDIT_UP AS V LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS CM ON V.CM_CODE = CM.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS LAST_EMP ON V.LAST_PROCESS_EMP = LAST_EMP.EMP_ID LEFT OUTER JOIN
                      dbo.ByCustomer AS B ON V.CIF = B.Cif

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
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 258
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 329
               Bottom = 255
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "LAST_EMP"
            Begin Extent = 
               Top = 8
               Left = 792
               Bottom = 123
               Right = 957
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "CM"
            Begin Extent = 
               Top = 133
               Left = 791
               Bottom = 248
               Right = 956
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 30
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
         Width = 2685
         Width = 1500
         Width = 1500
         Width =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_031_ADD_BYCUS_EMP_NAME_ON_V_029';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'2865
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3855
         Alias = 2655
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_031_ADD_BYCUS_EMP_NAME_ON_V_029';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_031_ADD_BYCUS_EMP_NAME_ON_V_029';

