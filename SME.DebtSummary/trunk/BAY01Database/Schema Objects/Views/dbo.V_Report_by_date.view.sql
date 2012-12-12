CREATE VIEW dbo.V_Report_by_date
AS
SELECT     TOP (100) PERCENT a.ID,
                          (SELECT     MIN(PROCESS_DATE) AS Expr1
                            FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                            WHERE      (ID = a.ID)) AS [REG-DATE], b.PROCESS_DATE AS [APP-DATE],
                          (SELECT     TOP (1) CIF
                            FROM          dbo.ANNALS_CREDIT_ACCOUNT AS v
                            WHERE      (ID = a.ID)) AS CIF,
                          (SELECT     TOP (1) ISNULL(CUS_TITLE, '') + ISNULL(CUS_FIRST, '') + ' ' + ISNULL(CUS_LAST, '') AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID)) AS CUSTOMER,
                          (SELECT     TOP (1) ISNULL(EMP_ID, '') AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D')) AS [EMP-ID],
                          (SELECT     TOP (1) ISNULL(TITLE_NAME, '') + ISNULL(EMPNAME, '') + ' ' + ISNULL(EMPSURNAME, '') AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D')) AS EMPLOYEE, a.BRANCH_ID AS [BRANCH-ID],
                          (SELECT     MIN(Branch_T) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D')) AS [BRANCH-NAME], a.REGION_ID AS [REGION-ID],
                          (SELECT     MIN(Region_Name) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D')) AS [REGION-NAME], CASE WHEN
                          (SELECT     COUNT(SUBJECT_DETAIL_ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID = '101')) >= 1 THEN 1 ELSE 0 END AS NEW, CASE WHEN
                          (SELECT     COUNT(SUBJECT_DETAIL_ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID = '101')) >= 1 THEN 0 ELSE 1 END AS OLD, CASE WHEN
                          (SELECT     COUNT(ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID = '701')) >= 1 AND
                          (SELECT     COUNT(ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115'))) 
                      = 0 THEN 1 ELSE 0 END AS REVIEW, CASE WHEN
                          (SELECT     COUNT(ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007')) AND 
                                                   (SUBJECT_DETAIL_ID <> '701') OR
                                                   (ID = a.ID) AND (SUBJECT_DETAIL_ID <> '701') AND (SUBJECT_DETAIL_ID NOT IN ('101', '102', '103', '104', '105'))) >= 1 AND
                          (SELECT     COUNT(ID) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (V.PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115'))) 
                      = 0 THEN 1 ELSE 0 END AS EXCEPTION,
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0001')) AS [O-D],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0001')) AS [(O-D)],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0003')) AS [F-L],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0003')) AS [(F-L)],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0007')) AS [L-G],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0007')) AS [(L-G)],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0002')) AS [STL-PN],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0002')) AS [(STL-PN)],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0004')) AS [TRADE-FIN],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0004')) AS [(TRADE-FIN)],
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007')) AND 
                                                   (SUBJECT_DETAIL_ID IN ('101', '102', '103'))) AS OTHERS,
                          (SELECT     ISNULL(SUM(VALUE_APPROVE), 0) AS Expr1
                            FROM          dbo.v_Credit_Account_Process AS v
                            WHERE      (ID = a.ID) AND (PROCESS_GROUP = 'D') AND (DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007')) AND 
                                                   (SUBJECT_DETAIL_ID IN ('104', '105'))) AS [(OTHERS)]
FROM         dbo.ANNALS_CREDIT AS a LEFT OUTER JOIN
                      dbo.ANNALS_CREDIT_PROCESS AS b ON a.ID = b.ID LEFT OUTER JOIN
                      dbo.ANNALS_PROCESS AS c ON b.PROCESS_ID = c.PROCESS_ID
WHERE     (c.PROCESS_GROUP = 'D')
ORDER BY a.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[25] 2[41] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 251
               Bottom = 114
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 447
               Bottom = 114
               Right = 614
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
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 2250
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1440
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
         Column = 40350
         Alias = 1830
         Table = 1170
         Output = 720
         Append = 1400
         NewValue =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_by_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_by_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_by_date';

