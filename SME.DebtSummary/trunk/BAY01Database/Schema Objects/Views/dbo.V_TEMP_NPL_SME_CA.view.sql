CREATE VIEW dbo.V_TEMP_NPL_SME_CA
AS
SELECT     NPL_CA.CIF, NPL_CA.Name, NPL_CA.NameE, NPL_CA.BaySize, NPL_CA.Since, NPL_CA.Status, NPL_CA.Tdr, NPL_CA.Prin, NPL_CA.BizTypeE, 
                      NPL_CA.CM_CODE, NPL_CA.CM_NAME, NPL_CA.CA_NO_ID, NPL_CA.CA_CREATE_DATE, dbo.REPORT39_38_BY_CA.SUBJECT_GROUP, 
                      dbo.REPORT39_38_BY_CA.LAST_PROCESS, dbo.REPORT39_38_BY_CA.EMP_ID, dbo.CM_SECTION.EMP_NAME
FROM         dbo.CM_SECTION RIGHT OUTER JOIN
                      dbo.REPORT39_38_BY_CA ON dbo.CM_SECTION.EMP_ID = dbo.REPORT39_38_BY_CA.EMP_ID RIGHT OUTER JOIN
                          (SELECT     NPL_SME.CIF, NPL_SME.Name, NPL_SME.NameE, NPL_SME.BaySize, NPL_SME.Since, NPL_SME.Status, NPL_SME.Tdr, 
                                                   NPL_SME.Prin, NPL_SME.BizTypeE, NPL_SME.CM_CODE, NPL_SME.CM_NAME, REP_07.CA_NO_ID, REP_07.CA_CREATE_DATE
                            FROM          (SELECT     NPL.CIF, NPL.Name, NPL.NameE, NPL.BaySize, NPL.Since, NPL.Status, NPL.Tdr, NPL.Prin, NPL.BizTypeE, SME.CM_CODE, 
                                                                           SME.CM_NAME
                                                    FROM          dbo.TEMP_NPL AS NPL LEFT OUTER JOIN
                                                                           dbo.CUSTOMER_SME01_VIEW AS SME ON NPL.CIF = SME.CIF) AS NPL_SME LEFT OUTER JOIN
                                                   dbo.REPORT07_SUMMARY AS REP_07 ON NPL_SME.CIF = REP_07.CIF
                            GROUP BY NPL_SME.CIF, NPL_SME.Name, NPL_SME.NameE, NPL_SME.BaySize, NPL_SME.Since, NPL_SME.Status, NPL_SME.Tdr, 
                                                   NPL_SME.Prin, NPL_SME.BizTypeE, NPL_SME.CM_CODE, NPL_SME.CM_NAME, REP_07.CA_NO_ID, REP_07.CA_CREATE_DATE) 
                      AS NPL_CA ON dbo.REPORT39_38_BY_CA.CA_NO_ID = NPL_CA.CA_NO_ID

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
         Begin Table = "NPL_CA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 257
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REPORT39_38_BY_CA"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 254
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "CM_SECTION"
            Begin Extent = 
               Top = 6
               Left = 467
               Bottom = 239
               Right = 651
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
      Begin ColumnWidths = 18
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
         Width = 2055
         Width = 1500
         Width = 1845
         Width = 1500
         Width = 1935
         Width = 2415
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_NPL_SME_CA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_TEMP_NPL_SME_CA';

