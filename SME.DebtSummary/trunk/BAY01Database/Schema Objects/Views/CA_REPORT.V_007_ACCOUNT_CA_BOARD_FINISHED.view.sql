CREATE VIEW [CA_REPORT].[V_007_ACCOUNT_CA_BOARD_FINISHED]
AS
SELECT V02.OLD_ID, V02.CA_NO_ID, V02.SUBJECT_IDEN, DETAIL.SUBJECT_ID, V02.SUBJECT_DETAIL_ID, V02.SUBJECT_ACTION, V02.CIF, 
               V02.DECB_RD_ID, CONVERT(nvarchar(50), REPLACE(V02.DECB_RD, 'PN', 'P/N')) AS DECB_RD, V02.CASHTYPE, CASE WHEN DECB_RD <> 'O/D' AND 
               DECB_RD <> 'T/L' AND DECB_RD <> 'L/G' AND DECB_RD <> 'PN' AND DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 'P/N') 
               END AS DECB_RD2, CASE WHEN V02.RM_VALUE >= 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_PLUS, 
               CASE WHEN V02.RM_VALUE < 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_MINUS, 
               CASE WHEN V02.APPROVE_VALUE >= 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_PLUS, 
               CASE WHEN V02.APPROVE_VALUE < 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_MINUS, 
               LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE, V02.ID_OUT, 
               A.ANNALS_CREATE_DATE AS ID_OUT_CREATED_DATE
FROM  CA_REPORT.V_002_ANNALS_CREDIT_SUBJECT AS V02 LEFT OUTER JOIN
               dbo.ANNALS AS A ON SUBSTRING(V02.ID_OUT, 1, 1) = A.ANNALS_TYPE AND SUBSTRING(V02.ID_OUT, 2, 5) = A.ANNALS_SEQ_NO AND 
               CONVERT(nvarchar(4), CONVERT(int, SUBSTRING(V02.ID_OUT, 8, 4)) - 543) = A.ANNALS_YEAR LEFT OUTER JOIN
               dbo.ANNALS_SUBJECT_DETAIL AS DETAIL ON V02.SUBJECT_DETAIL_ID = DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
               CA_REPORT.V_005_LAST_PROCESS AS LAST_PROCESS ON V02.OLD_ID = LAST_PROCESS.OLD_ID
WHERE (LAST_PROCESS.PROCESS_GROUP IN ('C', 'D', 'E')) AND (V02.Send_To_Board = N'1')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
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
         Begin Table = "V02"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 143
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 45
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 8
               Left = 845
               Bottom = 144
               Right = 1067
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "DETAIL"
            Begin Extent = 
               Top = 7
               Left = 326
               Bottom = 143
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LAST_PROCESS"
            Begin Extent = 
               Top = 7
               Left = 588
               Bottom = 143
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
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
         Width = 1200
         Width = 1500
         Width = 1500
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 2172
         Width = 1968
         Width = 1512
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_007_ACCOUNT_CA_BOARD_FINISHED';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Column = 2208
         Alias = 2280
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_007_ACCOUNT_CA_BOARD_FINISHED';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_007_ACCOUNT_CA_BOARD_FINISHED';

