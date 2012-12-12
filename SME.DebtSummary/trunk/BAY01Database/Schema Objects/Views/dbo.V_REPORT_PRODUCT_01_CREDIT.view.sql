CREATE VIEW dbo.V_REPORT_PRODUCT_01_CREDIT
AS
SELECT     CONVERT(INT, SUBSTRING(dbo.ANNALS_CREDIT.ID, 7, 4) + SUBSTRING(dbo.ANNALS_CREDIT.ID, 1, 6)) AS NEW_ID, dbo.ANNALS_CREDIT.ID, 
                      dbo.ANNALS_CREDIT.ID_OUT, dbo.ANNALS_CREDIT.EMP_APPROVE_ID, dbo.ANNALS_JOB_TYPE.Job_Type, 
                      TB_TITLE_2.TITLE_NAME + TB_EMPLOYEE_2.EMPNAME + ' ' + TB_EMPLOYEE_2.EMPSURNAME AS EMP_APPROVE, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE2_ID, 
                      TB_TITLE_1.TITLE_NAME + TB_EMPLOYEE_1.EMPNAME + ' ' + TB_EMPLOYEE_1.EMPSURNAME AS EMP_APPROVE2, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE3_ID, 
                      TB_TITLE_4.TITLE_NAME + TB_EMPLOYEE_4.EMPNAME + ' ' + TB_EMPLOYEE_4.EMPSURNAME AS EMP_APPROVE3, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE4_ID, 
                      TB_TITLE_3.TITLE_NAME + TB_EMPLOYEE_3.EMPNAME + ' ' + TB_EMPLOYEE_3.EMPSURNAME AS EMP_APPROVE4, 
                      dbo.ANNALS_CREDIT.Send_To_Board, dbo.ANNALS_AUTHORITY.Authority, dbo.ANNALS_CREDIT.SME_Referral_No AS REFERRAL_NO, 
                      dbo.ANNALS_CREDIT.BRANCH_ID AS [BRANCH-ID], dbo.Id_Branch.Branch_T AS [BRANCH-NAME], dbo.ANNALS_CREDIT.REGION_ID AS [REGION-ID], 
                      dbo.Id_Region.Region_Name AS [REGION-NAME], dbo.ANNALS_CREDIT.Customer_Size, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, 
                      CASE WHEN Send_To_Board = 'True' OR
                      Send_To_Board = '1' THEN reason2 ELSE reason END AS REASON_REMARK, CASE WHEN Send_To_Board = 'True' OR
                      Send_To_Board = '1' THEN CM_Remark ELSE others END AS RESULT_REMARK, CASE WHEN Send_To_Board = 'True' OR
                      Send_To_Board = '1' THEN 'สินเชื่อในอำนาจคณะกรรมการ กสช.' ELSE 'สินเชื่อในอำนาจบุคคล' END AS [APP-TYPE], dbo.ANNALS_BOARD.Board, 
                      dbo.ANNALS.REFERENCE, dbo.ANNALS_CREDIT.Others, dbo.ANNALS_CREDIT.Others2, dbo.ANNALS_CREDIT.Result, dbo.ANNALS_CREDIT.Reason, 
                      dbo.ANNALS_CREDIT.Reason2, dbo.ANNALS_CREDIT.SUB_COMMITTEE_1, dbo.ANNALS_CREDIT.SUB_COMMITTEE_2, 
                      dbo.ANNALS_CREDIT.SUB_COMMITTEE_3, dbo.ANNALS_CREDIT.DO_KFS_FLAG, dbo.ANNALS_CREDIT.COVENANT_FLAG, 
                      dbo.ANNALS_CREDIT.Job_Type_Id, dbo.ANNALS_CREDIT.CM_Remark, dbo.ANNALS_CREDIT.CM_Judgement_Board, 
                      dbo.ANNALS_CREDIT.CM_Judgement, dbo.ANNALS_CREDIT.Comment, dbo.ANNALS_CREDIT.BOARD_ID, dbo.ANNALS_CREDIT.EMP_REQUEST_ID, 
                      dbo.TB_TITLE.TITLE_NAME + dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS EMP_REQUEST, 
                      dbo.ANNALS_CREDIT.OUT_OF_SCOPE_ID, dbo.ANNALS_OUT_OF_SCOPE.OUT_OF_SCOPE, dbo.ANNALS_CREDIT.GROUP_EXPOSURE, 
                      dbo.ANNALS_CREDIT.REVIEW_DATE
