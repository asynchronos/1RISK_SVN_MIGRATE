CREATE VIEW dbo.REPORT62_61_SME_LAST_APPROVE
AS
SELECT     SME00.CIF, SME00.CUSTOMER_NAME, SME00.CM_CODE, SME00.CM_NAME, SME00.BRANCH_ID, SME00.BRANCH_NAME, SME00.Id_Region, 
                      SME00.Region_Name, SME00.GROUP_SIZE_ID, SME00.GROUP_SIZE_DETAIL, SME00.JUDGEMENT_ID, SME00.JUDGEMENT_DETAIL, 
                      SME00.BUSI_RISK1_ID, SME00.BUSI_RISK1_DETAIL, SME00.STATUS_ID, SME00.STATUS_DETAIL, SME00.SIZE_ID, SME00.SIZE_DETAIL, 
                      SME00.ByCustomer_ASOF, SME00.Class, SME00.Principal, R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.APPROVE_VALUEs, R.APPROVE_DATE, 
                      R.Reason, R.LAST_PROCESS_ID, R.LAST_PROCESS, R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, R.LP_END_OF_MONTH, R.EMP_ID, 
                      R.EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.NEW_CUS, R.SUBJECT_GROUP, R.RECIVER, R.Send_To_Board, CASE WHEN R.Send_To_Board IS NULL
                       THEN NULL WHEN R.Send_To_Board = 1 THEN R.Authority ELSE 'สินเชื่อในอำนาจบุคคล' END AS Authority, R.EMP_REQUEST_ID, 
                      R.EMP_REQUEST_NAME, R.EMP_APPROVE_ID, R.EMP_APPROVE1_NAME, R.EMP_APPROVE2_ID, R.EMP_APPROVE2_NAME, R.EMP_APPROVE3_ID, 
                      R.EMP_APPROVE3_NAME, R.EMP_APPROVE4_ID, R.EMP_APPROVE4_NAME
FROM         dbo.REPORT61_60_APPROVE_ONLY AS R RIGHT OUTER JOIN
                      dbo.CUSTOMER_SME02_00_WITH_BYCUSTOMER AS SME00 ON R.CIF = SME00.CIF

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
               Left = 302
               Bottom = 253
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "SME00"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 253
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 36
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 52
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
         Width = 2685
         Width = 1500
         Width = 7920
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
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT62_61_SME_LAST_APPROVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2235
         Alias = 4755
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT62_61_SME_LAST_APPROVE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT62_61_SME_LAST_APPROVE';

