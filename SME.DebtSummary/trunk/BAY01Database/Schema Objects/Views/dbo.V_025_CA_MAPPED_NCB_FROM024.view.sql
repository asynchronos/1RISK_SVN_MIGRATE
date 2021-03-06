CREATE VIEW dbo.V_025_CA_MAPPED_NCB_FROM024
AS
SELECT     OLD_ID, CA_NO_ID, CA_CREATE_DATE, REGIS_DATE, REGIS_BY, REGIS_LEVEL_ID, REGIS_LEVEL_NAME, REFERENCE, REFERENCE_DATE, 
                      SUBJECT_IDEN, SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_ACTION, CIF, CIF_TYPE1, ACCNO, DECB_RD_ID, DECB_RD, CASHTYPE, 
                      DECB_RD2, OLD_VALUE, RM_VALUE, CM_VALUE, APPROVE_VALUE, APPROVE_DATE, REJECT_DATE, REJECT_REASON, LAST_PROCESS, 
                      LAST_PROCESS_ID, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, EMP_ID, LEVEL_ID, LEVEL_NAME, Customer_Size, SIZE_DETAIL, 
                      Send_To_Board, Authority, EMP_REQUEST_ID, EMP_REQUEST_NAME, EMP_APPROVE_ID, EMP_APPROVE1_NAME, EMP_APPROVE2_ID, 
                      EMP_APPROVE2_NAME, EMP_APPROVE3_ID, EMP_APPROVE3_NAME, EMP_APPROVE4_ID, EMP_APPROVE4_NAME, PRODUCT_CODE, 
                      PROJECT_CODE, REGION_ID, Region_Name, SUB_COMMITTEE_1, EMP_SUB_COMM1_NAME, SUB_COMMITTEE_2, EMP_SUB_COMM2_NAME, 
                      SUB_COMMITTEE_3, EMP_SUB_COMM3_NAME, ID, ID_No, ID_Type, Customer_Name, CIF_No, Dept_Br_Code, Request_Date, Response_Date
FROM         dbo.V_024_CA_OUTER_NCB_FROM023
WHERE     (SEQ = 1)

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
         Begin Table = "V_024_CA_OUTER_NCB_FROM023"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 268
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 54
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 60
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_025_CA_MAPPED_NCB_FROM024';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2355
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_025_CA_MAPPED_NCB_FROM024';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_025_CA_MAPPED_NCB_FROM024';

