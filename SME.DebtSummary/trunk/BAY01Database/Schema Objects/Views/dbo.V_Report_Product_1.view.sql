
CREATE VIEW [dbo].[V_Report_Product_1]
AS
WITH cte AS (SELECT * FROM  dbo.v_Credit_Account_Process)
    SELECT     TOP (100) PERCENT ID,
                                (SELECT     MIN(PROCESS_DATE) AS Expr1
                                  FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                  WHERE      (ID = A.ID)) AS [REG-DATE],
                                (SELECT     MAX(PROCESS_DATE) AS Expr1
                                  FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                  WHERE      (ID = A.ID)) AS [APP-DATE],
                                (SELECT     TOP (1) CIF
                                  FROM          dbo.ANNALS_CREDIT_ACCOUNT AS v
                                  WHERE      (ID = A.ID) order by iden asc) AS CIF,
                                (SELECT     TOP (1) ISNULL(CUS_TITLE, '') + ISNULL(CUS_FIRST, '') + ' ' + ISNULL(CUS_LAST, '') AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) order by iden asc) AS CUSTOMER,
                                (SELECT     TOP (1) ISNULL(EMP_ID, '') AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS
                                                               WHERE      (ID = A.ID)))) AS [EMP-ID],
                                (SELECT     TOP (1) ISNULL(TITLE_NAME, '') + ISNULL(EMPNAME, '') + ' ' + ISNULL(EMPSURNAME, '') AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_1
                                                               WHERE      (ID = A.ID)))) AS EMPLOYEE, BRANCH_ID AS [BRANCH-ID],
                                (SELECT     MIN(Branch_T) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID)) AS [BRANCH-NAME], REGION_ID AS [REGION-ID],
                                (SELECT     MIN(Region_Name) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID)) AS [REGION-NAME], CASE WHEN
                                (SELECT     COUNT(SUBJECT_DETAIL_ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID = '101')) >= 1 THEN 1 ELSE 0 END AS NEW, CASE WHEN
                                (SELECT     COUNT(SUBJECT_DETAIL_ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID = '101')) >= 1 THEN 0 ELSE 1 END AS OLD, CASE WHEN
                                (SELECT     COUNT(ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID = '701')) >= 1 AND
                                (SELECT     COUNT(ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115'))) = 0 THEN 1 ELSE 0 END AS REVIEW, 
                            CASE WHEN
                                (SELECT     COUNT(ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID NOT IN ('101', '102', '103', '104', '105', '701'))) >= 1 AND
                                (SELECT     COUNT(ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115', '701'))) = 0 THEN 1 ELSE 0 END AS EXCEPTION, 
                            CASE WHEN
                                (SELECT     COUNT(ID) AS Expr1
                                  FROM          CTE AS v
                                  WHERE      (ID = a.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '104', '105', '114', '115'))) > 0 THEN 1 ELSE 0 END AS APPROVE,
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0001') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_13
                                                               WHERE      (ID = A.ID)))) AS [O-D],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0001') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_12
                                                               WHERE      (ID = A.ID)))) AS [(O-D)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0003') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_11
                                                               WHERE      (ID = A.ID)))) AS [F-L],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0003') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_10
                                                               WHERE      (ID = A.ID)))) AS [(F-L)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0007') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_9
                                                               WHERE      (ID = A.ID)))) AS [L-G],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0007') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_8
                                                               WHERE      (ID = A.ID)))) AS [(L-G)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0002') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_7
                                                               WHERE      (ID = A.ID)))) AS [STL-PN],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0002') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_6
                                                               WHERE      (ID = A.ID)))) AS [(STL-PN)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (DECB_RD_ID = '0004') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_5
                                                               WHERE      (ID = A.ID)))) AS [TRADE-FIN],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (DECB_RD_ID = '0004') AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_4
                                                               WHERE      (ID = A.ID)))) AS [(TRADE-FIN)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007')) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND 
                                                         (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_3
                                                               WHERE      (ID = A.ID)))) AS OTHERS,
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (DECB_RD_ID NOT IN ('0001', '0002', '0003', '0004', '0007')) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND 
                                                         (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS [(OTHERS)],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_3
                                                               WHERE      (ID = A.ID)))) AS [SUM-INCREASE],
                                (SELECT     0 - ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS [SUM-DECREASE],
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('101', '102', '103')) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_3
                                                               WHERE      (ID = A.ID)))) -
                                (SELECT     ISNULL(SUM(CASE WHEN Process_Group = 'D' THEN VALUE_APPROVE ELSE Value_Customer END), 0) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (SUBJECT_DETAIL_ID IN ('104', '105')) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS NET,
                                (SELECT     MAX(PEOCESS_HEAD) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS PROCESS_HEAD,
								(SELECT     MAX(PROCESS_GROUP) AS Expr1
                                  FROM          cte AS v
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS PROCESS_GROUP,
                                (SELECT     MAX(PROCESS) AS Expr1
                                  FROM          cte AS cte_2
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS PROCESS, 
				
                                 dbo.FindWorkingTime((SELECT MIN(PROCESS_DATE) FROM dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID)),
                                                             (SELECT     MAX(PROCESS_DATE)
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID)))/86400.0 AS TTY, 
							CASE 
                             WHEN
                                (SELECT     COUNT(PROCESS_DATE)
                                  FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                  WHERE      (ID = A.ID AND Process_id = 'B070')) >= 1 
                             THEN
                               dbo.FindWorkingTime(
                                                             (SELECT     MIN(PROCESS_DATE)
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID)),
                                                             (SELECT     MAX(PROCESS_DATE)
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID AND Process_id = 'B070'))) /86400.0                             ELSE
                               dbo.FindWorkingTime(
                                                             (SELECT     MIN(PROCESS_DATE)
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID)),
                                                             (SELECT     MAX(PROCESS_DATE)
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS v
                                                               WHERE      (ID = A.ID)))/86400.0  END
                            AS PAT, 
							CASE WHEN Send_To_Board = 'True' OR
                            Send_To_Board = '1' THEN 'สินเชื่อในอำนาจคณะกรรมการ กสช.' ELSE 'สินเชื่อในอำนาจบุคคล' END AS [APP-TYPE],
                                (SELECT     TOP (1) LEVEL_NAME AS Expr1
                                  FROM          cte AS cte_2
                                  WHERE      (ID = A.ID) AND (PROCESS_DATE =
                                                             (SELECT     MAX(PROCESS_DATE) AS Expr1
                                                               FROM          dbo.ANNALS_CREDIT_PROCESS AS ANNALS_CREDIT_PROCESS_2
                                                               WHERE      (ID = A.ID)))) AS LEVEL_NAME
     FROM         dbo.ANNALS_CREDIT AS A
     WHERE     (ID  IN
                                (SELECT  ID
                                  FROM   cte AS cte_1))
     ORDER BY ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[18] 2[45] 3) )"
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
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 226
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_Product_1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Report_Product_1';

