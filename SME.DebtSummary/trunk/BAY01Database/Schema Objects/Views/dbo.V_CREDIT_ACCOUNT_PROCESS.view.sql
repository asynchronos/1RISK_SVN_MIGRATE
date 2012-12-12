CREATE VIEW dbo.V_CREDIT_ACCOUNT_PROCESS
AS
SELECT     TOP (100) PERCENT dbo.ANNALS_CREDIT.ID, dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, 
                      dbo.ANNALS_CREDIT_PROCESS.EMP_ID, dbo.TB_EMPLOYEE.EMPNAME, dbo.TB_EMPLOYEE.EMPSURNAME, dbo.ANNALS_PROCESS.PROCESS_ID, 
                      dbo.ANNALS_PROCESS.PROCESS, dbo.ANNALS_GL_TYPE.DECB_RD, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_APPROVE, 
                      dbo.ANNALS_CREDIT_ACCOUNT.VALUE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD, dbo.ANNALS_CREDIT_ACCOUNT.Value_Customer, 
                      dbo.ANNALS_PROCESS.PROCESS_GROUP, dbo.ANNALS_GL_TYPE.DECB_RD_ID, dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID, 
                      dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.Id_Branch.Id_Branch, 
                      dbo.Id_Branch.Branch_T, dbo.Id_Region.Id_Region AS REGION_ID, dbo.Id_Region.Region_Name, dbo.TB_TITLE.TITLE_NAME, 
                      dbo.ANNALS_CREDIT.Send_To_Board, dbo.ANNALS_CREDIT_ACCOUNT.IDEN, dbo.ANNALS_PROCESS.PEOCESS_HEAD, 
                      dbo.ANNALS_SUBJECT.SUBJECT, dbo.ANNALS_JOB_TYPE.Job_Type, dbo.ANNALS_BOARD.Board, dbo.ANNALS_AUTHORITY.Authority, 
                      dbo.ANNALS_CREDIT_ACCOUNT.CIF, dbo.Controlling_Level.LEVEL_ID, dbo.Controlling_Level.LEVEL_NAME, dbo.Id_Branch.Id_Region, 
                      dbo.ANNALS_CREDIT.SME_Referral_No, dbo.ANNALS.REFERENCE, dbo.Bus_Type.Bus_TypeD, dbo.ANNALS_CREDIT.Others, 
                      dbo.ANNALS_CREDIT.Reason, dbo.ANNALS_CREDIT.Reason2, dbo.ANNALS_CREDIT.CM_Remark, 
                      dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID AS LEVEL_PROCESS_ID, dbo.V_Controlling_LeadsInLevel_HeadOnly.EMP_ID AS HEAD_ID, 
                      dbo.V_Controlling_LeadsInLevel_HeadOnly.EMPNAME AS HEAD_EMPNAME, 
                      dbo.V_Controlling_LeadsInLevel_HeadOnly.EMPSURNAME AS HEAD_EMPSURNAME, dbo.ANNALS_CREDIT.Customer_Size, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE3_ID, dbo.ANNALS_CREDIT.EMP_APPROVE4_ID, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, 
                      dbo.ANNALS_CREDIT_ACCOUNT.ACCNO, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL, dbo.Bus_Group.Bus_TypeG, 
                      dbo.Bus_Type.Id_Bus_Group, dbo.CUSTOMER.BUSI_TYPE, dbo.CUSTOMER.BUSI_TYPE AS Id_Bus_Type, dbo.ANNALS_CREDIT.EMP_APPROVE_ID, 
                      dbo.ANNALS_CREDIT.EMP_APPROVE2_ID, EMPLOYEE01_1.TITLE_NAME AS EMP_APPROVE_TITLE, 
                      EMPLOYEE01_1.EMPNAME AS EMP_APPROVE_NAME, EMPLOYEE01_1.EMPSURNAME AS EMP_APPROVE_SUR, 
                      dbo.EMPLOYEE01.TITLE_NAME AS EMP_APPROVE2_TITLE, dbo.EMPLOYEE01.EMPNAME AS EMP_APPROVE2_NAME, 
                      dbo.EMPLOYEE01.EMPSURNAME AS EMP_APPROVE2_SUR, dbo.ANNALS_CREDIT.EMP_REQUEST_ID, 
                      EMPLOYEE01_2.TITLE_NAME AS EMP_REQUEST_TITLE, EMPLOYEE01_2.EMPNAME AS EMP_REQUEST_NAME, 
                      EMPLOYEE01_2.EMPSURNAME AS EMP_REQUEST_SUR, dbo.ANNALS_CREDIT.COVENANT_FLAG, dbo.ANNALS_CREDIT.DO_KFS_FLAG, 
                      dbo.ANNALS_CREDIT.SUB_COMMITTEE_1, dbo.ANNALS_CREDIT.SUB_COMMITTEE_2, dbo.ANNALS_CREDIT.SUB_COMMITTEE_3, 
                      DBF_IMPORT.dbo.lim_exp.grp_lim AS lim_amt
