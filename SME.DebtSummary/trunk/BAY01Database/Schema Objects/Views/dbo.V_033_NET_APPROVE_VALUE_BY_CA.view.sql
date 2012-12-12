CREATE VIEW dbo.V_033_NET_APPROVE_VALUE_BY_CA
AS
SELECT     N.OLD_ID, N.CA_NO_ID, N.CA_CREATE_DATE, N.REGIS_DATE, N.REGIS_BY, N.REGIS_LEVEL_ID, N.REGIS_LEVEL_NAME, N.REFERENCE, 
                      N.REFERENCE_DATE, N.NET_OLD_VALUE, N.NET_RM_VALUE, N.NET_CM_VALUE, N.NET_APPROVE_VALUE, 
                      CASE WHEN NET_APPROVE_VALUE >= 0 THEN MAX_CIF.CIF ELSE MIN_CIF.CIF END AS CIF, N.APPROVE_DATE, N.LAST_PROCESS, 
                      N.LAST_PROCESS_ID, N.LAST_PROCESS_GROUP, N.LAST_PROCESS_DATE, N.EMP_ID, N.LEVEL_ID, N.LEVEL_NAME, N.Customer_Size, 
                      N.SIZE_DETAIL, N.Send_To_Board, N.Authority, N.EMP_REQUEST_ID, N.EMP_REQUEST_NAME, N.EMP_APPROVE_ID, N.EMP_APPROVE1_NAME, 
                      N.EMP_APPROVE2_ID, N.EMP_APPROVE2_NAME, N.EMP_APPROVE3_ID, N.EMP_APPROVE3_NAME, N.EMP_APPROVE4_ID, 
                      N.EMP_APPROVE4_NAME, N.REGION_ID, N.Region_Name, N.SUB_COMMITTEE_1, N.EMP_SUB_COMM1_NAME, N.SUB_COMMITTEE_2, 
                      N.EMP_SUB_COMM2_NAME, N.SUB_COMMITTEE_3, N.EMP_SUB_COMM3_NAME, N.BRANCH_ID, N.OLD_REGION_ID, N.OLD_REGION
