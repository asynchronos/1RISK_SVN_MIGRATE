CREATE VIEW CA_REPORT.V_001_ANNALS_CREDIT
AS
SELECT AC.ID AS OLD_ID, A.ANNALS_YEAR + A.ANNALS_SEQ_NO AS CA_NO_ID, A.ANNALS_CREATE_DATE AS CA_CREATE_DATE, A.REFERENCE, 
               A.DATE_IN_ANNALS AS REFERENCE_DATE, AC.Customer_Size, AC.Send_To_Board, AUTHO.Authority, AC.EMP_REQUEST_ID, 
               dbo.GetName(EMP_REQUEST.TITLE_NAME, EMP_REQUEST.EMPNAME, EMP_REQUEST.EMPSURNAME) AS EMP_REQUEST_NAME, 
               AC.EMP_APPROVE_ID, dbo.GetName(EMP_APP1.TITLE_NAME, EMP_APP1.EMPNAME, EMP_APP1.EMPSURNAME) AS EMP_APPROVE1_NAME, 
               AC.EMP_APPROVE2_ID, dbo.GetName(EMP_APP2.TITLE_NAME, EMP_APP2.EMPNAME, EMP_APP2.EMPSURNAME) AS EMP_APPROVE2_NAME, 
               AC.EMP_APPROVE3_ID, dbo.GetName(EMP_APP3.TITLE_NAME, EMP_APP3.EMPNAME, EMP_APP3.EMPSURNAME) AS EMP_APPROVE3_NAME, 
               AC.EMP_APPROVE4_ID, dbo.GetName(EMP_APP4.TITLE_NAME, EMP_APP4.EMPNAME, EMP_APP4.EMPSURNAME) AS EMP_APPROVE4_NAME, 
               AC.SUB_COMMITTEE_1, dbo.GetName(EMP_SUB_COMM1.TITLE_NAME, EMP_SUB_COMM1.EMPNAME, EMP_SUB_COMM1.EMPSURNAME) 
               AS EMP_SUB_COMM1_NAME, AC.SUB_COMMITTEE_2, dbo.GetName(EMP_SUB_COMM2.TITLE_NAME, EMP_SUB_COMM2.EMPNAME, 
               EMP_SUB_COMM2.EMPSURNAME) AS EMP_SUB_COMM2_NAME, AC.SUB_COMMITTEE_3, dbo.GetName(EMP_SUB_COMM3.TITLE_NAME, 
               EMP_SUB_COMM3.EMPNAME, EMP_SUB_COMM3.EMPSURNAME) AS EMP_SUB_COMM3_NAME, CONVERT(int, AC.BRANCH_ID) AS BRANCH_ID, 
               BR.CATEGORY_DESC AS BRANCH_DESC, CONVERT(int, AC.REGION_ID) AS REGION_ID, REGION.CATEGORY_DESC AS REGION_DESC, AC.RM_ID, 
               AC.COVENANT_FLAG, AC.DO_KFS_FLAG, AC.OUT_OF_SCOPE_ID, AC.GROUP_EXPOSURE, AC.REVIEW_DATE, AC.ID_OUT, AC.EMP_CONTROL, 
               AC.Others, AC.Others2, AC.Reason, AC.Reason2, AC.CM_Remark
FROM  CLASSIFY.V_012_REGION AS REGION RIGHT OUTER JOIN
               dbo.ANNALS_CREDIT AS AC ON CONVERT(int, REGION.CATEGORY_VALUE) = CONVERT(int, AC.REGION_ID) LEFT OUTER JOIN
               CLASSIFY.V_010_BRANCH AS BR ON CONVERT(int, AC.BRANCH_ID) = CONVERT(int, BR.CATEGORY_VALUE) LEFT OUTER JOIN
               dbo.ANNALS AS A ON AC.ANNALS_YEAR = A.ANNALS_YEAR AND AC.ANNALS_TYPE = A.ANNALS_TYPE AND 
               AC.ANNALS_SEQ_NO = A.ANNALS_SEQ_NO LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_SUB_COMM3 ON AC.SUB_COMMITTEE_3 = EMP_SUB_COMM3.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_SUB_COMM2 ON AC.SUB_COMMITTEE_2 = EMP_SUB_COMM2.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_SUB_COMM1 ON AC.SUB_COMMITTEE_1 = EMP_SUB_COMM1.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_APP4 ON AC.EMP_APPROVE4_ID = EMP_APP4.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_APP3 ON AC.EMP_APPROVE3_ID = EMP_APP3.EMP_ID LEFT OUTER JOIN
               dbo.ANNALS_AUTHORITY AS AUTHO ON AC.Send_To_Board = AUTHO.Authority_id LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_REQUEST ON AC.EMP_REQUEST_ID = EMP_REQUEST.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_APP2 ON AC.EMP_APPROVE2_ID = EMP_APP2.EMP_ID LEFT OUTER JOIN
               dbo.EMPLOYEE01 AS EMP_APP1 ON AC.EMP_APPROVE_ID = EMP_APP1.EMP_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Configuration = "(H (4[50] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -1
         Left = 0
      End
      Begin Tables = 
         Begin Table = "REGION"
            Begin Extent = 
               Top = 200
               Left = 131
               Bottom = 336
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 10
               Left = 410
               Bottom = 146
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 20
         End
         Begin Table = "BR"
            Begin Extent = 
               Top = 148
               Left = 1088
               Bottom = 284
               Right = 1300
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "EMP_SUB_COMM3"
            Begin Extent = 
               Top = 139
               Left = 526
               Bottom = 275
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_SUB_COMM2"
            Begin Extent = 
               Top = 15
               Left = 857
               Bottom = 151
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_SUB_COMM1"
            Begin Extent = 
               Top = 7
               Left = 1040
               Bottom = 143
               Right = 1223
            End
            DisplayFlags', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_001_ANNALS_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP4"
            Begin Extent = 
               Top = 147
               Left = 48
               Bottom = 283
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP3"
            Begin Extent = 
               Top = 82
               Left = 91
               Bottom = 218
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AUTHO"
            Begin Extent = 
               Top = 51
               Left = 668
               Bottom = 187
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_REQUEST"
            Begin Extent = 
               Top = 154
               Left = 835
               Bottom = 290
               Right = 1018
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP2"
            Begin Extent = 
               Top = 287
               Left = 48
               Bottom = 423
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP1"
            Begin Extent = 
               Top = 287
               Left = 279
               Bottom = 423
               Right = 462
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
      Begin ColumnWidths = 39
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2604
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
         Width = 2256
         Width = 1200
         Width = 2208
         Width = 1488
         Width = 1296
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1704
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3204
         Alias = 1800
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_001_ANNALS_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_001_ANNALS_CREDIT';

