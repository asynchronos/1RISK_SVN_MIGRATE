CREATE VIEW dbo.CA_FROM_LEADER_SME_BY_CIF
AS
SELECT     TOP (100) PERCENT CA_ID, วันที่ส่งเรื่องให้พิจารณา AS CA_CREATE_DATE, SUBJECT_DETAIL, DETAIL, CIF0 AS CIF, FROM_BR, Branch_T, Province, 
                      FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, PROCESS_ID, PROCESS, LAST_PROCESS_DATE AS PROCESS_DATE, PROCESS_EMP_ID, 
                      PROCESS_EMP_NAME, CIF AS Expr1, CIF1, NAME, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4
FROM         (SELECT     CIF AS CIF0, NAME AS NAME0, CA_ID, YEAR_LETTER, ID_ABOUTCIF, ABOUTCIF, GROUP_ID, GROUP_NAME, ID_SUBJECT, SUBJECT, 
                                              SUBJECT_DETAIL, DETAIL, DAY_LETTER, CIF, NAME, CIF1, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4, FROM_BR, Branch_T, 
                                              Province, FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, วันที่ส่งเรื่องให้พิจารณา, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, 
                                              ระยะเวลาดำเนินงาน, รหัสพนักงานผู้ออก, ชื่อผู้ออก, LETTERSORT, PROCESS_EMP_UT, PROCESS_EMP_ID, PROCESS_EMP_NAME
                       FROM          dbo.CA_FROM_LEADER_SME
                       UNION ALL
                       SELECT     CIF1 AS CIF0, NAME1 AS NAME0, CA_ID, YEAR_LETTER, ID_ABOUTCIF, ABOUTCIF, GROUP_ID, GROUP_NAME, ID_SUBJECT, SUBJECT, 
                                             SUBJECT_DETAIL, DETAIL, DAY_LETTER, CIF, NAME, CIF1, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4, FROM_BR, Branch_T, 
                                             Province, FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, วันที่ส่งเรื่องให้พิจารณา, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, 
                                             ระยะเวลาดำเนินงาน, รหัสพนักงานผู้ออก, ชื่อผู้ออก, LETTERSORT, PROCESS_EMP_UT, PROCESS_EMP_ID, PROCESS_EMP_NAME
                       FROM         dbo.CA_FROM_LEADER_SME AS CA_FROM_LEADER_SME_4
                       WHERE     (CIF1 IS NOT NULL)
                       UNION ALL
                       SELECT     CIF2 AS CIF0, NAME2 AS NAME0, CA_ID, YEAR_LETTER, ID_ABOUTCIF, ABOUTCIF, GROUP_ID, GROUP_NAME, ID_SUBJECT, SUBJECT, 
                                             SUBJECT_DETAIL, DETAIL, DAY_LETTER, CIF, NAME, CIF1, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4, FROM_BR, Branch_T, 
                                             Province, FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, วันที่ส่งเรื่องให้พิจารณา, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, 
                                             ระยะเวลาดำเนินงาน, รหัสพนักงานผู้ออก, ชื่อผู้ออก, LETTERSORT, PROCESS_EMP_UT, PROCESS_EMP_ID, PROCESS_EMP_NAME
                       FROM         dbo.CA_FROM_LEADER_SME AS CA_FROM_LEADER_SME_3
                       WHERE     (CIF2 IS NOT NULL)
                       UNION ALL
                       SELECT     CIF3 AS CIF0, NAME3 AS NAME0, CA_ID, YEAR_LETTER, ID_ABOUTCIF, ABOUTCIF, GROUP_ID, GROUP_NAME, ID_SUBJECT, SUBJECT, 
                                             SUBJECT_DETAIL, DETAIL, DAY_LETTER, CIF, NAME, CIF1, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4, FROM_BR, Branch_T, 
                                             Province, FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, วันที่ส่งเรื่องให้พิจารณา, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, 
                                             ระยะเวลาดำเนินงาน, รหัสพนักงานผู้ออก, ชื่อผู้ออก, LETTERSORT, PROCESS_EMP_UT, PROCESS_EMP_ID, PROCESS_EMP_NAME
                       FROM         dbo.CA_FROM_LEADER_SME AS CA_FROM_LEADER_SME_2
                       WHERE     (CIF3 IS NOT NULL)
                       UNION ALL
                       SELECT     CIF4 AS CIF0, NAME4 AS NAME0, CA_ID, YEAR_LETTER, ID_ABOUTCIF, ABOUTCIF, GROUP_ID, GROUP_NAME, ID_SUBJECT, SUBJECT, 
                                             SUBJECT_DETAIL, DETAIL, DAY_LETTER, CIF, NAME, CIF1, NAME1, CIF2, NAME2, CIF3, NAME3, CIF4, NAME4, FROM_BR, Branch_T, 
                                             Province, FROM_REGION, Region_Name, LEAD_ID, LEAD_NAME, วันที่ส่งเรื่องให้พิจารณา, PROCESS_ID, PROCESS, LAST_PROCESS_DATE, 
                                             ระยะเวลาดำเนินงาน, รหัสพนักงานผู้ออก, ชื่อผู้ออก, LETTERSORT, PROCESS_EMP_UT, PROCESS_EMP_ID, PROCESS_EMP_NAME
                       FROM         dbo.CA_FROM_LEADER_SME AS CA_FROM_LEADER_SME_1
                       WHERE     (CIF4 IS NOT NULL)) AS CA_FROM_LEADER_SME_BY_CIF_1
WHERE     (FROM_REGION > 300)
ORDER BY PROCESS_DATE

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
         Configuration = "(H (1[15] 4[60] 3) )"
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
         Configuration = "(H (1[68] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
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
         Configuration = "(H (1[12] 4) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CA_FROM_LEADER_SME_BY_CIF_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 396
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 19
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 2790
         Width = 2505
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
         Column = 1935
         Alias = 2235
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CA_FROM_LEADER_SME_BY_CIF';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CA_FROM_LEADER_SME_BY_CIF';

