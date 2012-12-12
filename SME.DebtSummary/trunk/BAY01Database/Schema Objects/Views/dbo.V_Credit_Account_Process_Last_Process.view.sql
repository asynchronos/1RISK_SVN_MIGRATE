CREATE VIEW dbo.V_Credit_Account_Process_Last_Process
AS
SELECT     dbo.V_CREDIT_ACCOUNT_PROCESS.ID, dbo.V_CREDIT_ACCOUNT_PROCESS.CIF, dbo.V_CREDIT_ACCOUNT_PROCESS.CUS_TITLE, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.CUS_FIRST, dbo.V_CREDIT_ACCOUNT_PROCESS.CUS_LAST, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_ID, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMPNAME, dbo.V_CREDIT_ACCOUNT_PROCESS.EMPSURNAME, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.PROCESS_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.PROCESS, dbo.V_CREDIT_ACCOUNT_PROCESS.DECB_RD, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.VALUE_APPROVE, dbo.V_CREDIT_ACCOUNT_PROCESS.VALUE, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.VALUE_OLD, dbo.V_CREDIT_ACCOUNT_PROCESS.Value_Customer, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.PROCESS_GROUP, dbo.V_CREDIT_ACCOUNT_PROCESS.DECB_RD_ID, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.SUBJECT_DETAIL_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.SUBJECT_ACTION, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.PROCESS_DATE, dbo.V_CREDIT_ACCOUNT_PROCESS.Id_Branch, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Branch_T, dbo.V_CREDIT_ACCOUNT_PROCESS.REGION_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.Region_Name, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.TITLE_NAME, dbo.V_CREDIT_ACCOUNT_PROCESS.Send_To_Board, dbo.V_CREDIT_ACCOUNT_PROCESS.IDEN, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.PEOCESS_HEAD, dbo.V_CREDIT_ACCOUNT_PROCESS.SUBJECT, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Job_Type, dbo.V_CREDIT_ACCOUNT_PROCESS.Board, dbo.V_CREDIT_ACCOUNT_PROCESS.Authority, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.LEVEL_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.LEVEL_NAME, dbo.V_CREDIT_ACCOUNT_PROCESS.Id_Region, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.SME_Referral_No, dbo.V_CREDIT_ACCOUNT_PROCESS.REFERENCE, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Bus_TypeD, dbo.V_CREDIT_ACCOUNT_PROCESS.Others, dbo.V_CREDIT_ACCOUNT_PROCESS.Reason, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Reason2, dbo.V_CREDIT_ACCOUNT_PROCESS.CM_Remark, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.LEVEL_PROCESS_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.HEAD_ID, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.HEAD_EMPNAME, dbo.V_CREDIT_ACCOUNT_PROCESS.HEAD_EMPSURNAME, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Customer_Size, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE3_ID, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE4_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.SIZE_DETAIL, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.ACCNO, dbo.V_CREDIT_ACCOUNT_PROCESS.SUBJECT_DETAIL, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.Id_Bus_Group, dbo.V_CREDIT_ACCOUNT_PROCESS.Bus_TypeG, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.BUSI_TYPE, dbo.V_CREDIT_ACCOUNT_PROCESS.Id_Bus_Type, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE2_ID, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE_TITLE, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE_NAME, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE_SUR, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE2_TITLE, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE2_NAME, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_APPROVE2_SUR, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_REQUEST_ID, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_REQUEST_TITLE, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_REQUEST_NAME, dbo.V_CREDIT_ACCOUNT_PROCESS.EMP_REQUEST_SUR, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.COVENANT_FLAG, dbo.V_CREDIT_ACCOUNT_PROCESS.DO_KFS_FLAG, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.SUB_COMMITTEE_1, dbo.V_CREDIT_ACCOUNT_PROCESS.SUB_COMMITTEE_2, 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.SUB_COMMITTEE_3, DBF_IMPORT.dbo.lim_exp.grp_lim AS lim_amt
FROM         dbo.V_CREDIT_ACCOUNT_PROCESS INNER JOIN
                      dbo.V_Credit_Account_ID_Last_Date ON dbo.V_CREDIT_ACCOUNT_PROCESS.ID = dbo.V_Credit_Account_ID_Last_Date.ID AND 
                      dbo.V_CREDIT_ACCOUNT_PROCESS.PROCESS_DATE = dbo.V_Credit_Account_ID_Last_Date.Last_Date LEFT OUTER JOIN
                      DBF_IMPORT.dbo.lim_exp ON dbo.V_CREDIT_ACCOUNT_PROCESS.CIF = DBF_IMPORT.dbo.lim_exp.cif

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[18] 2[15] 3) )"
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
         Begin Table = "V_CREDIT_ACCOUNT_PROCESS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 240
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 29
         End
         Begin Table = "V_Credit_Account_ID_Last_Date"
            Begin Extent = 
               Top = 0
               Left = 340
               Bottom = 184
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lim_exp (DBF_IMPORT.dbo)"
            Begin Extent = 
               Top = 169
               Left = 266
               Bottom = 324
               Right = 417
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
      Begin ColumnWidths = 9
         Width = 284
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
         Column = 2490
         Alias = 930
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Credit_Account_Process_Last_Process';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Credit_Account_Process_Last_Process';

