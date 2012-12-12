CREATE VIEW dbo.V_TEMP_SM_SME_CA
AS
SELECT     SM_CA.CIF, SM_CA.Name, SM_CA.NameE, SM_CA.CM_CODE, SM_CA.CM_NAME, SM_CA.CA_NO_ID, SM_CA.CA_CREATE_DATE, 
                      dbo.REPORT39_38_BY_CA.SUBJECT_GROUP, dbo.REPORT39_38_BY_CA.LAST_PROCESS, dbo.REPORT39_38_BY_CA.EMP_ID, 
                      dbo.CM_SECTION.EMP_NAME
FROM         (SELECT     SM_SME.CIF, SM_SME.Name, SM_SME.NameE, SM_SME.CM_CODE, SM_SME.CM_NAME, REP_07.CA_NO_ID, 
                                              REP_07.CA_CREATE_DATE
                       FROM          (SELECT     dbo.TEMP_SM.CIF, dbo.TEMP_SM.Name, dbo.TEMP_SM.NameE, SME.CM_CODE, SME.CM_NAME
                                               FROM          dbo.CUSTOMER_SME01_VIEW AS SME RIGHT OUTER JOIN
                                                                      dbo.TEMP_SM ON SME.CIF = dbo.TEMP_SM.CIF) AS SM_SME LEFT OUTER JOIN
                                              dbo.REPORT07_SUMMARY AS REP_07 ON SM_SME.CIF = REP_07.CIF
                       GROUP BY SM_SME.CIF, SM_SME.Name, SM_SME.NameE, SM_SME.CM_CODE, SM_SME.CM_NAME, REP_07.CA_NO_ID, 
                                              REP_07.CA_CREATE_DATE) AS SM_CA LEFT OUTER JOIN
                      dbo.REPORT39_38_BY_CA ON SM_CA.CA_NO_ID = dbo.REPORT39_38_BY_CA.CA_NO_ID LEFT OUTER JOIN
                      dbo.CM_SECTION ON dbo.REPORT39_38_BY_CA.EMP_ID = dbo.CM_SECTION.EMP_ID

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
         Begin Table = "CM_SECTION"
            Begin Extent = 
               Top = 6
               Left = 492
               Bottom = 254
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT39_38_BY_CA"
            Begin Extent = 
               Top = 8
               Left = 265
               Bottom = 254
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "SM_CA"
            Begin Extent = 
               Top = 13
               Left = 63
               Bottom = 203
               Right = 235
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 3750
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_SM_SME_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_SM_SME_CA';

