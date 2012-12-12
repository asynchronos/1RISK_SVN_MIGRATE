CREATE VIEW dbo.V_039_ACCOUNT_CA_APPROVED_THIS_MONTH
AS
SELECT OLD_ID, CA_NO_ID, CIF, DECB_RD_ID, DECB_RD, CASHTYPE, DECB_RD2, APPROVE_VALUE
FROM  (SELECT dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CA_NO_ID, 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_IDEN, dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_ID, 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_DETAIL_ID, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_ACTION, 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CIF, dbo.REPORT02_ANNALS_CREDIT_SUBJECT.DECB_RD_ID, 
                              REPLACE(dbo.REPORT02_ANNALS_CREDIT_SUBJECT.DECB_RD, 'PN', 'P/N') AS DECB_RD, 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.CASHTYPE, CASE WHEN DECB_RD <> 'O/D' AND DECB_RD <> 'T/L' AND DECB_RD <> 'L/G' AND 
                              DECB_RD <> 'PN' AND DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 'P/N') END AS DECB_RD2, 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.APPROVE_VALUE, 
                              dbo.REPORT06_LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, 
                              dbo.REPORT06_LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE
               FROM   dbo.REPORT02_ANNALS_CREDIT_SUBJECT LEFT OUTER JOIN
                              dbo.ANNALS_SUBJECT_DETAIL ON 
                              dbo.REPORT02_ANNALS_CREDIT_SUBJECT.SUBJECT_DETAIL_ID = dbo.ANNALS_SUBJECT_DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
                              dbo.REPORT06_LAST_PROCESS ON dbo.REPORT02_ANNALS_CREDIT_SUBJECT.OLD_ID = dbo.REPORT06_LAST_PROCESS.OLD_ID) 
               AS R
WHERE (SUBJECT_DETAIL_ID = N'101' OR
               SUBJECT_DETAIL_ID = N'102' OR
               SUBJECT_DETAIL_ID = N'103' OR
               SUBJECT_DETAIL_ID = N'104' OR
               SUBJECT_DETAIL_ID = N'105') AND (LAST_PROCESS_GROUP = 'D') AND (LAST_PROCESS_DATE >= CONVERT(DATETIME, 
               '01' + SUBSTRING(CONVERT(varchar, GETDATE(), 103), 3, LEN(CONVERT(varchar, GETDATE(), 103))), 103))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
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
         Begin Table = "R"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 197
               Right = 272
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 13
         Column = 2808
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
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_039_ACCOUNT_CA_APPROVED_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_039_ACCOUNT_CA_APPROVED_THIS_MONTH';

