CREATE VIEW dbo.V_024_CA_OUTER_NCB_FROM023
AS
SELECT     CA.OLD_ID, CA.CA_NO_ID, CA.CA_CREATE_DATE, CA.REGIS_DATE, CA.REGIS_BY, CA.REGIS_LEVEL_ID, CA.REGIS_LEVEL_NAME, CA.REFERENCE, 
                      CA.REFERENCE_DATE, CA.SUBJECT_IDEN, CA.SUBJECT_DETAIL_ID, CA.SUBJECT_DETAIL, CA.SUBJECT_ACTION, CA.CIF, CA.CIF_TYPE1, CA.ACCNO, 
                      CA.DECB_RD_ID, CA.DECB_RD, CA.CASHTYPE, CA.DECB_RD2, CA.OLD_VALUE, CA.RM_VALUE, CA.CM_VALUE, CA.APPROVE_VALUE, 
                      CA.APPROVE_DATE, CA.REJECT_DATE, CA.REJECT_REASON, CA.LAST_PROCESS, CA.LAST_PROCESS_ID, CA.LAST_PROCESS_GROUP, 
                      CA.LAST_PROCESS_DATE, CA.EMP_ID, CA.LEVEL_ID, CA.LEVEL_NAME, CA.Customer_Size, CA.SIZE_DETAIL, CA.Send_To_Board, CA.Authority, 
                      CA.EMP_REQUEST_ID, CA.EMP_REQUEST_NAME, CA.EMP_APPROVE_ID, CA.EMP_APPROVE1_NAME, CA.EMP_APPROVE2_ID, 
                      CA.EMP_APPROVE2_NAME, CA.EMP_APPROVE3_ID, CA.EMP_APPROVE3_NAME, CA.EMP_APPROVE4_ID, CA.EMP_APPROVE4_NAME, 
                      CA.PRODUCT_CODE, CA.PROJECT_CODE, CA.REGION_ID, CA.Region_Name, CA.SUB_COMMITTEE_1, CA.EMP_SUB_COMM1_NAME, 
                      CA.SUB_COMMITTEE_2, CA.EMP_SUB_COMM2_NAME, CA.SUB_COMMITTEE_3, CA.EMP_SUB_COMM3_NAME, NCB.ID, NCB.ID_No, NCB.ID_Type, 
                      NCB.Customer_Name, NCB.CIF_No, NCB.Dept_Br_Code, NCB.Request_Date, NCB.Response_Date, ROW_NUMBER() OVER (PARTITION BY OLD_ID, 
                      SUBJECT_IDEN, CIF, CIF_TYPE1
ORDER BY [Response_Date] DESC) SEQ
FROM         dbo.V_023_FINISH_CA_101_102_103_114_115_Y2010_MAP_CIF_TYPE1 AS CA INNER JOIN
                      dbo.NCB_RESPONSE AS NCB ON CA.CIF_TYPE1 = NCB.CIF_No AND DATEADD(day, - 180, CA.REGIS_DATE) <= NCB.Response_Date AND 
                      DATEADD(day, 14, CA.REGIS_DATE) >= NCB.Response_Date

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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 62
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_024_CA_OUTER_NCB_FROM023';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_024_CA_OUTER_NCB_FROM023';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_024_CA_OUTER_NCB_FROM023';

