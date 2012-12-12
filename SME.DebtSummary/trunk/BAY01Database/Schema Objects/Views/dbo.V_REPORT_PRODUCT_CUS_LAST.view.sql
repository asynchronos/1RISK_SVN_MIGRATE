CREATE VIEW dbo.V_REPORT_PRODUCT_CUS_LAST
AS
SELECT     TOP (100) PERCENT A.ID, A.[APP-DATE], A.[REG-DATE], A.CIF, A.Project_Name, A.ACCNO, A.Value_Customer, A.VALUE_OLD, A.VALUE, 
                      A.VALUE_APPROVE, A.Others, A.SUBJECT_DETAIL_ID, A.SUBJECT_DETAIL, A.DECB_RD, A.DECB_RD_ID, A.PRODUCT_CODE, A.PROJECT_CODE, 
                      A.PROPOSAL_ID, A.PROPOSAL_NAME, A.CUSTOMER_NAME, A.GROUP_ID, A.CM_CODE, A.CM_NAME, A.BRANCH_ID, A.BRANCH_NAME, A.Id_Region, 
                      A.Region_Name, A.GROUP_SIZE_ID, A.GROUP_SIZE_DETAIL, A.JUDGEMENT_ID, A.JUDGEMENT_DETAIL, A.SIZE_ID, A.SIZE_DETAIL, 
                      A.PROCESS_GROUP, A.[EMP-ID], A.EMPLOYEE, A.[REGION-ID], A.REVIEW, A.EXCEPTION, A.APPROVE, A.EMP_APPROVE, A.EMP_APPROVE2, 
                      A.EMP_REQUEST, A.LEVEL_NAME, A.PROCESS_HEAD, A.REASON_REMARK, A.RESULT_REMARK, A.Send_To_Board, A.Authority, Q.APP_DATE
FROM         dbo.TEMP_REPORT_PRODUCT_CUS AS A INNER JOIN
                          (SELECT     MAX([APP-DATE]) AS APP_DATE, CIF
                            FROM          dbo.TEMP_REPORT_PRODUCT_CUS AS B
                            GROUP BY CIF) AS Q ON A.[APP-DATE] = Q.APP_DATE AND A.CIF = Q.CIF
ORDER BY A.CIF

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[50] 2[6] 3) )"
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
               Bottom = 121
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Q"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 91
               Right = 413
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1905
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_CUS_LAST';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_PRODUCT_CUS_LAST';

