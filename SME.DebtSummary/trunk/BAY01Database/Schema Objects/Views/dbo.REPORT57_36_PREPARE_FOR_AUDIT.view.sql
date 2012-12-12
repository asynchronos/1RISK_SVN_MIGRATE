CREATE VIEW [dbo].[REPORT57_36_PREPARE_FOR_AUDIT]
AS
SELECT     dbo.REPORT36_07_SUBJECT_NEW_CUS.CA_NO_ID, dbo.REPORT36_07_SUBJECT_NEW_CUS.CA_CREATE_DATE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.REFERENCE, dbo.REPORT36_07_SUBJECT_NEW_CUS.REFERENCE_DATE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_DETAIL, dbo.REPORT36_07_SUBJECT_NEW_CUS.NEW_CUS, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CIF, dbo.GetName(dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST) 
                      AS CUS_NAME, dbo.Bus_Type.Id_Bus_Type, dbo.Bus_Type.Bus_TypeD, dbo.REPORT36_07_SUBJECT_NEW_CUS.ACCNO, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.DECB_RD, dbo.REPORT36_07_SUBJECT_NEW_CUS.OLD_VALUE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.RM_VALUE, dbo.REPORT36_07_SUBJECT_NEW_CUS.CM_VALUE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.APPROVE_VALUE, dbo.REPORT36_07_SUBJECT_NEW_CUS.APPROVE_DATE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.REJECT_DATE, dbo.REPORT36_07_SUBJECT_NEW_CUS.REJECT_REASON, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS, dbo.REPORT36_07_SUBJECT_NEW_CUS.LAST_PROCESS_DATE, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.EMP_ID, dbo.GetName(dbo.EMPLOYEE01.TITLE_NAME, dbo.EMPLOYEE01.EMPNAME, 
                      dbo.EMPLOYEE01.EMPSURNAME) AS EMP_NAME, dbo.REPORT36_07_SUBJECT_NEW_CUS.LEVEL_NAME, 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.SUBJECT_GROUP, ASOF.AS_OF_CLASS, dbo.ByCustomer.Class, dbo.ByCustomer.AGING
FROM         dbo.EMPLOYEE01 INNER JOIN
                      dbo.REPORT36_07_SUBJECT_NEW_CUS ON dbo.EMPLOYEE01.EMP_ID = dbo.REPORT36_07_SUBJECT_NEW_CUS.EMP_ID LEFT OUTER JOIN
                      dbo.ByCustomer ON dbo.REPORT36_07_SUBJECT_NEW_CUS.CIF = dbo.ByCustomer.Cif LEFT OUTER JOIN
                      dbo.Bus_Type INNER JOIN
                      dbo.CUSTOMER ON dbo.Bus_Type.Id_Bus_Type = dbo.CUSTOMER.BUSI_TYPE ON 
                      dbo.REPORT36_07_SUBJECT_NEW_CUS.CIF = dbo.CUSTOMER.CIF CROSS JOIN
                          (SELECT     ASOF AS AS_OF_CLASS
                            FROM          dbo.DEBTDATE
                            WHERE      (Upd_TABLE = 'ByCustomer')) AS ASOF

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
         Begin Table = "REPORT36_07_SUBJECT_NEW_CUS"
            Begin Extent = 
               Top = 2
               Left = 405
               Bottom = 205
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 5
               Left = 633
               Bottom = 192
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bus_Type"
            Begin Extent = 
               Top = 3
               Left = 814
               Bottom = 118
               Right = 973
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 148
               Left = 24
               Bottom = 263
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ByCustomer"
            Begin Extent = 
               Top = 3
               Left = 210
               Bottom = 191
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "ASOF"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 76
               Right = 190
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
      Begin ColumnWidths = 30
         Width = 284
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT57_36_PREPARE_FOR_AUDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
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
         Width = 1560
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1665
         Width = 1605
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT57_36_PREPARE_FOR_AUDIT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT57_36_PREPARE_FOR_AUDIT';

