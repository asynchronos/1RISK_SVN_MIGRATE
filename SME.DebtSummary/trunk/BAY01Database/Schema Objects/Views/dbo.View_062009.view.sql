CREATE VIEW dbo.View_062009
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
FROM         dbo.Temp_Report_Product072009 AS TM INNER JOIN
                      dbo.ANNALS_CREDIT ON TM.ID = dbo.ANNALS_CREDIT.ID INNER JOIN
                      dbo.CUSTOMER_SME_SIZE ON dbo.ANNALS_CREDIT.Customer_Size = dbo.CUSTOMER_SME_SIZE.SIZE_ID LEFT OUTER JOIN
                      dbo.V_Controlling_LeadsInLevel_HeadOnly AS VH INNER JOIN
                      dbo.Controlling_Level ON VH.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID ON TM.LEVEL_NAME = dbo.Controlling_Level.LEVEL_NAME
WHERE     (MONTH(TM.[APP-DATE]) = 06) AND (YEAR(TM.[APP-DATE]) = 2009) AND (TM.PROCESS_GROUP IN ('C', 'D', 'E'))
ORDER BY TM.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[18] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[47] 2[30] 3) )"
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
         Configuration = "(H (2[25] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[66] 3) )"
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
         Configuration = "(H (1[88] 4) )"
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
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = -288
      End
      Begin Tables = 
         Begin Table = "TM"
            Begin Extent = 
               Top = 6
               Left = 420
               Bottom = 590
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ANNALS_CREDIT"
            Begin Extent = 
               Top = 6
               Left = 628
               Bottom = 539
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "CUSTOMER_SME_SIZE"
            Begin Extent = 
               Top = 5
               Left = 846
               Bottom = 105
               Right = 998
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VH"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 322
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 6
               Left = 230
               Bottom = 315
               Right = 382
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
      Begin ColumnWidths = 46
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3300
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_062009';


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
         Width = 2490
         Width = 3660
         Width = 4590
         Width = 2235
         Width = 2970
         Width = 1500
         Width = 1500
         Width = 2355
         Width = 1590
         Width = 3615
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2850
         Alias = 1830
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_062009';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_062009';

