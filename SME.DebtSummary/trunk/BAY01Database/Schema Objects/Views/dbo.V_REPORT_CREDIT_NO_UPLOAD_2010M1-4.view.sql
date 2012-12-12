CREATE VIEW dbo.[V_REPORT_CREDIT_NO_UPLOAD_2010M1-4]
AS
SELECT     TOP (100) PERCENT ID, CIF, CUSTOMER, EMPLOYEE, APPTYPE, PROCESS, APPDATE, FILE1, FILE14, WAITING
FROM         (SELECT     T.ID, T.CIF, T.CUSTOMER, T.EMPLOYEE, T.[APP-TYPE] AS APPTYPE, T.PROCESS, T.[APP-DATE] AS APPDATE,
                                                  (SELECT     TOP (1) ID
                                                    FROM          dbo.UPLOAD_FILE AS F
                                                    WHERE      (FILE_TYPE = 1) AND (ANNALS_ID = T.ID)) AS FILE1,
                                                  (SELECT     TOP (1) ID
                                                    FROM          dbo.UPLOAD_FILE AS F
                                                    WHERE      (FILE_TYPE = 14) AND (ANNALS_ID = T.ID)) AS FILE14, A.WAITING
                       FROM          dbo.TEMP_REPORT_PRODUCT AS T LEFT OUTER JOIN
                                              dbo.ANNALS_STATUS AS A ON T.ID = A.ID
                       WHERE      (T.[APP-DATE] BETWEEN CONVERT(datetime, '01/01/2010', 103) AND CONVERT(datetime, '01/05/2010', 103))) AS Q
WHERE     (APPTYPE = 'สินเชื่อในอำนาจคณะกรรมการ กสช.') AND (FILE1 IS NULL) AND (FILE14 IS NULL)
ORDER BY APPDATE

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
         Begin Table = "Q"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 209
               Right = 269
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_NO_UPLOAD_2010M1-4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_REPORT_CREDIT_NO_UPLOAD_2010M1-4';

