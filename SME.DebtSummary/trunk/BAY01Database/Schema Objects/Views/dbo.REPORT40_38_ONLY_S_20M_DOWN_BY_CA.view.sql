CREATE VIEW dbo.REPORT40_38_ONLY_S_20M_DOWN_BY_CA
AS
SELECT     CONVERT(varchar(6), CA_CREATE_DATE, 112) AS CREATE_MONTH, OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, 
                      COUNT(DISTINCT CIF) AS CIFs, SUM(OLD_VALUE) AS OLD_VALUEs, SUM(RM_VALUE) AS RM_VALUEs, SUM(CM_VALUE) AS CM_VALUEs, 
                      SUM(APPROVE_VALUE) AS APPROVE_VALUEs, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, LAST_PROCESS_ID, 
                      LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, MIN(SUBJECT_GROUP) AS SUBJECT_GROUP, NEW_CUS, 
                      Region_Name, Id_Region, Customer_Size
FROM         dbo.REPORT38_36_WITH_REGION
WHERE     EXISTS
                          (SELECT     CIF
                            FROM          dbo.CUSTOMER_SME02_01_WITH_LEVEL
                            WHERE      (CIF = dbo.REPORT38_36_WITH_REGION.CIF) AND (GROUP_SIZE_ID <= 4) AND (LEVEL_NAME_NO_HUB LIKE 'Small%'))
GROUP BY OLD_ID, CA_NO_ID, CA_CREATE_DATE, REFERENCE, REFERENCE_DATE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, 
                      LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, NEW_CUS, Region_Name, Id_Region, 
                      Customer_Size

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
         Begin Table = "REPORT38_36_WITH_REGION"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 18
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 26
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3780
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT40_38_ONLY_S_20M_DOWN_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT40_38_ONLY_S_20M_DOWN_BY_CA';

