CREATE VIEW dbo.REPORT01_ANNALS_CREDIT
AS
SELECT     AC.ID AS OLD_ID, A.ANNALS_YEAR + A.ANNALS_SEQ_NO AS CA_NO_ID, A.ANNALS_CREATE_DATE AS CA_CREATE_DATE, A.REFERENCE, 
                      A.DATE_IN_ANNALS AS REFERENCE_DATE, AC.Customer_Size, A.RECIVER, AC.Send_To_Board, AUTHO.Authority, AC.EMP_REQUEST_ID, 
                      dbo.GetName(EMP_REQUEST.TITLE_NAME, EMP_REQUEST.EMPNAME, EMP_REQUEST.EMPSURNAME) AS EMP_REQUEST_NAME, 
                      AC.EMP_APPROVE_ID, dbo.GetName(EMP_APP1.TITLE_NAME, EMP_APP1.EMPNAME, EMP_APP1.EMPSURNAME) AS EMP_APPROVE1_NAME, 
                      AC.EMP_APPROVE2_ID, dbo.GetName(EMP_APP2.TITLE_NAME, EMP_APP2.EMPNAME, EMP_APP2.EMPSURNAME) AS EMP_APPROVE2_NAME, 
                      AC.EMP_APPROVE3_ID, dbo.GetName(EMP_APP3.TITLE_NAME, EMP_APP3.EMPNAME, EMP_APP3.EMPSURNAME) AS EMP_APPROVE3_NAME, 
                      AC.EMP_APPROVE4_ID, dbo.GetName(EMP_APP4.TITLE_NAME, EMP_APP4.EMPNAME, EMP_APP4.EMPSURNAME) AS EMP_APPROVE4_NAME, 
                      AC.REGION_ID, dbo.Id_Region.Region_Name, AC.SUB_COMMITTEE_1, dbo.GetName(EMP_SUB_COMM1.TITLE_NAME, 
                      EMP_SUB_COMM1.EMPNAME, EMP_SUB_COMM1.EMPSURNAME) AS EMP_SUB_COMM1_NAME, AC.SUB_COMMITTEE_2, 
                      dbo.GetName(EMP_SUB_COMM2.TITLE_NAME, EMP_SUB_COMM2.EMPNAME, EMP_SUB_COMM2.EMPSURNAME) AS EMP_SUB_COMM2_NAME, 
                      AC.SUB_COMMITTEE_3, dbo.GetName(EMP_SUB_COMM3.TITLE_NAME, EMP_SUB_COMM3.EMPNAME, EMP_SUB_COMM3.EMPSURNAME) 
                      AS EMP_SUB_COMM3_NAME, AC.BRANCH_ID
FROM         dbo.ANNALS AS A INNER JOIN
                      dbo.ANNALS_CREDIT AS AC ON A.ANNALS_YEAR = AC.ANNALS_YEAR AND A.ANNALS_TYPE = AC.ANNALS_TYPE AND 
                      A.ANNALS_SEQ_NO = AC.ANNALS_SEQ_NO LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_SUB_COMM3 ON AC.SUB_COMMITTEE_3 = EMP_SUB_COMM3.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_SUB_COMM2 ON AC.SUB_COMMITTEE_2 = EMP_SUB_COMM2.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_SUB_COMM1 ON AC.SUB_COMMITTEE_1 = EMP_SUB_COMM1.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_APP4 ON AC.EMP_APPROVE4_ID = EMP_APP4.EMP_ID LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMP_APP3 ON AC.EMP_APPROVE3_ID = EMP_APP3.EMP_ID LEFT OUTER JOIN
                      dbo.Id_Region ON AC.REGION_ID = dbo.Id_Region.Id_Region LEFT OUTER JOIN
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
         Left = -23
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AC"
            Begin Extent = 
               Top = 7
               Left = 265
               Bottom = 208
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "EMP_SUB_COMM3"
            Begin Extent = 
               Top = 125
               Left = 1330
               Bottom = 240
               Right = 1495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_SUB_COMM2"
            Begin Extent = 
               Top = 125
               Left = 1146
               Bottom = 240
               Right = 1311
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_SUB_COMM1"
            Begin Extent = 
               Top = 126
               Left = 958
               Bottom = 241
               Right = 1123
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP4"
            Begin Extent = 
               Top = 6
               Left = 1187
               Bottom = 121
               Right = 1352
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "EMP_APP3"
            Begin Extent = 
               Top = 6
               Left = 984
               Bottom = 121
               Right = 1149
            End
            D', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT01_ANNALS_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'isplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 210
               Left = 38
               Bottom = 325
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AUTHO"
            Begin Extent = 
               Top = 126
               Left = 781
               Bottom = 241
               Right = 933
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_REQUEST"
            Begin Extent = 
               Top = 126
               Left = 578
               Bottom = 241
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP2"
            Begin Extent = 
               Top = 6
               Left = 781
               Bottom = 121
               Right = 946
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMP_APP1"
            Begin Extent = 
               Top = 6
               Left = 578
               Bottom = 121
               Right = 743
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
      Begin ColumnWidths = 18
         Width = 284
         Width = 1245
         Width = 1665
         Width = 1935
         Width = 1725
         Width = 1935
         Width = 1770
         Width = 1500
         Width = 1500
         Width = 1725
         Width = 1965
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
         Column = 6630
         Alias = 2160
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT01_ANNALS_CREDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT01_ANNALS_CREDIT';

