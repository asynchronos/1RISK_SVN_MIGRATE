CREATE VIEW [dbo].[V_018_APPROVE_CA]
AS
SELECT     R.CIF, R.OLD_ID, SUM(R.APPROVE_VALUE) AS APPROVE_VALUEs, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')) AS REASON, 
                      R.LAST_PROCESS, R.LAST_PROCESS_ID, R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, CONVERT(NVARCHAR(6), R.LAST_PROCESS_DATE, 
                      112) AS LAST_PROCESS_MONTH, R.EMP_ID AS LAST_PROCESS_BY_ID, dbo.GetName(dbo.EMPLOYEE01.TITLE_NAME, 
                      dbo.EMPLOYEE01.EMPNAME, dbo.EMPLOYEE01.EMPSURNAME) AS LAST_PROCESS_BY_NAME, R.LEVEL_ID AS CA_LEVEL_ID, R.LEVEL_NAME, 
                      R.Customer_Size AS CA_SIZE_ID, R.SIZE_DETAIL AS CA_SIZE_DETAIL, R.REGION_ID AS CA_REGION_ID, R.Region_Name AS CA_REGION_NAME, 
                      MIN(R.SUBJECT_GROUP) AS SUBJECT_GROUP, CASE SUBJECT_DETAIL_ID WHEN '101' THEN 'YES' ELSE 'NO' END AS NEW_CUS, 
                      R.Send_To_Board, R.Authority, R.EMP_REQUEST_ID, R.EMP_REQUEST_NAME, R.EMP_APPROVE_ID AS EMP_APPROVE1_ID, 
                      R.EMP_APPROVE1_NAME, R.EMP_APPROVE2_ID, R.EMP_APPROVE2_NAME, R.EMP_APPROVE3_ID, R.EMP_APPROVE3_NAME, 
                      R.EMP_APPROVE4_ID, R.EMP_APPROVE4_NAME, R.SUB_COMMITTEE_1, R.EMP_SUB_COMM1_NAME, R.SUB_COMMITTEE_2, 
                      R.EMP_SUB_COMM2_NAME, R.SUB_COMMITTEE_3, R.EMP_SUB_COMM3_NAME
FROM         dbo.REPORT07_SUMMARY AS R INNER JOIN
                      dbo.ANNALS_CREDIT AS C ON R.OLD_ID = C.ID INNER JOIN
                      dbo.EMPLOYEE01 ON R.EMP_ID = dbo.EMPLOYEE01.EMP_ID
WHERE     (R.APPROVE_DATE IS NOT NULL)
GROUP BY R.CIF, R.OLD_ID, LTRIM(ISNULL(C.Reason, N'') + N' ' + ISNULL(C.Others, N'')), R.LAST_PROCESS, R.LAST_PROCESS_ID, 
                      R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, CONVERT(NVARCHAR(6), R.LAST_PROCESS_DATE, 112), R.EMP_ID, R.LEVEL_ID, 
                      R.LEVEL_NAME, R.Customer_Size, R.SIZE_DETAIL, R.REGION_ID, R.Region_Name, R.Send_To_Board, R.Authority, R.EMP_REQUEST_ID, 
                      R.EMP_REQUEST_NAME, R.EMP_APPROVE_ID, R.EMP_APPROVE1_NAME, R.EMP_APPROVE2_ID, R.EMP_APPROVE2_NAME, R.EMP_APPROVE3_ID, 
                      R.EMP_APPROVE3_NAME, R.EMP_APPROVE4_ID, R.EMP_APPROVE4_NAME, R.SUB_COMMITTEE_1, R.EMP_SUB_COMM1_NAME, 
                      R.SUB_COMMITTEE_2, R.EMP_SUB_COMM2_NAME, R.SUB_COMMITTEE_3, R.EMP_SUB_COMM3_NAME, 
                      CASE SUBJECT_DETAIL_ID WHEN '101' THEN 'YES' ELSE 'NO' END, dbo.GetName(dbo.EMPLOYEE01.TITLE_NAME, dbo.EMPLOYEE01.EMPNAME, 
                      dbo.EMPLOYEE01.EMPSURNAME), R.APPROVE_DATE

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
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 295
               Bottom = 121
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 6
               Left = 538
               Bottom = 121
               Right = 719
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
      Begin ColumnWidths = 12
         Column = 3150
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_018_APPROVE_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_018_APPROVE_CA';

