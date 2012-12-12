CREATE VIEW dbo.REPORT56_38_APPROVE_THIS_MONTH
AS
SELECT     SME.CIF, SME.CUSTOMER_NAME, SME.GROUP_ID, SME.CM_CODE, SME.CM_NAME, SME.OLD_CM_CODE, SME.OLD_CM_NAME, SME.BRANCH_ID, 
                      SME.BRANCH_NAME, SME.Id_Region, SME.Region_Name, SME.GROUP_SIZE_ID, SME.GROUP_SIZE_DETAIL, SME.JUDGEMENT_ID, 
                      SME.JUDGEMENT_DETAIL, SME.BUSI_RISK1_ID, SME.BUSI_RISK1_DETAIL, SME.BUSI_RISK2_ID, SME.BUSI_RISK2_DETAIL, SME.BUSI_RISK3_ID, 
                      SME.BUSI_RISK3_DETAIL, SME.UPDATE_BY, SME.UPDATE_BY_NAME, SME.UPDATE_DATE, SME.BUSI_TYPE_CIM, SME.DEPTFLAG, 
                      SME.DEPTTRAN, SME.CONTROLLING_UNIT, SME.REGION_CONTROLLING_UNIT, SME.BUSINESS_DESTINATION_ID, 
                      SME.BUSINESS_DESTINATION_DESC, SME.STATUS_ID, SME.EXPORT_WEIGHT, SME.LOCAL_WEIGHT, CA.CA_NO_ID, CA.CA_CREATE_DATE, 
                      CA.APPROVE_DATE, CASE WHEN ((DATEPART(YEAR, APPROVE_DATE) = DATEPART(YEAR, GETDATE())) AND (DATEPART(MONTH, APPROVE_DATE) 
                      = DATEPART(MONTH, GETDATE()))) THEN 'Yes' ELSE 'No' END AS APPROVE_THIS_MONTH, CA.LEVEL_NAME
FROM         dbo.CUSTOMER_SME_LAST_CA AS CA INNER JOIN
                      dbo.CUSTOMER_SME01_VIEW AS SME ON CA.CIF = SME.CIF
WHERE     (CA.LAST_PROCESS_GROUP = 'D')

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
         Begin Table = "CA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "SME"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 114
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 24
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1665
         Width = 2280
         Width = 2340
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2790
         Alias = 1920
         Table = 1170
         Output = 720
         Append = 1400
         NewValue', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT56_38_APPROVE_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT56_38_APPROVE_THIS_MONTH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT56_38_APPROVE_THIS_MONTH';