FROM         dbo.TB_EMPLOYEE AS TB_EMPLOYEE_1 INNER JOIN
                      dbo.TB_TITLE AS TB_TITLE_1 ON TB_EMPLOYEE_1.TITLE_CODE = TB_TITLE_1.TITLE_CODE RIGHT OUTER JOIN
                      dbo.Id_Branch RIGHT OUTER JOIN
                      dbo.ANNALS_JOB_TYPE RIGHT OUTER JOIN
                      dbo.TB_EMPLOYEE INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE RIGHT OUTER JOIN
                      dbo.ANNALS_OUT_OF_SCOPE RIGHT OUTER JOIN
                      dbo.ANNALS_CREDIT ON dbo.ANNALS_OUT_OF_SCOPE.OUT_OF_SCOPE_ID = dbo.ANNALS_CREDIT.OUT_OF_SCOPE_ID ON 
                      dbo.TB_EMPLOYEE.EMP_ID = dbo.ANNALS_CREDIT.EMP_REQUEST_ID ON 
                      dbo.ANNALS_JOB_TYPE.Job_Type_Id = dbo.ANNALS_CREDIT.Job_Type_Id LEFT OUTER JOIN
                      dbo.ANNALS_BOARD ON dbo.ANNALS_CREDIT.BOARD_ID = dbo.ANNALS_BOARD.Id LEFT OUTER JOIN
                      dbo.Id_Region ON dbo.ANNALS_CREDIT.REGION_ID = dbo.Id_Region.Id_Region ON 
                      dbo.Id_Branch.Id_Branch = dbo.ANNALS_CREDIT.BRANCH_ID LEFT OUTER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_3 INNER JOIN
                      dbo.TB_TITLE AS TB_TITLE_3 ON TB_EMPLOYEE_3.TITLE_CODE = TB_TITLE_3.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT.EMP_APPROVE4_ID = TB_EMPLOYEE_3.EMP_ID LEFT OUTER JOIN
                      dbo.TB_TITLE AS TB_TITLE_4 INNER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_4 ON TB_TITLE_4.TITLE_CODE = TB_EMPLOYEE_4.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT.EMP_APPROVE3_ID = TB_EMPLOYEE_4.EMP_ID LEFT OUTER JOIN
                      dbo.CUSTOMER_SME_SIZE ON dbo.ANNALS_CREDIT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
                      dbo.ANNALS_AUTHORITY ON dbo.ANNALS_CREDIT.Send_To_Board = dbo.ANNALS_AUTHORITY.Authority_id LEFT OUTER JOIN
                      dbo.TB_TITLE AS TB_TITLE_2 INNER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_2 ON TB_TITLE_2.TITLE_CODE = TB_EMPLOYEE_2.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT.EMP_APPROVE_ID = TB_EMPLOYEE_2.EMP_ID ON 
                      TB_EMPLOYEE_1.EMP_ID = dbo.ANNALS_CREDIT.EMP_APPROVE2_ID LEFT OUTER JOIN
                      dbo.ANNALS ON dbo.ANNALS_CREDIT.ANNALS_SEQ_NO = dbo.ANNALS.ANNALS_SEQ_NO AND 
                      dbo.ANNALS_CREDIT.ANNALS_TYPE = dbo.ANNALS.ANNALS_TYPE AND dbo.ANNALS_CREDIT.ANNALS_YEAR = dbo.ANNALS.ANNALS_YEAR

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[38] 2[10] 3) )"
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
         Begin Table = "ANNALS"
            Begin Extent = 
               Top = 13
               Left = 14
               Bottom = 68
               Right = 178
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_3"
            Begin Extent = 
               Top = 313
               Left = 514
               Bottom = 428
               Right = 679
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_3"
            Begin Extent = 
               Top = 289
               Left = 750
               Bottom = 389
               Right = 904
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ANNALS_BOARD"
            Begin Extent = 
               Top = 108
               Left = 9
               Bottom = 223
               Right = 174
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ANNALS_JOB_TYPE"
            Begin Extent = 
               Top = 284
               Left = 9
               Bottom = 369
               Right = 161
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 68
               Left = 528
               Bottom = 200
               Right = 693
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 64
               Left = 743
               Bottom = 164
               Right = 897
            End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_01_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 437
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 224
               Left = 8
               Bottom = 339
               Right = 161
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 155
               Left = 7
               Bottom = 270
               Right = 176
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_4"
            Begin Extent = 
               Top = 226
               Left = 742
               Bottom = 326
               Right = 896
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_4"
            Begin Extent = 
               Top = 253
               Left = 517
               Bottom = 368
               Right = 682
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 338
               Left = 14
               Bottom = 438
               Right = 166
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ANNALS_AUTHORITY"
            Begin Extent = 
               Top = 67
               Left = 13
               Bottom = 182
               Right = 176
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_2"
            Begin Extent = 
               Top = 11
               Left = 732
               Bottom = 111
               Right = 886
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_2"
            Begin Extent = 
               Top = 12
               Left = 504
               Bottom = 127
               Right = 669
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE_1"
            Begin Extent = 
               Top = 129
               Left = 526
               Bottom = 244
               Right = 691
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "TB_TITLE_1"
            Begin Extent = 
               Top = 161
               Left = 743
               Bottom = 261
               Right = 897
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ANNALS_OUT_OF_SCOPE"
            Begin Extent = 
               Top = 366
               Left = 517
               Bottom = 466
               Right = 695
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
      Begin ColumnWidths = 45
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_01_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'Width = 1500
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
         Column = 7905
         Alias = 1995
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_01_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_01_CREDIT';

