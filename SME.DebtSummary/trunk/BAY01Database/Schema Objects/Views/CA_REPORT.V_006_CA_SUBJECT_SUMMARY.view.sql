CREATE VIEW CA_REPORT.V_006_CA_SUBJECT_SUMMARY
AS
SELECT     R02.OLD_ID, R02.CA_NO_ID, R02.CA_CREATE_DATE, R_REGIS.PROCESS_DATE AS REGIS_DATE, R_REGIS.EMP_ID AS REGIS_BY, 
                      R_REGIS.LEVEL_ID AS REGIS_LEVEL_ID, R_REGIS.LEVEL_NAME AS REGIS_LEVEL_NAME, R02.REFERENCE, R02.REFERENCE_DATE, 
                      R02.SUBJECT_IDEN, R02.SUBJECT_DETAIL_ID, R02.SUBJECT_DETAIL, R02.SUBJECT_ACTION, R02.CIF, R02.ACCNO, R02.DECB_RD_ID, 
                      REPLACE(R02.DECB_RD, 'PN', 'P/N') AS DECB_RD, R02.CASHTYPE, CASE WHEN DECB_RD <> 'O/D' AND DECB_RD <> 'T/L' AND 
                      DECB_RD <> 'L/G' AND DECB_RD <> 'PN' AND DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 'P/N') END AS DECB_RD2, 
                      R02.OLD_VALUE, R02.RM_VALUE, R02.CM_VALUE, R02.APPROVE_VALUE, LAST_APPROVE.PROCESS_DATE AS APPROVE_DATE, 
                      LAST_REJECT.PROCESS_DATE AS REJECT_DATE, LAST_REJECT.PROCESS AS REJECT_REASON, LAST_PROCESS.PROCESS AS LAST_PROCESS, 
                      LAST_PROCESS.PROCESS_ID AS LAST_PROCESS_ID, LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, 
                      LAST_PROCESS.PROCESS_HEAD AS LAST_PROCESS_HEAD, LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE, LAST_PROCESS.EMP_ID, 
                      dbo.GetName(dbo.EMPLOYEE01.TITLE_NAME, dbo.EMPLOYEE01.EMPNAME, dbo.EMPLOYEE01.EMPSURNAME) AS EMP_NAME, 
                      LAST_PROCESS.LEVEL_ID, LAST_PROCESS.LEVEL_NAME, R02.SIZE_ID, R02.SIZE_DETAIL, 
                      CASE DETAIL.SUBJECT_ID WHEN '01' THEN '1_CREDIT' WHEN '07' THEN '2_REVIEW' ELSE '3_OTHER' END AS SUBJECT_GROUP, 
                      DETAIL.SUBJECT_ID, R02.Send_To_Board, R02.Authority, R02.EMP_REQUEST_ID, R02.EMP_REQUEST_NAME, R02.EMP_APPROVE_ID, 
                      R02.EMP_APPROVE1_NAME, R02.EMP_APPROVE2_ID, R02.EMP_APPROVE2_NAME, R02.EMP_APPROVE3_ID, R02.EMP_APPROVE3_NAME, 
                      R02.EMP_APPROVE4_ID, R02.EMP_APPROVE4_NAME, R02.PRODUCT_CODE, R02.PROJECT_CODE, R02.REGION_ID, R02.SUB_COMMITTEE_1, 
                      R02.EMP_SUB_COMM1_NAME, R02.SUB_COMMITTEE_2, R02.EMP_SUB_COMM2_NAME, R02.SUB_COMMITTEE_3, R02.EMP_SUB_COMM3_NAME, 
                      R02.BRANCH_ID, C.CATEGORY_VALUE_LINK AS OLD_REGION_ID, C.CATEGORY_DESC_TH_LINK AS OLD_REGION, R02.GROUP_EXPOSURE, 
                      R02.REVIEW_DATE, R02.ID_OUT, A.ANNALS_CREATE_DATE AS ID_OUT_CREATED_DATE, R02.BRANCH_DESC, R02.REGION_DESC, 
                      R02.PROPOSAL_ID, R02.PROPOSAL_NAME
