CREATE VIEW dbo.V_01_CM_HeadCM_Data_A
AS
SELECT     dbo.CUSTOMER_SME00_ALL_STATUS.CIF, dbo.CUSTOMER_SME00_ALL_STATUS.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE, EMPLOYEE01_1.EMPNAME_E, EMPLOYEE01_1.EMPSURNAME_E, 
                      dbo.CONTROLLING_LINE_FULL.LEAD_ID, dbo.EMPLOYEE01.EMPNAME_E AS LEADNAME_E, 
                      dbo.EMPLOYEE01.EMPSURNAME_E AS LEADSURNAME_E, dbo.CUSTOMER_SME00_ALL_STATUS.CUSTOMER_NAME_E, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_ID, dbo.CUSTOMER_SME00_ALL_STATUS.Id_Region, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.Region_Name, dbo.CUSTOMER_SME00_ALL_STATUS.BRANCH_ID, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.BRANCH_NAME
FROM         dbo.EMPLOYEE01 INNER JOIN
                      dbo.CONTROLLING_LINE_FULL ON dbo.EMPLOYEE01.EMP_ID = dbo.CONTROLLING_LINE_FULL.LEAD_ID RIGHT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS EMPLOYEE01_1 ON dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE = EMPLOYEE01_1.EMP_ID ON 
                      dbo.CONTROLLING_LINE_FULL.EMP_ID = dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[27] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[49] 2[28] 3) )"
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
         Configuration = "(V (3) )"
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
         Configuration = "(H (4[53] 2) )"
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
      ActivePaneConfig = 10
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 36
               Left = 683
               Bottom = 290
               Right = 871
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CONTROLLING_LINE_FULL"
            Begin Extent = 
               Top = 23
               Left = 339
               Bottom = 226
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 25
               Left = 0
               Bottom = 194
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "EMPLOYEE01_1"
            Begin Extent = 
               Top = 250
               Left = 406
               Bottom = 365
               Right = 571
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1185
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_01_CM_HeadCM_Data_A';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_01_CM_HeadCM_Data_A';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_01_CM_HeadCM_Data_A';

