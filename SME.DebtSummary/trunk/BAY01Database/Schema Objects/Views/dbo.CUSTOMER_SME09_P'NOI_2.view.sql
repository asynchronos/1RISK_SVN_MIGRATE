CREATE VIEW dbo.[CUSTOMER_SME09_P'NOI_2]
AS
SELECT     dbo.[CUSTOMER_SME09_P'NOI].CIF, dbo.[CUSTOMER_SME09_P'NOI].CUSTOMER_NAME, dbo.[CUSTOMER_SME09_P'NOI].GROUP_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].CM_CODE, dbo.[CUSTOMER_SME09_P'NOI].CM_NAME, dbo.[CUSTOMER_SME09_P'NOI].OLD_CM_CODE, 
                      dbo.[CUSTOMER_SME09_P'NOI].OLD_CM_NAME, dbo.[CUSTOMER_SME09_P'NOI].BRANCH_ID, dbo.[CUSTOMER_SME09_P'NOI].BRANCH_NAME, 
                      dbo.[CUSTOMER_SME09_P'NOI].Id_Region, dbo.[CUSTOMER_SME09_P'NOI].Region_Name, dbo.[CUSTOMER_SME09_P'NOI].GROUP_SIZE_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].GROUP_SIZE_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].JUDGEMENT_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].JUDGEMENT_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK1_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK1_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK2_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK2_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK3_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].BUSI_RISK3_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].UPDATE_BY, 
                      dbo.[CUSTOMER_SME09_P'NOI].UPDATE_BY_NAME, dbo.[CUSTOMER_SME09_P'NOI].UPDATE_DATE, 
                      dbo.[CUSTOMER_SME09_P'NOI].BUSI_TYPE_CIM, dbo.[CUSTOMER_SME09_P'NOI].DEPTFLAG, dbo.[CUSTOMER_SME09_P'NOI].DEPTTRAN, 
                      dbo.[CUSTOMER_SME09_P'NOI].CONTROLLING_UNIT, dbo.[CUSTOMER_SME09_P'NOI].REGION_CONTROLLING_UNIT, 
                      dbo.[CUSTOMER_SME09_P'NOI].BUSINESS_DESTINATION_ID, dbo.[CUSTOMER_SME09_P'NOI].BUSINESS_DESTINATION_DESC, 
                      dbo.[CUSTOMER_SME09_P'NOI].EXPORT_WEIGHT, dbo.[CUSTOMER_SME09_P'NOI].LOCAL_WEIGHT, dbo.[CUSTOMER_SME09_P'NOI].STATUS_ID, 
                      dbo.[CUSTOMER_SME09_P'NOI].STATUS_DETAIL, dbo.[CUSTOMER_SME09_P'NOI].SIZE_ID, dbo.[CUSTOMER_SME09_P'NOI].SIZE_DETAIL, 
                      dbo.[CUSTOMER_SME09_P'NOI].CA_NO_ID, dbo.[CUSTOMER_SME09_P'NOI].Branch_T, dbo.[CUSTOMER_SME09_P'NOI].Class, 
                      dbo.[CUSTOMER_SME09_P'NOI].ByCustomer_AGING, dbo.[CUSTOMER_SME09_P'NOI].ByCusDaily_AGING, dbo.[CUSTOMER_SME09_P'NOI].AgingTxt,
                       dbo.[CUSTOMER_SME09_P'NOI].Principal, dbo.[CUSTOMER_SME09_P'NOI].Accru, dbo.[CUSTOMER_SME09_P'NOI].Susp, 
                      dbo.[CUSTOMER_SME09_P'NOI].PAY_PRIN, dbo.[CUSTOMER_SME09_P'NOI].PAY_INT, dbo.[CUSTOMER_SME09_P'NOI].PAY_SUSP, 
                      STOP.dbo.STOP_MONTHLY_DAILY.CLASS_H, STOP.dbo.STOP_MONTHLY_DAILY.OD_UTILIZE, STOP.dbo.STOP_MONTHLY_DAILY.MOVEMENT, 
                      STOP.dbo.STOP_MONTHLY_DAILY.OD_AS_OF, STOP.dbo.STOP_MONTHLY_DAILY.IS_TDR, 
                      STOP.dbo.STOP_MONTHLY_DAILY.TDR_DATE_REPORT
FROM         dbo.[CUSTOMER_SME09_P'NOI] LEFT OUTER JOIN
                      STOP.dbo.STOP_MONTHLY_DAILY ON dbo.[CUSTOMER_SME09_P'NOI].CIF = STOP.dbo.STOP_MONTHLY_DAILY.CIF

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
         Begin Table = "CUSTOMER_SME09_P''NOI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 38
         End
         Begin Table = "STOP_MONTHLY_DAILY (STOP.dbo)"
            Begin Extent = 
               Top = 5
               Left = 375
               Bottom = 239
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 55
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI_2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 2355
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1665
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI_2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'CUSTOMER_SME09_P''NOI_2';