FROM         dbo.EMPLOYEE01 RIGHT OUTER JOIN
                      CA_REPORT.V_005_LAST_PROCESS AS LAST_PROCESS ON dbo.EMPLOYEE01.EMP_ID = LAST_PROCESS.EMP_ID RIGHT OUTER JOIN
                      CA_REPORT.V_002_ANNALS_CREDIT_SUBJECT AS R02 INNER JOIN
                      dbo.ANNALS AS A ON SUBSTRING(R02.ID_OUT, 1, 1) = A.ANNALS_TYPE AND SUBSTRING(R02.ID_OUT, 2, 5) = A.ANNALS_SEQ_NO AND 
                      CONVERT(nvarchar(4), CONVERT(int, SUBSTRING(R02.ID_OUT, 8, 4)) - 543) = A.ANNALS_YEAR LEFT OUTER JOIN
                          (SELECT     CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_TYPE_KEY, PRIORITY, DEL_FLAG, 
                                                   LINKED_TYPE_KEY, CATEGORY_RECURSIVE_DEL_FLAG, CATEGORY_KEY_LINK, CATEGORY_DESC_LINK, CATEGORY_DESC_TH_LINK,
                                                    CATEGORY_VALUE_LINK, CATEGORY_TYPE_KEY_LINK, PRIORITY_LINK, DEL_FLAG_LINK
                            FROM          CLASSIFY.V_004_LINKED_CATEGORY_TYPE_2_INFO
                            WHERE      (CATEGORY_TYPE_KEY = 2) AND (CATEGORY_TYPE_KEY_LINK = 3)) AS C ON R02.BRANCH_ID = CONVERT(int, C.CATEGORY_VALUE) 
                      LEFT OUTER JOIN
                      CA_REPORT.V_004_REGIS_PROCESS AS R_REGIS ON R02.OLD_ID = R_REGIS.OLD_ID LEFT OUTER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL AS DETAIL ON R02.SUBJECT_DETAIL_ID = DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
                          (SELECT     OLD_ID, PROCESS_ID, PROCESS, PROCESS_DATE, PROCESS_GROUP, LEVEL_ID, LEVEL_NAME, EMP_ID
                            FROM          CA_REPORT.V_005_LAST_PROCESS
                            WHERE      (PROCESS_GROUP = 'D')) AS LAST_APPROVE ON R02.OLD_ID = LAST_APPROVE.OLD_ID LEFT OUTER JOIN
                          (SELECT     OLD_ID, PROCESS_ID, CONVERT(nvarchar(200), PROCESS) AS PROCESS, CONVERT(datetime, PROCESS_DATE) AS PROCESS_DATE, 
                                                   PROCESS_GROUP, LEVEL_ID, LEVEL_NAME, EMP_ID
                            FROM          CA_REPORT.V_005_LAST_PROCESS AS V_005_LAST_PROCESS_1
                            WHERE      (PROCESS_GROUP = 'E')) AS LAST_REJECT ON R02.OLD_ID = LAST_REJECT.OLD_ID ON LAST_PROCESS.OLD_ID = R02.OLD_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
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
         Left = -9
      End
      Begin Tables = 
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 145
               Left = 492
               Bottom = 281
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "LAST_PROCESS"
            Begin Extent = 
               Top = 147
               Left = 274
               Bottom = 283
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "R02"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 51
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 144
               Left = 987
               Bottom = 280
               Right = 1209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 7
               Left = 326
               Bottom = 143
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R_REGIS"
            Begin Extent = 
               Top = 7
               Left = 659
               Bottom = 143
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DETAIL"
            Begin Extent = 
               Top = 146
               Left = 736
               Bottom = 282
               Right = 950
            End
            DisplayFlags = 280', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_006_CA_SUBJECT_SUMMARY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'TopColumn = 0
         End
         Begin Table = "LAST_APPROVE"
            Begin Extent = 
               Top = 7
               Left = 1116
               Bottom = 143
               Right = 1303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LAST_REJECT"
            Begin Extent = 
               Top = 148
               Left = 48
               Bottom = 284
               Right = 235
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
      Begin ColumnWidths = 71
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
         Width = 1530
         Width = 2175
         Width = 1200
         Width = 1470
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
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2325
         Alias = 2310
         Table = 1530
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_006_CA_SUBJECT_SUMMARY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_006_CA_SUBJECT_SUMMARY';

