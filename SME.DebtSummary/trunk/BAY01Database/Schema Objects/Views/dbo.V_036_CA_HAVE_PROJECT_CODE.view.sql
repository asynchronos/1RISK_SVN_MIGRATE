CREATE VIEW dbo.V_036_CA_HAVE_PROJECT_CODE
AS
SELECT dbo.REPORT07_SUMMARY.OLD_ID, dbo.REPORT07_SUMMARY.CA_NO_ID, dbo.REPORT07_SUMMARY.CA_CREATE_DATE, 
               dbo.REPORT07_SUMMARY.REGIS_DATE, dbo.REPORT07_SUMMARY.REGIS_BY, dbo.REPORT07_SUMMARY.REGIS_LEVEL_ID, 
               dbo.REPORT07_SUMMARY.REGIS_LEVEL_NAME, dbo.REPORT07_SUMMARY.REFERENCE, dbo.REPORT07_SUMMARY.REFERENCE_DATE, 
               dbo.REPORT07_SUMMARY.SUBJECT_IDEN, dbo.REPORT07_SUMMARY.SUBJECT_DETAIL_ID, dbo.REPORT07_SUMMARY.SUBJECT_DETAIL, 
               dbo.REPORT07_SUMMARY.SUBJECT_ACTION, dbo.REPORT07_SUMMARY.CIF, dbo.CUSTOMER_INFO.Cifname AS CIF_NAME, 
               dbo.REPORT07_SUMMARY.ACCNO, dbo.REPORT07_SUMMARY.DECB_RD_ID, dbo.REPORT07_SUMMARY.DECB_RD, 
               dbo.REPORT07_SUMMARY.CASHTYPE, dbo.REPORT07_SUMMARY.DECB_RD2, dbo.REPORT07_SUMMARY.OLD_VALUE, 
               dbo.REPORT07_SUMMARY.RM_VALUE, dbo.REPORT07_SUMMARY.CM_VALUE, dbo.REPORT07_SUMMARY.APPROVE_VALUE, 
               dbo.REPORT07_SUMMARY.APPROVE_DATE, dbo.REPORT07_SUMMARY.REJECT_DATE, dbo.REPORT07_SUMMARY.REJECT_REASON, 
               dbo.REPORT07_SUMMARY.LAST_PROCESS, dbo.REPORT07_SUMMARY.LAST_PROCESS_ID, dbo.REPORT07_SUMMARY.LAST_PROCESS_GROUP, 
               dbo.REPORT07_SUMMARY.LAST_PROCESS_DATE, dbo.REPORT07_SUMMARY.EMP_ID, dbo.REPORT07_SUMMARY.LEVEL_ID, 
               dbo.REPORT07_SUMMARY.LEVEL_NAME, dbo.REPORT07_SUMMARY.Customer_Size, dbo.REPORT07_SUMMARY.SIZE_DETAIL, 
               dbo.REPORT07_SUMMARY.SUBJECT_GROUP, dbo.REPORT07_SUMMARY.SUBJECT_ID, dbo.REPORT07_SUMMARY.RECIVER, 
               dbo.REPORT07_SUMMARY.Send_To_Board, dbo.REPORT07_SUMMARY.Authority, dbo.REPORT07_SUMMARY.EMP_REQUEST_ID, 
               dbo.REPORT07_SUMMARY.EMP_REQUEST_NAME, dbo.REPORT07_SUMMARY.EMP_APPROVE_ID, 
               dbo.REPORT07_SUMMARY.EMP_APPROVE1_NAME, dbo.REPORT07_SUMMARY.EMP_APPROVE2_ID, 
               dbo.REPORT07_SUMMARY.EMP_APPROVE2_NAME, dbo.REPORT07_SUMMARY.EMP_APPROVE3_ID, 
               dbo.REPORT07_SUMMARY.EMP_APPROVE3_NAME, dbo.REPORT07_SUMMARY.EMP_APPROVE4_ID, 
               dbo.REPORT07_SUMMARY.EMP_APPROVE4_NAME, dbo.REPORT07_SUMMARY.PRODUCT_CODE, dbo.REPORT07_SUMMARY.PROJECT_CODE, 
               dbo.REPORT07_SUMMARY.REGION_ID, dbo.REPORT07_SUMMARY.Region_Name, dbo.REPORT07_SUMMARY.SUB_COMMITTEE_1, 
               dbo.REPORT07_SUMMARY.EMP_SUB_COMM1_NAME, dbo.REPORT07_SUMMARY.SUB_COMMITTEE_2, 
               dbo.REPORT07_SUMMARY.EMP_SUB_COMM2_NAME, dbo.REPORT07_SUMMARY.SUB_COMMITTEE_3, 
               dbo.REPORT07_SUMMARY.EMP_SUB_COMM3_NAME, dbo.REPORT07_SUMMARY.BRANCH_ID, dbo.REPORT07_SUMMARY.OLD_REGION_ID, 
               dbo.REPORT07_SUMMARY.OLD_REGION
FROM  dbo.REPORT07_SUMMARY LEFT OUTER JOIN
               dbo.CUSTOMER_INFO ON dbo.REPORT07_SUMMARY.CIF = dbo.CUSTOMER_INFO.CIF
WHERE (dbo.REPORT07_SUMMARY.PROJECT_CODE <> N'0000') AND (LEN(dbo.REPORT07_SUMMARY.PROJECT_CODE) > 0)

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
         Begin Table = "REPORT07_SUMMARY"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_INFO"
            Begin Extent = 
               Top = 7
               Left = 326
               Bottom = 143
               Right = 500
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_036_CA_HAVE_PROJECT_CODE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_036_CA_HAVE_PROJECT_CODE';

