CREATE VIEW dbo.REPORT64_63_BYCUS
AS
SELECT     R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.REFERENCE, R.REFERENCE_DATE, R.CIF, R.OLD_VALUEs, R.RM_VALUEs, R.CM_VALUEs, 
                      R.APPROVE_VALUEs, R.APPROVE_DATE, R.REJECT_DATE, R.REJECT_REASON, R.LAST_PROCESS, R.LAST_PROCESS_ID, 
                      R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, R.LP_END_OF_MONTH, R.EMP_ID, R.EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.NEW_CUS, 
                      R.Reason, R.Customer_Size, R.SIZE_DETAIL, R.SUBJECT_GROUP, R.RECIVER, R.Send_To_Board, R.Authority, R.EMP_REQUEST_ID, 
                      R.EMP_REQUEST_NAME, R.EMP_APPROVE_ID, R.EMP_APPROVE1_NAME, R.EMP_APPROVE2_ID, R.EMP_APPROVE2_NAME, R.CUS_NAME, 
                      R.OFFICR_ID, R.OFFICR_NAME, R.BEINGCUST, R.CM_CODE, R.CM_NAME, R.BRANCH_ID, R.BRANCH_NAME, R.Id_Region, R.Region_Name, 
                      R.GROUP_SIZE_ID, R.GROUP_SIZE_DETAIL, R.JUDGEMENT_ID, R.JUDGEMENT_DETAIL, R.BUSI_RISK1_ID, R.BUSI_RISK1_DETAIL, R.STATUS_ID, 
                      R.STATUS_DETAIL, ByCus.BaySize, ByCus.NPLFLAG, ByCus.Tdr, ByCus.Class, ByCus.Principal, ByCus.Rating
FROM         dbo.REPORT63_59_CUS_SME AS R LEFT OUTER JOIN
                      dbo.ByCustomer AS ByCus ON R.CIF = ByCus.Cif

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
               Bottom = 239
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ByCus"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 239
               Right = 432
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
      Begin ColumnWidths = 60
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
         Width = 1755', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT64_63_BYCUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
         Width = 1770
         Width = 1500
         Width = 1725
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
         Column = 1890
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT64_63_BYCUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT64_63_BYCUS';

