CREATE VIEW dbo.REPORT_TEMP101_100_VINTAGE
AS
SELECT     V.CIF, CONVERT(varchar, CA.OFFICR_ID) + ':' + CA.OFFICER_NAME AS OFFICE_NAME, V.NM, V.NameEng, V.BaySize, V.Since, V.status, V.Tdr, V.Prin, 
                      V.MDiff5203, V.BizTypeE, CA.CA_NO_ID, CA.CA_CREATE_DATE, CA.REFERENCE, CA.REFERENCE_DATE, CA.SUBJECT_GROUP, CA.LAST_PROCESS, 
                      CA.LAST_PROCESS_DATE, CA.EMP_ID + ':' + CA.EMPNAME AS LAST_PROCESS_BY, CA.LEVEL_NAME, CA.APPROVE_DATE, 
                      CA.Reason AS APPROVE_REASON, CA.REJECT_DATE, CA.REJECT_REASON, CA.Authority, CASE WHEN LEN(CA.EMP_APPROVE_ID) 
                      > 0 THEN CA.EMP_APPROVE_ID + ':' + CA.EMP_APPROVE1_NAME END AS EMP_APPROVE1, CASE WHEN LEN(CA.EMP_APPROVE2_ID) 
                      > 0 THEN CA.EMP_APPROVE2_ID + ':' + CA.EMP_APPROVE2_NAME END AS EMP_APPROVE2_NAME, CASE WHEN LEN(CA.EMP_REQUEST_ID) 
                      > 0 THEN CA.EMP_REQUEST_ID + ':' + CA.EMP_REQUEST_NAME END AS EMP_REQUEST_NAME, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.STATUS_DETAIL, dbo.CUSTOMER_SME00_ALL_STATUS.SIZE_DETAIL, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.GROUP_SIZE_DETAIL, dbo.CUSTOMER_SME00_ALL_STATUS.BUSI_RISK1_DETAIL, 
                      dbo.CUSTOMER_SME00_ALL_STATUS.CM_CODE, dbo.CUSTOMER_SME00_ALL_STATUS.CM_NAME
FROM         dbo.CUSTOMER_SME00_ALL_STATUS RIGHT OUTER JOIN
                      dbo.TEMP_Vintage_200906 AS V ON dbo.CUSTOMER_SME00_ALL_STATUS.CIF = V.CIF LEFT OUTER JOIN
                      dbo.REPORT_TEMP100_07_GROUP_CA AS CA ON V.CIF = CA.CIF

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
         Begin Table = "V"
            Begin Extent = 
               Top = 7
               Left = 265
               Bottom = 253
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CA"
            Begin Extent = 
               Top = 5
               Left = 31
               Bottom = 253
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "CUSTOMER_SME00_ALL_STATUS"
            Begin Extent = 
               Top = 6
               Left = 513
               Bottom = 253
               Right = 748
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
      Begin ColumnWidths = 35
         Width = 284
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
         Width = 2040
         Width = 1500
         Width = 1710
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2775
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
   Begin CriteriaPane =', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP101_100_VINTAGE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Begin ColumnWidths = 11
         Column = 8400
         Alias = 1920
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP101_100_VINTAGE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT_TEMP101_100_VINTAGE';

