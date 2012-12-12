CREATE VIEW dbo.REPORT_TEMP102_100_VINTAGE_LEADER
AS
SELECT     dbo.TEMP_Vintage_200906.CIF, dbo.CUSTOMER.OFFICR_ID, dbo.GetName(dbo.EMPLOYEE01.TITLE_NAME, dbo.EMPLOYEE01.EMPNAME, 
                      dbo.EMPLOYEE01.EMPSURNAME) AS OFFICR_NAME, dbo.CA_FROM_LEADER_SME_BY_CIF.CA_ID, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.CA_CREATE_DATE, dbo.CA_FROM_LEADER_SME_BY_CIF.SUBJECT_DETAIL, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.DETAIL, dbo.CA_FROM_LEADER_SME_BY_CIF.FROM_BR, dbo.CA_FROM_LEADER_SME_BY_CIF.Branch_T, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.Province, dbo.CA_FROM_LEADER_SME_BY_CIF.FROM_REGION, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.Region_Name, dbo.CA_FROM_LEADER_SME_BY_CIF.LEAD_ID, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.LEAD_NAME, dbo.CA_FROM_LEADER_SME_BY_CIF.PROCESS_ID, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.PROCESS, dbo.CA_FROM_LEADER_SME_BY_CIF.PROCESS_DATE, 
                      dbo.CA_FROM_LEADER_SME_BY_CIF.PROCESS_EMP_ID, dbo.CA_FROM_LEADER_SME_BY_CIF.PROCESS_EMP_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.STATUS_DETAIL, dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_DETAIL, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.BUSI_RISK1_DETAIL, dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CM_NAME
FROM         dbo.TEMP_Vintage_200906 INNER JOIN
                      dbo.CUSTOMER ON dbo.TEMP_Vintage_200906.CIF = dbo.CUSTOMER.CIF INNER JOIN
                      dbo.EMPLOYEE01 ON dbo.CUSTOMER.OFFICR_ID = dbo.EMPLOYEE01.EMP_ID INNER JOIN
                      dbo.CA_FROM_LEADER_SME_BY_CIF ON dbo.TEMP_Vintage_200906.CIF = dbo.CA_FROM_LEADER_SME_BY_CIF.CIF LEFT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS ON dbo.TEMP_Vintage_200906.CIF = dbo.CUSTOMER_SME00_ALL_STATUS.CIF

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
         Left = -34
      End
      Begin Tables = 
         Begin Table = "TEMP_Vintage_200906"
            Begin Extent = 
               Top = 8
               Left = 483
               Bottom = 242
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 9
               Left = 314
               Bottom = 242
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 29
         End
         Begin Table = "EMPLOYEE01"
            Begin Extent = 
               Top = 10
               Left = 120
               Bottom = 243
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 237
               Left = 219
               Bottom = 471
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CA_FROM_LEADER_SME_BY_CIF"
            Begin Extent = 
               Top = 7
               Left = 665
               Bottom = 239
               Right = 852
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
      Begin ColumnWidths = 48
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
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP102_100_VINTAGE_LEADER';


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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP102_100_VINTAGE_LEADER';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP102_100_VINTAGE_LEADER';

