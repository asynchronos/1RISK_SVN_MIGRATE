CREATE VIEW CUSTOMER.V_001_EXPORT_SME_GROUP_CM_HEAD_MANAGER
AS
SELECT dbo.CUSTOMER_SME.CIF, dbo.GetName(dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST) 
               AS CUSTOMER_NAME, dbo.GetNameEng(dbo.CUSTOMER.CTITLE_E, dbo.CUSTOMER.CFIRST_E, dbo.CUSTOMER.CLAST_E) 
               AS CUSTOMER_NAME_E, dbo.CUSTOMER_SME.GROUP_ID, dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL, dbo.CUSTOMER_STATUS.STATUS_DETAIL, 
               dbo.CUSTOMER_SME.CM_CODE AS CM_EMP_ID, O.TITLE_NAME AS CM_TITLE_NAME, O.EMPNAME AS CM_FIRSTNAME, 
               O.EMPSURNAME AS CM_LASTNAME, O.TITLE_NAME_E AS CM_TITLE_NAME_E, O.EMPNAME_E AS CM_FIRSTNAME_E, 
               O.EMPSURNAME_E AS CM_LASTNAME_E, O.CATEGORY_DESC, O.HEAD_EMP_ID, HEAD_EMP.TITLE_NAME AS HEAD_TITLE_NAME, 
               HEAD_EMP.EMPNAME AS HEAD_FIRSTNAME, HEAD_EMP.EMPSURNAME AS HEAD_LASTNAME, 
               HEAD_EMP.TITLE_NAME_E AS HEAD_TITLE_NAME_E, HEAD_EMP.EMPNAME_E AS HEAD_FIRSTNAME_E, 
               HEAD_EMP.EMPSURNAME_E AS HEAD_LASTNAME_E, O.MANAGER_EMP_ID, MANAGER_EMP.TITLE_NAME AS MANAGER_TITLE_NAME, 
               MANAGER_EMP.EMPNAME AS MANAGER_FIRSTNAME, MANAGER_EMP.EMPSURNAME AS MANAGER_LASTNAME, 
               MANAGER_EMP.TITLE_NAME_E AS MANAGER_TITLE_NAME_E, MANAGER_EMP.EMPNAME_E AS MANAGER_FIRSTNAME_E, 
               MANAGER_EMP.EMPSURNAME_E AS MANAGER_LASTNAME_E
FROM  dbo.EMPLOYEE01 AS HEAD_EMP INNER JOIN
               CLASSIFY.V_008_CM_HEAD_MANAGER_SEQ1_ONLY AS O ON HEAD_EMP.EMP_ID = O.HEAD_EMP_ID INNER JOIN
               dbo.EMPLOYEE01 AS MANAGER_EMP ON O.MANAGER_EMP_ID = MANAGER_EMP.EMP_ID RIGHT OUTER JOIN
               dbo.CUSTOMER_STATUS RIGHT OUTER JOIN
               dbo.CUSTOMER_SME ON dbo.CUSTOMER_STATUS.STATUS_ID = dbo.CUSTOMER_SME.STATUS_ID ON 
               O.EMP_ID = dbo.CUSTOMER_SME.CM_CODE LEFT OUTER JOIN
               dbo.CUSTOMER_SME_SIZE ON dbo.CUSTOMER_SME.SIZE_ID = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
               dbo.CUSTOMER ON dbo.CUSTOMER_SME.CIF = dbo.CUSTOMER.CIF
WHERE (dbo.CUSTOMER_SME.CIF <> 0)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[18] 3) )"
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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = -98
      End
      Begin Tables = 
         Begin Table = "HEAD_EMP"
            Begin Extent = 
               Top = 106
               Left = 741
               Bottom = 214
               Right = 905
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "O"
            Begin Extent = 
               Top = 8
               Left = 492
               Bottom = 219
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MANAGER_EMP"
            Begin Extent = 
               Top = 42
               Left = 908
               Bottom = 150
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CUSTOMER_STATUS"
            Begin Extent = 
               Top = 9
               Left = 728
               Bottom = 102
               Right = 887
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME"
            Begin Extent = 
               Top = 17
               Left = 244
               Bottom = 212
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 135
               Left = 63
               Bottom = 228
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 16
               Left = 25
               Bottom = 124
               Right = 176', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_001_EXPORT_SME_GROUP_CM_HEAD_MANAGER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 3540
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1608
         Width = 1500
         Width = 1500
         Width = 4728
         Width = 1500
         Width = 1572
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
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 2232
         Alias = 2196
         Table = 4140
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_001_EXPORT_SME_GROUP_CM_HEAD_MANAGER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CUSTOMER', @level1type = N'VIEW', @level1name = N'V_001_EXPORT_SME_GROUP_CM_HEAD_MANAGER';

