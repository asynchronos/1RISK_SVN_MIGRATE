CREATE VIEW CA_REPORT.V_012_CA_SUBJECT_SUMMARY2
AS
SELECT     V02.OLD_ID, V02.CA_NO_ID, V02.CA_CREATE_DATE, V02.REFERENCE, V02.REFERENCE_DATE, V02.SIZE_ID, V02.SIZE_DETAIL, V02.SUBJECT_IDEN, 
                      DETAIL.SUBJECT_ID, V02.SUBJECT_DETAIL_ID, V02.SUBJECT_DETAIL, V02.SUBJECT_GROUP, V02.SUBJECT_ACTION, V02.CIF, V02.ACCNO, 
                      V02.DECB_RD_ID, CONVERT(nvarchar(50), REPLACE(V02.DECB_RD, 'PN', 'P/N')) AS DECB_RD, V02.CASHTYPE, CASE WHEN DECB_RD <> 'O/D' AND 
                      DECB_RD <> 'T/L' AND DECB_RD <> 'L/G' AND DECB_RD <> 'PN' AND DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 
                      'P/N') END AS DECB_RD2, V02.OLD_VALUE, CASE WHEN V02.RM_VALUE >= 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_PLUS, 
                      CASE WHEN V02.RM_VALUE < 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_MINUS, 
                      CASE WHEN V02.CM_VALUE >= 0 THEN V02.CM_VALUE ELSE NULL END AS CM_VALUE_PLUS, 
                      CASE WHEN V02.CM_VALUE < 0 THEN V02.CM_VALUE ELSE NULL END AS CM_VALUE_MINUS, 
                      CASE WHEN V02.APPROVE_VALUE >= 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_PLUS, 
                      CASE WHEN V02.APPROVE_VALUE < 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_MINUS, 
                      LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, LAST_PROCESS.PROCESS_HEAD AS LAST_PROCESS_HEAD, 
                      LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE, LAST_PROCESS.EMP_ID AS LAST_PROCESS_EMP_ID, 
                      LAST_PROCESS.LEVEL_ID AS LAST_PROCESS_LEVEL_ID, LAST_PROCESS.LEVEL_NAME AS LAST_PROCESS_LEVEL_NAME, V02.ID_OUT, 
                      A.ANNALS_CREATE_DATE AS ID_OUT_CREATED_DATE, V02.Send_To_Board AS AUTHORITY_ID, V02.Authority AS AUTHORITY_DESC, 
                      V02.EMP_REQUEST_ID, V02.EMP_REQUEST_NAME, V02.EMP_APPROVE_ID AS EMP_APPROVE1_ID, V02.EMP_APPROVE1_NAME, 
                      V02.EMP_APPROVE2_ID, V02.EMP_APPROVE2_NAME, V02.EMP_APPROVE3_ID, V02.EMP_APPROVE3_NAME, V02.EMP_APPROVE4_ID, 
                      V02.EMP_APPROVE4_NAME, V02.SUB_COMMITTEE_1 AS SUB_COMMITTEE_1_ID, V02.EMP_SUB_COMM1_NAME, 
                      V02.SUB_COMMITTEE_2 AS SUB_COMMITTEE_2_ID, V02.EMP_SUB_COMM2_NAME, V02.SUB_COMMITTEE_3 AS SUB_COMMITTEE_3_ID, 
                      V02.EMP_SUB_COMM3_NAME, V02.RM_ID, dbo.GetName(RM.TITLE_NAME, RM.EMPNAME, RM.EMPSURNAME) AS RM_NAME, V02.BRANCH_ID, 
                      V02.BRANCH_DESC, V02.REGION_ID, V02.REGION_DESC, V02.GROUP_EXPOSURE, V02.REVIEW_DATE AS NEXT_REVIEW_DATE, 
                      V02.PRODUCT_CODE, V02.PROJECT_CODE, PROJECT.Project_Name AS PROJECT_DESC, V02.COVENANT_FLAG, 
                      CASE V02.COVENANT_FLAG WHEN 0 THEN 'ไม่มี' WHEN 1 THEN 'มีCOVENANATครั้งนี้' WHEN 2 THEN 'ใช้COVENANATเดิม' ELSE NULL 
                      END AS COVENANT_DESC, V02.DO_KFS_FLAG, CASE DO_KFS_FLAG WHEN 0 THEN 'NO' WHEN 1 THEN 'YES' ELSE NULL END AS DO_KFS_DESC, 
                      V02.OUT_OF_SCOPE_ID, dbo.ANNALS_OUT_OF_SCOPE.OUT_OF_SCOPE, V02.PROPOSAL_ID, V02.PROPOSAL_NAME
FROM         CA_REPORT.V_002_ANNALS_CREDIT_SUBJECT AS V02 INNER JOIN
                      dbo.ANNALS AS A ON SUBSTRING(V02.ID_OUT, 1, 1) = A.ANNALS_TYPE AND SUBSTRING(V02.ID_OUT, 2, 5) = A.ANNALS_SEQ_NO AND 
                      CONVERT(nvarchar(4), CONVERT(int, SUBSTRING(V02.ID_OUT, 8, 4)) - 543) = A.ANNALS_YEAR LEFT OUTER JOIN
                      dbo.ANNALS_OUT_OF_SCOPE ON V02.OUT_OF_SCOPE_ID = dbo.ANNALS_OUT_OF_SCOPE.OUT_OF_SCOPE_ID LEFT OUTER JOIN
                      dbo.ANNALS_PROJECT AS PROJECT ON V02.PROJECT_CODE = PROJECT.Project_Code LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS RM ON V02.RM_ID = RM.EMP_ID LEFT OUTER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL AS DETAIL ON V02.SUBJECT_DETAIL_ID = DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
                      CA_REPORT.V_005_LAST_PROCESS AS LAST_PROCESS ON V02.OLD_ID = LAST_PROCESS.OLD_ID
WHERE     (V02.CIF <> 0)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[15] 3) )"
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
         Top = -31
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V02"
            Begin Extent = 
               Top = 11
               Left = 23
               Bottom = 273
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 42
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 0
               Left = 271
               Bottom = 115
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_OUT_OF_SCOPE"
            Begin Extent = 
               Top = 1
               Left = 670
               Bottom = 119
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PROJECT"
            Begin Extent = 
               Top = 0
               Left = 478
               Bottom = 118
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RM"
            Begin Extent = 
               Top = 212
               Left = 447
               Bottom = 327
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DETAIL"
            Begin Extent = 
               Top = 100
               Left = 468
               Bottom = 215
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LAST_PROCESS"
            Begin Extent = 
               Top = 122
               Left = 271
               Bottom = 237
               Right = 439
            End
            DisplayFlags = 2', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_012_CA_SUBJECT_SUMMARY2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'80
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 69
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1545
         Width = 1650
         Width = 1515
         Width = 1590
         Width = 1665
         Width = 1410
         Width = 1275
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2595
         Alias = 2100
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_012_CA_SUBJECT_SUMMARY2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_012_CA_SUBJECT_SUMMARY2';

