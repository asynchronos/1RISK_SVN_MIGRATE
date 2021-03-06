CREATE VIEW dbo.REPORT38_36_WITH_REGION
AS
SELECT     dbo.REPORT36_07_SUBJECT_NEW_CUS.OLD_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.CA_NO_ID, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CA_CREATE_DATE, dbo.REPORT36_07_SUBJECT_NEW_CUS.REFERENCE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.REFERENCE_DATE, dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_IDEN, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_DETAIL_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_DETAIL, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CIF, dbo.REPORT36_07_SUBJECT_NEW_CUS.ACCNO, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.DECB_RD_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.DECB_RD, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CASHTYPE, dbo.REPORT36_07_SUBJECT_NEW_CUS.DECB_RD2, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.OLD_VALUE, dbo.REPORT36_07_SUBJECT_NEW_CUS.RM_VALUE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CM_VALUE, dbo.REPORT36_07_SUBJECT_NEW_CUS.APPROVE_VALUE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.APPROVE_DATE, dbo.REPORT36_07_SUBJECT_NEW_CUS.REJECT_DATE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.REJECT_REASON, dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS_GROUP, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS_DATE, dbo.REPORT36_07_SUBJECT_NEW_CUS.EMP_ID, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.LEVEL_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.LEVEL_NAME, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_GROUP, dbo.REPORT36_07_SUBJECT_NEW_CUS.NEW_CUS, dbo.Id_Region.Region_Name, 
                      dbo.Id_Region.Id_Region, dbo.REPORT36_07_SUBJECT_NEW_CUS.Customer_Size
FROM         dbo.REPORT36_07_SUBJECT_NEW_CUS INNER JOIN
                      dbo.ANNALS_CREDIT ON dbo.REPORT36_07_SUBJECT_NEW_CUS.OLD_ID = dbo.ANNALS_CREDIT.ID INNER JOIN
                      dbo.Id_Region ON dbo.ANNALS_CREDIT.REGION_ID = dbo.Id_Region.Id_Region

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
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 243
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "Id_Region"
            Begin Extent = 
               Top = 6
               Left = 501
               Bottom = 232
               Right = 654
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT36_07_SUBJECT_NEW_CUS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 33
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
         Width = 2340
         Width = 1500
         Width = 2850
         Width = 1500
         Width = 2130
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT38_36_WITH_REGION';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Column = 2475
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT38_36_WITH_REGION';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT38_36_WITH_REGION';

