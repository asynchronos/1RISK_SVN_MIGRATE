CREATE VIEW CA_REPORT.V_004_REGIS_PROCESS
AS
SELECT R03.OLD_ID, R03.PROCESS_ID, R03.PROCESS, R03.PROCESS_DATE, R03.PROCESS_GROUP, R03.LEVEL_ID,CATEGORY_4_8.CATEGORY_DESC AS LEVEL_NAME, 
               R03.EMP_ID
FROM  (SELECT ROW_NUMBER() OVER (PARTITION BY dbo.ANNALS_CREDIT_PROCESS.ID
               ORDER BY dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE) AS SEQ, dbo.ANNALS_CREDIT_PROCESS.ID AS OLD_ID, 
               dbo.ANNALS_CREDIT_PROCESS.EMP_ID, dbo.ANNALS_CREDIT_PROCESS.USER_ID, dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID, 
               dbo.ANNALS_PROCESS.PROCESS, dbo.ANNALS_CREDIT_PROCESS.PROCESS_DATE, dbo.ANNALS_PROCESS.PROCESS_GROUP, 
               dbo.ANNALS_CREDIT_PROCESS.LEVEL_ID
FROM  dbo.ANNALS_CREDIT_PROCESS INNER JOIN
               dbo.ANNALS_PROCESS ON dbo.ANNALS_CREDIT_PROCESS.PROCESS_ID = dbo.ANNALS_PROCESS.PROCESS_ID) AS R03 LEFT OUTER JOIN
                   (SELECT CATEGORY_KEY, CATEGORY_DESC, CATEGORY_DESC_TH, CATEGORY_VALUE, CATEGORY_PRIORITY, 
                                   CATEGORY_DEL_FLAG, CATEGORY_TYPE_KEY, CATEGORY_TYPE_DESC, CATEGORY_TYPE_DESC_TH, CATEGORY_TYPE_VALUE, 
                                   CATEGORY_TYPE_PRIORITY, CATEGORY_TYPE_DEL_FLAG
                    FROM   CLASSIFY.V_002_CATEGORY_MAP_TYPE
                    WHERE (CATEGORY_TYPE_KEY = 4) OR
                                   (CATEGORY_TYPE_KEY = 8) AND (CATEGORY_DEL_FLAG = 0)) AS CATEGORY_4_8 ON 
               R03 .LEVEL_ID = CATEGORY_4_8.CATEGORY_KEY

WHERE (R03.SEQ = 1)

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
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2112
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_004_REGIS_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_004_REGIS_PROCESS';

