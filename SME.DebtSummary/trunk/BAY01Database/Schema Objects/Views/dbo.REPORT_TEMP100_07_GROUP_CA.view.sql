CREATE VIEW dbo.REPORT_TEMP100_07_GROUP_CA
AS
SELECT     R.OLD_ID, R.CA_NO_ID, R.CA_CREATE_DATE, R.REFERENCE, R.REFERENCE_DATE, R.CIF, C.OFFICR_ID, dbo.GetName(O.TITLE_NAME, O.EMPNAME, 
                      O.EMPSURNAME) AS OFFICER_NAME, R.OLD_VALUEs, R.RM_VALUEs, R.CM_VALUEs, R.APPROVE_VALUEs, R.APPROVE_DATE, R.REJECT_DATE, 
                      R.REJECT_REASON, R.LAST_PROCESS, R.LAST_PROCESS_ID, R.LAST_PROCESS_GROUP, R.LAST_PROCESS_DATE, R.MONTH_LAST_PROCESS, 
                      R.EMP_ID, R.EMPNAME, R.LEVEL_ID, R.LEVEL_NAME, R.NEW_CUS, R.Reason, R.Customer_Size, R.SIZE_DETAIL, R.SUBJECT_GROUP, R.RECIVER, 
                      AC.Send_To_Board, AUTHO.Authority, AC.EMP_REQUEST_ID, dbo.GetName(EMP_REQUEST.TITLE_NAME, EMP_REQUEST.EMPNAME, 
                      EMP_REQUEST.EMPSURNAME) AS EMP_REQUEST_NAME, AC.EMP_APPROVE_ID, dbo.GetName(EMP_APP1.TITLE_NAME, EMP_APP1.EMPNAME, 
                      EMP_APP1.EMPSURNAME) AS EMP_APPROVE1_NAME, AC.EMP_APPROVE2_ID, dbo.GetName(EMP_APP2.TITLE_NAME, EMP_APP2.EMPNAME, 
                      EMP_APP2.EMPSURNAME) AS EMP_APPROVE2_NAME
FROM         dbo.CUSTOMER AS C INNER JOIN
                      dbo.REPORT59_07_WITH_REASON AS R ON C.CIF = R.CIF INNER JOIN
                      dbo.ANNALS_AUTHORITY AS AUTHO INNER JOIN
                      dbo.ANNALS_CREDIT AS AC ON AUTHO.Authority_id = AC.Send_To_Board ON R.OLD_ID = AC.ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_REQUEST ON AC.EMP_REQUEST_ID = EMP_REQUEST.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_APP2 ON AC.EMP_APPROVE2_ID = EMP_APP2.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_APP1 ON AC.EMP_APPROVE_ID = EMP_APP1.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS O ON C.OFFICR_ID = O.EMP_ID

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
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (1[56] 3) )"
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
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4[60] 2) )"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -448
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 64
               Bottom = 121
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 7
               Left = 246
               Bottom = 195
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AUTHO"
            Begin Extent = 
               Top = 66
               Left = 949
               Bottom = 181
               Right = 1101
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 5
               Left = 475
               Bottom = 193
               Right = 664
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "EMP_REQUEST"
            Begin Extent = 
               Top = 0
               Left = 880
               Bottom = 115
               Right = 1045
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP2"
            Begin Extent = 
               Top = 120
               Left = 695
               Bottom = 235
               Right = 860
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP1"
            Begin Extent = 
               Top = 0
               Left = 701
               Bottom = 115
               Right = 866
            End
            DisplayFlags = 280
            T', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP100_07_GROUP_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'opColumn = 1
         End
         Begin Table = "O"
            Begin Extent = 
               Top = 134
               Left = 51
               Bottom = 249
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Width = 2010
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
         Width = 6645
         Width = 1530
         Width = 1620
         Width = 1530
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4725
         Alias = 2115
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP100_07_GROUP_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP100_07_GROUP_CA';

