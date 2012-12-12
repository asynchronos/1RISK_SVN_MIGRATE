CREATE VIEW dbo.V_Cust_Last_Approve
AS
SELECT     TOP (100) PERCENT dbo.V_Cust_Last_Date_In.CIF, DBF_IMPORT.dbo.rep_prod.custname, dbo.V_Cust_Last_Date_In.LAST_DATE_IN, 
                      dbo.V_Cust_Last_Date_In.LAST_CA, dbo.TEMP_REPORT_PRODUCT.PROCESS_GROUP, dbo.TEMP_REPORT_PRODUCT.[EMP-ID], 
                      dbo.TEMP_REPORT_PRODUCT.EMPLOYEE, dbo.TEMP_REPORT_PRODUCT.EMP_APPROVE, dbo.TEMP_REPORT_PRODUCT.EMP_APPROVE2, 
                      DBF_IMPORT.dbo.rep_prod.adjclass, DBF_IMPORT.dbo.rep_prod.class_h, dbo.F_BEGIN_NPL_DATE_FROM_CLASS(DBF_IMPORT.dbo.rep_prod.as_of, 
                      DBF_IMPORT.dbo.rep_prod.class_h) AS 'BEGIN_NPL_DATE', DBF_IMPORT.dbo.rep_prod.tot_prin, DBF_IMPORT.dbo.rep_prod.aging_h, 
                      DBF_IMPORT.dbo.rep_prod.m_aging, DBF_IMPORT.dbo.rep_prod.as_of, DBF_IMPORT.dbo.lim_exp.cif AS Expr1, DBF_IMPORT.dbo.lim_exp.grp_lim, 
                      DBF_IMPORT.dbo.lim_exp.lim_amt, DBF_IMPORT.dbo.lim_exp.numcust, DBF_IMPORT.dbo.lim_exp.mcif, dbo.TEMP_REPORT_PRODUCT.APPROVE, 
                      dbo.TEMP_REPORT_PRODUCT.AUTHORITY, dbo.TEMP_REPORT_PRODUCT.NET, dbo.TEMP_REPORT_PRODUCT.[SUM-INCREASE], 
                      dbo.TEMP_REPORT_PRODUCT.[SUM-DECREASE]
FROM         dbo.V_Cust_Last_Date_In LEFT OUTER JOIN
                      DBF_IMPORT.dbo.lim_exp ON dbo.V_Cust_Last_Date_In.CIF = DBF_IMPORT.dbo.lim_exp.cif LEFT OUTER JOIN
                      DBF_IMPORT.dbo.rep_prod ON dbo.V_Cust_Last_Date_In.CIF = DBF_IMPORT.dbo.rep_prod.cif LEFT OUTER JOIN
                      dbo.TEMP_REPORT_PRODUCT ON dbo.V_Cust_Last_Date_In.LAST_CA = dbo.TEMP_REPORT_PRODUCT.ID
WHERE     (dbo.TEMP_REPORT_PRODUCT.PROCESS_GROUP = 'D') AND (dbo.V_Cust_Last_Date_In.LAST_DATE_IN < DBF_IMPORT.dbo.rep_prod.as_of)
ORDER BY dbo.TEMP_REPORT_PRODUCT.[EMP-ID]

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[16] 2[31] 3) )"
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
         Begin Table = "V_Cust_Last_Date_In"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 106
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lim_exp (DBF_IMPORT.dbo)"
            Begin Extent = 
               Top = 132
               Left = 326
               Bottom = 291
               Right = 556
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "rep_prod (DBF_IMPORT.dbo)"
            Begin Extent = 
               Top = 0
               Left = 368
               Bottom = 115
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TEMP_REPORT_PRODUCT"
            Begin Extent = 
               Top = 41
               Left = 699
               Bottom = 257
               Right = 877
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2535
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2640
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
      Begi', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Cust_Last_Approve';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'n ColumnWidths = 11
         Column = 9540
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Cust_Last_Approve';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Cust_Last_Approve';