FROM         dbo.CUSTOMER_SME_SIZE RIGHT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMPLOYEE01_1 RIGHT OUTER JOIN
                      dbo.ANNALS_GL_TYPE INNER JOIN
                      dbo.ANNALS_CREDIT_ACCOUNT ON dbo.ANNALS_GL_TYPE.DECB_RD_ID = dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID INNER JOIN
                      dbo.ANNALS_PROCESS INNER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON dbo.ANNALS_PROCESS.PROCESS_ID = dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID INNER JOIN
                      dbo.ANNALS_CREDIT ON dbo.ANNALS_CREDIT_PROCESS.ID = dbo.ANNALS_CREDIT.ID ON 
                      dbo.ANNALS_CREDIT_ACCOUNT.ID = dbo.ANNALS_CREDIT.ID INNER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL ON 
                      dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID INNER JOIN
                      dbo.Controlling_Level ON dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID INNER JOIN
                      dbo.ANNALS_SUBJECT ON dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID = dbo.ANNALS_SUBJECT.SUBJECT_ID INNER JOIN
                      dbo.ANNALS_AUTHORITY ON dbo.ANNALS_CREDIT.Send_To_Board = dbo.ANNALS_AUTHORITY.Authority_id INNER JOIN
                      dbo.ANNALS ON dbo.ANNALS_CREDIT.ANNALS_YEAR = dbo.ANNALS.ANNALS_YEAR AND 
                      dbo.ANNALS_CREDIT.ANNALS_SEQ_NO = dbo.ANNALS.ANNALS_SEQ_NO AND 
                      dbo.ANNALS_CREDIT.ANNALS_TYPE = dbo.ANNALS.ANNALS_TYPE LEFT OUTER JOIN
                      DBF_IMPORT.dbo.lim_exp ON dbo.ANNALS_CREDIT_ACCOUNT.CIF = DBF_IMPORT.dbo.lim_exp.cif LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMPLOYEE01_2 ON dbo.ANNALS_CREDIT.EMP_REQUEST_ID = EMPLOYEE01_2.EMP_ID ON 
                      EMPLOYEE01_1.EMP_ID = dbo.ANNALS_CREDIT.EMP_APPROVE_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 ON dbo.ANNALS_CREDIT.EMP_APPROVE2_ID = dbo.EMPLOYEE01.EMP_ID ON 
                      dbo.CUSTOMER_SME_SIZE.SIZE_ID = dbo.ANNALS_CREDIT.Customer_Size LEFT OUTER JOIN
                      dbo.V_Controlling_LeadsInLevel_HeadOnly ON 
                      dbo.Controlling_Level.LEVEL_ID = dbo.V_Controlling_LeadsInLevel_HeadOnly.LEVEL_ID LEFT OUTER JOIN
                      dbo.ANNALS_BOARD ON dbo.ANNALS_CREDIT.BOARD_ID = dbo.ANNALS_BOARD.Id LEFT OUTER JOIN
                      dbo.ANNALS_JOB_TYPE ON dbo.ANNALS_CREDIT.Job_Type_Id = dbo.ANNALS_JOB_TYPE.Job_Type_Id LEFT OUTER JOIN
                      dbo.TB_TITLE INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.TB_TITLE.TITLE_CODE = dbo.TB_EMPLOYEE.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT_PROCESS.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID LEFT OUTER JOIN
                      dbo.CUSTOMER LEFT OUTER JOIN
                      dbo.Bus_Type LEFT OUTER JOIN
                      dbo.Bus_Group ON dbo.Bus_Type.Id_Bus_Group = dbo.Bus_Group.Id_Bus_Group ON dbo.CUSTOMER.BUSI_TYPE = dbo.Bus_Type.Id_Bus_Type ON 
                      dbo.ANNALS_CREDIT_ACCOUNT.CIF = dbo.CUSTOMER.CIF LEFT OUTER JOIN
                      dbo.Id_Region INNER JOIN
                      dbo.Id_Branch ON dbo.Id_Region.Id_Region = dbo.Id_Branch.Id_Region ON dbo.ANNALS_CREDIT.BRANCH_ID = dbo.Id_Branch.Id_Branch