FROM         (SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REGIS_DATE, REGIS_BY, REGIS_LEVEL_ID, REGIS_LEVEL_NAME, REFERENCE, 
                                              REFERENCE_DATE, SUM(SUM_OLD_VALUE) AS NET_OLD_VALUE, SUM(SUM_RM_VALUE) AS NET_RM_VALUE, SUM(SUM_CM_VALUE) 
                                              AS NET_CM_VALUE, SUM(SUM_APPROVE_VALUE) AS NET_APPROVE_VALUE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, 
                                              LAST_PROCESS, LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, 
                                              Customer_Size, SIZE_DETAIL, Send_To_Board, Authority, EMP_REQUEST_ID, EMP_REQUEST_NAME, EMP_APPROVE_ID, 
                                              EMP_APPROVE1_NAME, EMP_APPROVE2_ID, EMP_APPROVE2_NAME, EMP_APPROVE3_ID, EMP_APPROVE3_NAME, EMP_APPROVE4_ID, 
                                              EMP_APPROVE4_NAME, REGION_ID, Region_Name, SUB_COMMITTEE_1, EMP_SUB_COMM1_NAME, SUB_COMMITTEE_2, 
                                              EMP_SUB_COMM2_NAME, SUB_COMMITTEE_3, EMP_SUB_COMM3_NAME, BRANCH_ID, OLD_REGION_ID, OLD_REGION
                       FROM          (SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REGIS_DATE, REGIS_BY, REGIS_LEVEL_ID, REGIS_LEVEL_NAME, REFERENCE, 
                                                                      REFERENCE_DATE, CIF, SUM(OLD_VALUE) AS SUM_OLD_VALUE, SUM(RM_VALUE) AS SUM_RM_VALUE, SUM(CM_VALUE) 
                                                                      AS SUM_CM_VALUE, SUM(APPROVE_VALUE) AS SUM_APPROVE_VALUE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, 
                                                                      LAST_PROCESS, LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, 
                                                                      Customer_Size, SIZE_DETAIL, Send_To_Board, Authority, EMP_REQUEST_ID, EMP_REQUEST_NAME, EMP_APPROVE_ID, 
                                                                      EMP_APPROVE1_NAME, EMP_APPROVE2_ID, EMP_APPROVE2_NAME, EMP_APPROVE3_ID, EMP_APPROVE3_NAME, 
                                                                      EMP_APPROVE4_ID, EMP_APPROVE4_NAME, REGION_ID, Region_Name, SUB_COMMITTEE_1, EMP_SUB_COMM1_NAME, 
                                                                      SUB_COMMITTEE_2, EMP_SUB_COMM2_NAME, SUB_COMMITTEE_3, EMP_SUB_COMM3_NAME, BRANCH_ID, 
                                                                      OLD_REGION_ID, OLD_REGION
                                               FROM          dbo.REPORT07_SUMMARY
                                               WHERE      (LAST_PROCESS_GROUP = 'D') AND (SUBJECT_ID = '01') AND (APPROVE_DATE >= DATEADD(day, - 1, GETDATE())) AND 
                                                                      (APPROVE_DATE <= GETDATE())
                                               GROUP BY OLD_ID, CA_NO_ID, CA_CREATE_DATE, REGIS_DATE, REGIS_BY, REGIS_LEVEL_ID, REGIS_LEVEL_NAME, REFERENCE, 
                                                                      REFERENCE_DATE, CIF, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, LAST_PROCESS_ID, 
                                                                      LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, Customer_Size, SIZE_DETAIL, 
                                                                      Send_To_Board, Authority, EMP_REQUEST_ID, EMP_REQUEST_NAME, EMP_APPROVE_ID, EMP_APPROVE1_NAME, 
                                                                      EMP_APPROVE2_ID, EMP_APPROVE2_NAME, EMP_APPROVE3_ID, EMP_APPROVE3_NAME, EMP_APPROVE4_ID, 
                                                                      EMP_APPROVE4_NAME, REGION_ID, Region_Name, SUB_COMMITTEE_1, EMP_SUB_COMM1_NAME, SUB_COMMITTEE_2, 
                                                                      EMP_SUB_COMM2_NAME, SUB_COMMITTEE_3, EMP_SUB_COMM3_NAME, BRANCH_ID, OLD_REGION_ID, OLD_REGION) 
                                              AS T
                       GROUP BY OLD_ID, CA_NO_ID, CA_CREATE_DATE, REGIS_DATE, REGIS_BY, REGIS_LEVEL_ID, REGIS_LEVEL_NAME, REFERENCE, 
                                              REFERENCE_DATE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, LAST_PROCESS_ID, LAST_PROCESS_GROUP, 
                                              LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, Customer_Size, SIZE_DETAIL, Send_To_Board, Authority, EMP_REQUEST_ID, 
                                              EMP_REQUEST_NAME, EMP_APPROVE_ID, EMP_APPROVE1_NAME, EMP_APPROVE2_ID, EMP_APPROVE2_NAME, EMP_APPROVE3_ID, 
                                              EMP_APPROVE3_NAME, EMP_APPROVE4_ID, EMP_APPROVE4_NAME, REGION_ID, Region_Name, SUB_COMMITTEE_1, 
                                              EMP_SUB_COMM1_NAME, SUB_COMMITTEE_2, EMP_SUB_COMM2_NAME, SUB_COMMITTEE_3, EMP_SUB_COMM3_NAME, 
                                              BRANCH_ID, OLD_REGION_ID, OLD_REGION) AS N LEFT OUTER JOIN
                          (SELECT     OLD_ID, CIF
                            FROM          dbo.V_032_MIN_MAX_APPROVE_CA_SUBJECT_01
                            WHERE      (MAX_VALUE = 1)) AS MAX_CIF ON N.OLD_ID = MAX_CIF.OLD_ID LEFT OUTER JOIN
                          (SELECT     OLD_ID, CIF
                            FROM          dbo.V_032_MIN_MAX_APPROVE_CA_SUBJECT_01 AS V_032_MIN_MAX_APPROVE_CA_SUBJECT_01_1
                            WHERE      (MIN_VALUE = 1)) AS MIN_CIF ON N.OLD_ID = MIN_CIF.OLD_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[11] 2[48] 3) )"
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
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MAX_CIF"
            Begin Extent = 
               Top = 7
               Left = 577
               Bottom = 92
               Right = 745
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MIN_CIF"
            Begin Extent = 
               Top = 5
               Left = 98
               Bottom = 90
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 6
               Left = 288
               Bottom = 121
               Right = 491
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
      Begin ColumnWidths = 54
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2010
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
         Width = 1620
         Width = 1500
         Width = 1500
         Width = 1845
         Width = 2070
         Width = 1590
         Width = 1875
         Width = 1680
         Width = 1965
         Width = 1695
         Width = 1905
         Width = 1650
         Width = 1890
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_033_NET_APPROVE_VALUE_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 1800
         Width = 2130
         Width = 1635
         Width = 2055
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
         Column = 6465
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_033_NET_APPROVE_VALUE_BY_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_033_NET_APPROVE_VALUE_BY_CA';

