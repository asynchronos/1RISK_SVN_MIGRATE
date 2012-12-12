CREATE VIEW dbo.V_023_FINISH_CA_101_102_103_114_115_Y2010_MAP_CIF_TYPE1
AS
SELECT     R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.REGIS_DATE, R.REGIS_BY, R.REGIS_LEVEL_ID, R.REGIS_LEVEL_NAME, R.REFERENCE, 
                      R.REFERENCE_DATE, R.SUBJECT_IDEN, R.SUBJECT_DETAIL_ID, R.SUBJECT_DETAIL, R.SUBJECT_ACTION, R.CIF, ISNULL(C.CIF_TYPE1, R.CIF) 
                      AS CIF_TYPE1, R.ACCNO, R.DECB_RD_ID, R.DECB_RD, R.CASHTYPE, R.DECB_RD2, R.OLD_VALUE, R.RM_VALUE, R.CM_VALUE, R.APPROVE_VALUE, 
                      R.APPROVE_DATE, R.REJECT_DATE, R.REJECT_REASON, R.LAST_PROCESS, R.LAST_PROCESS_ID, R.LAST_PROCESS_GROUP, 
                      R.LAST_PROCESS_DATE, R.EMP_ID, R.LEVEL_ID, R.LEVEL_NAME, R.Customer_Size, R.SIZE_DETAIL, R.Send_To_Board, R.Authority, 
                      R.EMP_REQUEST_ID, R.EMP_REQUEST_NAME, R.EMP_APPROVE_ID, R.EMP_APPROVE1_NAME, R.EMP_APPROVE2_ID, R.EMP_APPROVE2_NAME, 
                      R.EMP_APPROVE3_ID, R.EMP_APPROVE3_NAME, R.EMP_APPROVE4_ID, R.EMP_APPROVE4_NAME, R.PRODUCT_CODE, R.PROJECT_CODE, 
                      R.REGION_ID, R.Region_Name, R.SUB_COMMITTEE_1, R.EMP_SUB_COMM1_NAME, R.SUB_COMMITTEE_2, R.EMP_SUB_COMM2_NAME, 
                      R.SUB_COMMITTEE_3, R.EMP_SUB_COMM3_NAME
FROM         dbo.V_022_CIF_UNION_TO_TYPE1 AS C RIGHT OUTER JOIN
                      dbo.REPORT07_SUMMARY AS R ON C.CIF = R.CIF
WHERE     (R.SUBJECT_DETAIL_ID IN (N'101', N'102', N'103', N'114', N'115')) AND (R.LAST_PROCESS_GROUP IN ('C', 'D', 'E')) AND 
                      (R.REGIS_DATE >= CONVERT(datetime, '1/1/2010', 103))

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
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 91
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 269
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 28
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 61
         Width = 284
         Width = 1500
         Width = 1995
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1890
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_023_FINISH_CA_101_102_103_114_115_Y2010_MAP_CIF_TYPE1';


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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5235
         Alias = 1530
         Table = 2400
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_023_FINISH_CA_101_102_103_114_115_Y2010_MAP_CIF_TYPE1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_023_FINISH_CA_101_102_103_114_115_Y2010_MAP_CIF_TYPE1';