ORDER BY dbo.ANNALS_CREDIT.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[58] 2[16] 3) )"
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
         Top = -403
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 431
               Left = 780
               Bottom = 548
               Right = 948
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01_1"
            Begin Extent = 
               Top = 48
               Left = 232
               Bottom = 191
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_GL_TYPE"
            Begin Extent = 
               Top = 472
               Left = 864
               Bottom = 580
               Right = 1031
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_ACCOUNT"
            Begin Extent = 
               Top = 405
               Left = 200
               Bottom = 768
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ANNALS_PROCESS"
            Begin Extent = 
               Top = 150
               Left = 853
               Bottom = 279
               Right = 1092
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT_PROCESS"
            Begin Extent = 
               Top = 4
               Left = 658
               Bottom = 164
               Right = 896
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 0
               Left = 481
               Bottom = 440', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CREDIT_ACCOUNT_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Right = 671
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_SUBJECT_DETAIL"
            Begin Extent = 
               Top = 233
               Left = 121
               Bottom = 398
               Right = 325
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 282
               Left = 863
               Bottom = 419
               Right = 1053
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_SUBJECT"
            Begin Extent = 
               Top = 257
               Left = 13
               Bottom = 372
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_AUTHORITY"
            Begin Extent = 
               Top = 469
               Left = 497
               Bottom = 592
               Right = 687
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS"
            Begin Extent = 
               Top = 226
               Left = 586
               Bottom = 341
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "lim_exp (DBF_IMPORT.dbo)"
            Begin Extent = 
               Top = 642
               Left = 471
               Bottom = 774
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "EMPLOYEE01_2"
            Begin Extent = 
               Top = 376
               Left = 224
               Bottom = 510
               Right = 389
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 208
               Left = 200
               Bottom = 361
               Right = 365
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_Controlling_LeadsInLevel_HeadOnly"
            Begin Extent = 
               Top = 221
               Left = 1208
               Bottom = 447
               Right = 1362
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ANNALS_BOARD"
            Begin Extent = 
               Top = 525
               Left = 593
               Bottom = 646
               Right = 773
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_JOB_TYPE"
            Begin Extent = 
               Top = 173
               Left = 22
               Bottom = 258
               Right = 174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 13
               Left = 1012
               Bottom = 106
               Right = 1165
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 12
               Left = 815
               Bottom = 120
               Right = 979
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 378
               L', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CREDIT_ACCOUNT_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'eft = 15
               Bottom = 577
               Right = 166
            End
            DisplayFlags = 280
            TopColumn = 27
         End
         Begin Table = "Bus_Type"
            Begin Extent = 
               Top = 497
               Left = 202
               Bottom = 649
               Right = 361
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bus_Group"
            Begin Extent = 
               Top = 592
               Left = 14
               Bottom = 683
               Right = 166
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 14
               Left = 14
               Bottom = 178
               Right = 166
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Id_Branch"
            Begin Extent = 
               Top = 16
               Left = 174
               Bottom = 233
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 1365
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
         Width = 3615
         Width = 3600
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3435
         Alias = 4290
         Table = 2445
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CREDIT_ACCOUNT_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CREDIT_ACCOUNT_PROCESS';

