CREATE VIEW dbo.REPORT51_48_CANCEL_SME_S
AS
SELECT     CANCEL.MONTH_LAST_PROCESS AS MONTH, CANCEL.CIF, dbo.CUSTOMER_SME01_VIEW.CUSTOMER_NAME, 
                      dbo.CUSTOMER_SME01_VIEW.BUSI_RISK1_DETAIL, CASE NEW_CUS WHEN 'NO' THEN RM_VALUEs ELSE NULL END AS RM_VALUEs_OLD_CUS, 
                      CASE NEW_CUS WHEN 'YES' THEN RM_VALUEs ELSE NULL END AS RM_VALUEs_NEW_CUS, CANCEL.LAST_PROCESS, CASE LEN(ISNULL(Reason, 
                      '')) WHEN 0 THEN LAST_PROCESS ELSE Reason END AS Reason, CANCEL.LAST_PROCESS_DATE, CANCEL.SIZE_DETAIL, CANCEL.EMP_ID, 
                      CANCEL.EMPNAME, CANCEL.LEVEL_ID, CANCEL.LEVEL_NAME, CANCEL.CA_NO_ID, CANCEL.OLD_ID
FROM         dbo.CUSTOMER_SME01_VIEW RIGHT OUTER JOIN
                      dbo.REPORT48_18_CANCEL_SME_REASON AS CANCEL ON dbo.CUSTOMER_SME01_VIEW.CIF = CANCEL.CIF
WHERE     (CANCEL.Customer_Size = N'2')

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
         Begin Table = "CUSTOMER_SME01_VIEW"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 255
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CANCEL"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 254
               Right = 509
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
      Begin ColumnWidths = 16
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3945
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT51_48_CANCEL_SME_S';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT51_48_CANCEL_SME_S';

