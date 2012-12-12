
CREATE VIEW [dbo].[v_Credit_Account_Process_Rank]
AS
SELECT     TOP (100) PERCENT RANK() OVER (PARTITION BY dbo.ANNALS_CREDIT_PROCESS.ID
ORDER BY dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE DESC) AS RANK,
DENSE_RANK() OVER (PARTITION BY dbo.ANNALS_CREDIT_ACCOUNT.ID ORDER BY dbo.ANNALS_CREDIT_ACCOUNT.CIF DESC) AS NUMCIF, 
dbo.ANNALS_CREDIT.ID, dbo.CUSTOMER.CUS_TITLE, 
dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, dbo.ANNALS_CREDIT_PROCESS.EMP_ID, dbo.TB_EMPLOYEE.EMPNAME, 
dbo.TB_EMPLOYEE.EMPSURNAME, dbo.ANNALS_PROCESS.PROCESS_ID, dbo.ANNALS_PROCESS.PROCESS, dbo.ANNALS_GL_TYPE.DECB_RD, 
dbo.ANNALS_CREDIT_ACCOUNT.VALUE_APPROVE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE, dbo.ANNALS_CREDIT_ACCOUNT.VALUE_OLD, 
dbo.ANNALS_CREDIT_ACCOUNT.Value_Customer, dbo.ANNALS_PROCESS.PROCESS_GROUP, dbo.ANNALS_GL_TYPE.DECB_RD_ID, 
dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ACTION, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, 
dbo.Id_Branch.Id_Branch, dbo.Id_Branch.Branch_T, dbo.Id_Region.Id_Region, dbo.Id_Region.Region_Name, dbo.TB_TITLE.TITLE_NAME, 
dbo.ANNALS_CREDIT.Send_To_Board, dbo.ANNALS_CREDIT_ACCOUNT.IDEN, dbo.ANNALS_PROCESS.PEOCESS_HEAD, dbo.ANNALS_SUBJECT.SUBJECT, 
dbo.ANNALS_JOB_TYPE.Job_Type, dbo.ANNALS_BOARD.Board, dbo.ANNALS_AUTHORITY.Authority, dbo.ANNALS_CREDIT_ACCOUNT.CIF, 
dbo.Controlling_Level.LEVEL_ID, dbo.ANNALS_CREDIT.REGION_ID, dbo.Controlling_Level.LEVEL_NAME
FROM         dbo.ANNALS_GL_TYPE INNER JOIN
                      dbo.ANNALS_CREDIT_ACCOUNT ON dbo.ANNALS_GL_TYPE.DECB_RD_ID = dbo.ANNALS_CREDIT_ACCOUNT.DECB_RD_ID INNER JOIN
                      dbo.ANNALS_PROCESS INNER JOIN
                      dbo.ANNALS_CREDIT_PROCESS ON dbo.ANNALS_PROCESS.PROCESS_ID = dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID INNER JOIN
                      dbo.ANNALS_CREDIT ON dbo.ANNALS_CREDIT_PROCESS.ID = dbo.ANNALS_CREDIT.ID ON 
                      dbo.ANNALS_CREDIT_ACCOUNT.ID = dbo.ANNALS_CREDIT.ID INNER JOIN
                      dbo.ANNALS_SUBJECT_DETAIL ON 
                      dbo.ANNALS_CREDIT_ACCOUNT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID INNER JOIN
                      dbo.Controlling_Level ON dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID INNER JOIN
                      dbo.ANNALS_SUBJECT ON dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID = dbo.ANNALS_SUBJECT.SUBJECT_ID INNER JOIN
                      dbo.ANNALS_AUTHORITY ON dbo.ANNALS_CREDIT.Send_To_Board = dbo.ANNALS_AUTHORITY.Authority_id LEFT OUTER JOIN
                      dbo.ANNALS_BOARD ON dbo.ANNALS_CREDIT.BOARD_ID = dbo.ANNALS_BOARD.Id LEFT OUTER JOIN
                      dbo.ANNALS_JOB_TYPE ON dbo.ANNALS_CREDIT.Job_Type_Id = dbo.ANNALS_JOB_TYPE.Job_Type_Id LEFT OUTER JOIN
                      dbo.TB_TITLE INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.TB_TITLE.TITLE_CODE = dbo.TB_EMPLOYEE.TITLE_CODE ON 
                      dbo.ANNALS_CREDIT_PROCESS.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID LEFT OUTER JOIN
                      dbo.CUSTOMER ON dbo.ANNALS_CREDIT_ACCOUNT.CIF = dbo.CUSTOMER.CIF LEFT OUTER JOIN
                      dbo.Id_Region INNER JOIN
                      dbo.Id_Branch ON dbo.Id_Region.Id_Region = dbo.Id_Branch.Id_Region ON dbo.ANNALS_CREDIT.BRANCH_ID = dbo.Id_Branch.Id_Branch
ORDER BY  ID,RANK

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[15] 2[24] 3) )"
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Credit_Account_Process_Rank';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Credit_Account_Process_Rank';

