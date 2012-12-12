CREATE VIEW CA_REPORT.V_017_LAST_APPROVED_CA
AS
SELECT LEADER1_CA_OLD_ID, CIF, SIZE_ID, SIZE_DETAIL, SUBJECT_GROUP, SUM_REQUEST_VALUE_PLUS, SUM_REQUEST_VALUE_MINUS, 
               SUM_APPROVE_VALUE_PLUS, SUM_APPROVE_VALUE_MINUS, LAST_PROCESS_GROUP, LAST_PROCESS_DATE,LAST_PROCESS_EMP_ID,LAST_PROCESS_LEVEL_NAME, ID_OUT, ID_OUT_CREATED_DATE,CM_IN_CA
FROM (SELECT ROW_NUMBER() OVER (PARTITION BY CIF
               ORDER BY LAST_PROCESS_DATE DESC) AS SEQ, OLD_ID AS LEADER1_CA_OLD_ID, CIF, SIZE_ID, SIZE_DETAIL, MIN(SUBJECT_GROUP) 
               AS SUBJECT_GROUP, SUM(REQUEST_VALUE_PLUS) AS SUM_REQUEST_VALUE_PLUS, SUM(REQUEST_VALUE_MINUS) 
               AS SUM_REQUEST_VALUE_MINUS, SUM(APPROVE_VALUE_PLUS) AS SUM_APPROVE_VALUE_PLUS, SUM(APPROVE_VALUE_MINUS) 
               AS SUM_APPROVE_VALUE_MINUS, LAST_PROCESS_GROUP, LAST_PROCESS_DATE,LAST_PROCESS_EMP_ID,LAST_PROCESS_LEVEL_NAME, ID_OUT, ID_OUT_CREATED_DATE,EMP_CONTROL AS CM_IN_CA
FROM  (SELECT V02.OLD_ID, V02.CA_NO_ID, V02.SIZE_ID, V02.SIZE_DETAIL, V02.SUBJECT_IDEN, DETAIL.SUBJECT_ID, V02.SUBJECT_DETAIL_ID, 
               V02.SUBJECT_GROUP, V02.SUBJECT_ACTION, V02.CIF, V02.DECB_RD_ID, CONVERT(nvarchar(50), REPLACE(V02.DECB_RD, 'PN', 'P/N')) 
               AS DECB_RD, V02.CASHTYPE, CASE WHEN DECB_RD <> 'O/D' AND DECB_RD <> 'T/L' AND DECB_RD <> 'L/G' AND DECB_RD <> 'PN' AND 
               DECB_RD <> 'TRADE FIN.' THEN 'OTHER' ELSE REPLACE(DECB_RD, 'PN', 'P/N') END AS DECB_RD2, 
               CASE WHEN V02.RM_VALUE >= 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_PLUS, 
               CASE WHEN V02.RM_VALUE < 0 THEN V02.RM_VALUE ELSE NULL END AS REQUEST_VALUE_MINUS, 
               CASE WHEN V02.APPROVE_VALUE >= 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_PLUS, 
               CASE WHEN V02.APPROVE_VALUE < 0 THEN V02.APPROVE_VALUE ELSE NULL END AS APPROVE_VALUE_MINUS, 
               LAST_PROCESS.PROCESS_GROUP AS LAST_PROCESS_GROUP, LAST_PROCESS.PROCESS_DATE AS LAST_PROCESS_DATE, 
               LAST_PROCESS.EMP_ID AS LAST_PROCESS_EMP_ID, LAST_PROCESS.LEVEL_ID AS LAST_PROCESS_LEVEL_ID, 
               LAST_PROCESS.LEVEL_NAME AS LAST_PROCESS_LEVEL_NAME, V02.ID_OUT, A.ANNALS_CREATE_DATE AS ID_OUT_CREATED_DATE, 
               V02.EMP_CONTROL
FROM  CA_REPORT.V_002_ANNALS_CREDIT_SUBJECT AS V02 LEFT OUTER JOIN
               dbo.ANNALS AS A ON SUBSTRING(V02.ID_OUT, 1, 1) = A.ANNALS_TYPE AND SUBSTRING(V02.ID_OUT, 2, 5) = A.ANNALS_SEQ_NO AND 
               CONVERT(nvarchar(4), CONVERT(int, SUBSTRING(V02.ID_OUT, 8, 4)) - 543) = A.ANNALS_YEAR LEFT OUTER JOIN
               dbo.ANNALS_SUBJECT_DETAIL AS DETAIL ON V02.SUBJECT_DETAIL_ID = DETAIL.SUBJECT_DETAIL_ID LEFT OUTER JOIN
               CA_REPORT.V_005_LAST_PROCESS AS LAST_PROCESS ON V02.OLD_ID = LAST_PROCESS.OLD_ID
WHERE (LAST_PROCESS.PROCESS_GROUP = 'D') AND (V02.CIF <> 0)) AS T
GROUP BY OLD_ID, CIF, SIZE_ID, SIZE_DETAIL, LAST_PROCESS_GROUP, LAST_PROCESS_DATE, ID_OUT, ID_OUT_CREATED_DATE,EMP_CONTROL,LAST_PROCESS_EMP_ID,LAST_PROCESS_LEVEL_NAME) AS T2
WHERE SEQ = 1

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[37] 2[20] 3) )"
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1848
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1548
         Width = 2364
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
End', @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_017_LAST_APPROVED_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'CA_REPORT', @level1type = N'VIEW', @level1name = N'V_017_LAST_APPROVED_CA';

