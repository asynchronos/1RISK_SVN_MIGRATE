CREATE VIEW dbo.View_122009
AS
SELECT     TOP (100) PERCENT TM.REFERENCE, TM.REFERRAL_NO, TM.ID, TM.[REG-DATE], TM.[APP-DATE], TM.CIF, TM.CUSTOMER, TM.[EMP-ID], 
                      TM.EMPLOYEE, TM.[BRANCH-ID], TM.[BRANCH-NAME], TM.[REGION-ID], TM.[REGION-NAME], TM.NEW, TM.OLD, TM.REVIEW, TM.EXCEPTION, 
                      TM.APPROVE AS CREDIT_LINE, TM.[O-D], TM.[(O-D)], TM.[F-L], TM.[(F-L)], TM.[L-G], TM.[(L-G)], TM.[STL-PN], TM.[(STL-PN)], TM.[TRADE-FIN], 
                      TM.[(TRADE-FIN)], TM.OTHERS, TM.[(OTHERS)], TM.[SUM-RM_VALUE], TM.[SUM-INCREASE], TM.PROCESS, TM.[APP-TYPE], TM.LEVEL_NAME, 
                      ISNULL(VH.EMPNAME, N'') AS HEAD_NAME, ISNULL(VH.EMPSURNAME, N'') AS HEAD_SURNAME, CASE WHEN VH.LEVEL_ID = '00018' OR
                      VH.LEVEL_ID = '00019' THEN 'Small SME Credit Risk Section 3' WHEN VH.LEVEL_ID = '00027' OR
                      VH.LEVEL_ID = '00028' OR
                      VH.LEVEL_ID = '00029' THEN 'Small SME Credit Risk Section 3' WHEN VH.LEVEL_ID = '00020' OR
                      VH.LEVEL_ID = '00021' OR
                      VH.LEVEL_ID = '00022' OR
                      VH.LEVEL_ID = '00025' OR
                      VH.LEVEL_ID = '00026' THEN 'Small SME Credit Risk Section 4' ELSE TM.LEVEL_NAME END AS SECTION, CASE WHEN VH.LEVEL_ID = '00018' OR
                      VH.LEVEL_ID = '00019' OR
                      VH.LEVEL_ID = '00027' OR
                      VH.LEVEL_ID = '00028' OR
                      VH.LEVEL_ID = '00029' OR
                      VH.LEVEL_ID = '00020' OR
                      VH.LEVEL_ID = '00021' OR
                      VH.LEVEL_ID = '00022' OR
                      VH.LEVEL_ID = '00025' OR
                      VH.LEVEL_ID = '00026' OR
                      VH.LEVEL_ID = '00014' OR
                      VH.LEVEL_ID = '00015' OR
                      VH.LEVEL_ID = '00016' OR
                      VH.LEVEL_ID = '00017' THEN 'SME(S)' ELSE 'SME(L&M) ' END AS SECTION1, TM.BOARD, TM.JOB_TYPE, TM.TTY AS [TTY_SME(S)], 
                      TM.PAT AS [TTY_SME(M)], dbo.CUSTOMER_SME_SIZE.SIZE_DETAIL
FROM         dbo.TEMP_REPORT_PRODUCT_200912 AS TM INNER JOIN
                      dbo.ANNALS_CREDIT ON TM.ID = dbo.ANNALS_CREDIT.ID INNER JOIN
                      dbo.CUSTOMER_SME_SIZE ON dbo.ANNALS_CREDIT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
                      dbo.V_Controlling_LeadsInLevel_HeadOnly AS VH INNER JOIN
                      dbo.Controlling_Level ON VH.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID ON TM.LEVEL_NAME = dbo.Controlling_Level.LEVEL_NAME
WHERE     (MONTH(TM.[APP-DATE]) = 12) AND (YEAR(TM.[APP-DATE]) = 2009) AND (TM.PROCESS_GROUP IN ('C', 'D', 'E'))
ORDER BY TM.ID

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
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Configuration = "(H (2[24] 3) )"
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
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 106
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VH"
            Begin Extent = 
               Top = 6
               Left = 645
               Bottom = 121
               Right = 799
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 66
               Left = 38
               Bottom = 181
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TM"
            Begin Extent = 
               Top = 108
               Left = 455
               Bottom = 223
               Right = 633
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 11', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_122009';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Column = 1440
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_122009';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_122009';

