CREATE VIEW dbo.REPORT07_SUMMARY
AS
SELECT dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CA_NO_ID, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CA_CREATE_DATE, dbo.REPORT06B_REGIS_PROCESS.PROCESS_DATE AS REGIS_DATE, 
               dbo.REPORT06B_REGIS_PROCESS.EMP_ID AS REGIS_BY, dbo.REPORT06B_REGIS_PROCESS.LEVEL_ID AS REGIS_LEVEL_ID, 
               dbo.REPORT06B_REGIS_PROCESS.LEVEL_NAME AS REGIS_LEVEL_NAME, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.REFERENCE, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.REFERENCE_DATE, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_IDEN, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_DETAIL_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_DETAIL, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_ACTION, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CIF, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.ACCNO, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.DECB_RD_ID, 
               REPLACE(dbo.REPORT02_ANNALS_CREDIT_SUBJECT.DECB_RD, 'PN', 'P/N') AS DECB_RD, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CASHTYPE, 
               CASE WHEN DECB_RD <> 'O/D' AND DECB_RD <> 'T/L' AND DECB_RD <> 'L/G' AND DECB_RD <> 'PN' AND 
               DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 'P/N') END AS DECB_RD2, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_VALUE, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.RM_VALUE, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CM_VALUE, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.APPROVE_VALUE, 
               dbo.REPORT04_LAST_APPROVE_PROCESS.PROCESS_DATE AS APPROVE_DATE, 
               dbo.REPORT05_LAST_REJECT_PROCESS.PROCESS_DATE AS REJECT_DATE, 
               dbo.REPORT05_LAST_REJECT_PROCESS.PROCESS AS REJECT_REASON, dbo.REPORT06_LAST_PROCESS.PROCESS AS LAST_PROCESS, 
               dbo.REPORT06_LAST_PROCESS.PROCESS_ID AS LAST_PROCESS_ID, 
               dbo.REPORT06_LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, 
               dbo.REPORT06_LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE, dbo.REPORT06_LAST_PROCESS.EMP_ID, 
               dbo.REPORT06_LAST_PROCESS.LEVEL_ID, dbo.REPORT06_LAST_PROCESS.LEVEL_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.Customer_Size, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, 
               CASE dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID WHEN '01' THEN '1_CREDIT' WHEN '07' THEN '2_REVIEW' ELSE '3_OTHER' END AS SUBJECT_GROUP,
                dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.RECIVER, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.Send_To_Board, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.Authority, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_REQUEST_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_REQUEST_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE1_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE2_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE2_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE3_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE3_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE4_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_APPROVE4_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.PRODUCT_CODE, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.PROJECT_CODE, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.REGION_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.Region_Name, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUB_COMMITTEE_1, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_SUB_COMM1_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUB_COMMITTEE_2, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_SUB_COMM2_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUB_COMMITTEE_3, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.EMP_SUB_COMM3_NAME, 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.BRANCH_ID, C.CATEGORY_VALUE_LINK AS OLD_REGION_ID, 
               C.CATEGORY_DESC_TH_LINK AS OLD_REGION
FROM  dbo.REPORT02_ANNALS_CREDIT_SUBJECT LEFT OUTER JOIN
                   (SELECT CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_TYPE_KEY, PRIORITY, DEL_FLAG, 
                                   LINKED_TYPE_KEY, CATEGORY_RECURSIVE_DEL_FLAG, CATEGORY_KEY_LINK, CATEGORY_DESC_LINK, CATEGORY_DESC_TH_LINK, 
                                   CATEGORY_VALUE_LINK, CATEGORY_TYPE_KEY_LINK, PRIORITY_LINK, DEL_FLAG_LINK
                    FROM   CLASSIFY.V_004_LINKED_CATEGORY_TYPE_2_INFO
                    WHERE (CATEGORY_TYPE_KEY = 2) AND (CATEGORY_TYPE_KEY_LINK = 3)) AS C ON 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.BRANCH_ID = CONVERT(int, C.CATEGORY_VALUE) LEFT OUTER JOIN
               dbo.REPORT06B_REGIS_PROCESS ON 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID = dbo.REPORT06B_REGIS_PROCESS.OLD_ID LEFT OUTER JOIN
               dbo.CUSTOMER_SME_SIZE ON dbo.REPORT02_ANNALS_CREDIT_SUBJECT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
               dbo.ANNALS_SUBJECT_DETAIL ON 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
               dbo.REPORT04_LAST_APPROVE_PROCESS ON 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID = dbo.REPORT04_LAST_APPROVE_PROCESS.OLD_ID LEFT OUTER JOIN
               dbo.REPORT05_LAST_REJECT_PROCESS ON 
               dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID = dbo.REPORT05_LAST_REJECT_PROCESS.OLD_ID LEFT OUTER JOIN
               dbo.REPORT06_LAST_PROCESS ON dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID = dbo.REPORT06_LAST_PROCESS.OLD_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[12] 3) )"
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
         Top = -223
         Left = 0
      End
      Begin Tables = 
         Begin Table = "REPORT02_ANNALS_CREDIT_SUBJECT"
            Begin Extent = 
               Top = 1
               Left = 401
               Bottom = 364
               Right = 583
            End
            DisplayFlags = 280
            TopColumn = 30
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 321
               Left = 41
               Bottom = 457
               Right = 326
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT06B_REGIS_PROCESS"
            Begin Extent = 
               Top = 230
               Left = 614
               Bottom = 410
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 179
               Left = 49
               Bottom = 279
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 58
               Left = 720
               Bottom = 173
               Right = 911
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT04_LAST_APPROVE_PROCESS"
            Begin Extent = 
               Top = 0
               Left = 27
               Bottom = 144
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT05_LAST_REJECT_PROCESS"
            Begin Extent = 
               Top = 86
               Left = 213', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT07_SUMMARY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Bottom = 205
               Right = 372
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT06_LAST_PROCESS"
            Begin Extent = 
               Top = 0
               Left = 966
               Bottom = 177
               Right = 1134
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
      Begin ColumnWidths = 64
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1608
         Width = 1500
         Width = 1500
         Width = 2280
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
         Width = 2988
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
         Column = 13716
         Alias = 1956
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT07_SUMMARY';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT07_SUMMARY';

