CREATE VIEW dbo.V_019_PORT_FOR_KPI
AS
SELECT     C07.cif AS CIF, C07.custname AS CUSNAME, C12.custsize AS CUSTSIZE_200912, C06.custsize AS CUSTSIZE_201006, 
                      C07.custsize AS CUSTSIZE_201007, C12.principal AS PRINCIPAL_200912, C06.principal AS PRINCIPAL_201006, C07.principal AS PRINCIPAL_201007, 
                      C12.unearnprin AS UNEARNPRIN_200912, C06.unearnprin AS UNEARNPRIN_201006, C07.unearnprin AS UNEARNPRIN_201007, 
                      C12.accru AS ACCRU_200912, C06.accru AS ACCRU_201006, C07.accru AS ACCRU_201007, C12.non_cash AS NON_CASH_200912, 
                      C06.non_cash AS NON_CASH_201006, C07.non_cash AS NON_CASH_201007, C12.adjclass AS ADJCLASS_200912, 
                      C06.adjclass AS ADJCLASS_201006, C07.adjclass AS ADJCLASS_201007, 
                      CASE C12.adjclass WHEN N'ก' THEN 'NPL' WHEN N'ข' THEN 'NPL' WHEN N'ค' THEN 'NPL' WHEN N'ง' THEN 'SM' WHEN N'จ' THEN 'PASS' ELSE NULL
                       END AS STATUS_200912, 
                      CASE C06.adjclass WHEN N'ก' THEN 'NPL' WHEN N'ข' THEN 'NPL' WHEN N'ค' THEN 'NPL' WHEN N'ง' THEN 'SM' WHEN N'จ' THEN 'PASS' ELSE NULL
                       END AS STATUS_201006, 
                      CASE C07.adjclass WHEN N'ก' THEN 'NPL' WHEN N'ข' THEN 'NPL' WHEN N'ค' THEN 'NPL' WHEN N'ง' THEN 'SM' WHEN N'จ' THEN 'PASS' ELSE NULL
                       END AS STATUS_201007, C12.cm_code AS CM_CODE_200912, C06.cm_code AS CM_CODE_201006, C07.cm_code AS CM_CODE_201007, 
                      C12.cm_name AS CM_NAME_200912, C06.cm_name AS CM_NAME_201006, C07.cm_name AS CM_NAME_201007, 
                      SME.SIZE_DETAIL AS RISK_CUSTSIZE, SME.JUDGEMENT_DETAIL AS RISK_WATCHLIST, SME.STATUS_DETAIL AS RISK_STATUS_DETAIL, 
                      SME.Id_Region AS RISK_ID_REGION, SME.Region_Name AS RISK_REGION_NAME, SME.REGION_NAME2 AS RISK_REGION_NAME2, 
                      SME.CONTROLLING_UNIT AS RISK_CONTROLLING_UNIT, SME.REGION_CONTROLLING_UNIT AS RISK_REGION_CONTROLLING_UNIT, 
                      CM_CTRL.LEVEL_SIZE AS RISK_SIZE_BY_CM_NAME, SME.CM_CODE AS RISK_CM_CODE, SME.CM_NAME AS RISK_CM_NAME, 
                      SME.UPDATE_DATE AS RISK_UPDATE_DATE, dbo.CUSTOMER.BAYRATING, dbo.CUSTOMER.RATING
FROM         DBF_IMPORT.dbo.TB_TEMP_CUST_12M_20100630 AS C06 RIGHT OUTER JOIN
                      DBF_IMPORT.dbo.TB_TEMP_CUST_12M_20100731 AS C07 LEFT OUTER JOIN
                      dbo.CUSTOMER ON C07.cif = dbo.CUSTOMER.CIF LEFT OUTER JOIN
                      DBF_IMPORT.dbo.TB_TEMP_CUST_12M_20091231 AS C12 ON C07.cif = C12.cif ON C06.cif = C07.cif LEFT OUTER JOIN
                      dbo.CUSTOMER_SME00_ALL_STATUS AS SME LEFT OUTER JOIN
                          (SELECT     EMP_ID, LEVEL_SIZE
                            FROM          dbo.CONTROLLING_LINE_FULL
                            WHERE      (EMP_ID <> '128678') AND (LEVEL_SIZE IS NOT NULL)) AS CM_CTRL ON SME.CM_CODE = CM_CTRL.EMP_ID ON 
                      C07.cif = SME.CIF
WHERE     (C07.cif IN
                          (SELECT     cif
                            FROM          DBF_IMPORT.dbo.TB_TEMP_CUST_12M_20100731
                            WHERE      (LTRIM(RTRIM(custsize)) = N'SME' OR
                                                   LTRIM(RTRIM(custsize)) = N'SME_M' OR
                                                   LTRIM(RTRIM(custsize)) = N'SME_S') AND (principal + unearnprin + accru > 0)
                            UNION
                            SELECT     CIF
                            FROM         dbo.CUSTOMER_SME)) AND (C07.cif NOT IN
                          (SELECT     CIF
                            FROM          dbo.CUSTOMER AS CUSTOMER_1
                            WHERE      (DEPTFLAG = 1) AND (DEPTTRAN >= 8700 AND DEPTTRAN < 8800 OR
                                                   DEPTTRAN = 3700)))

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
         Begin Table = "SME"
            Begin Extent = 
               Top = 7
               Left = 198
               Bottom = 135
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_CTRL"
            Begin Extent = 
               Top = 13
               Left = 16
               Bottom = 98
               Right = 168
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C07"
            Begin Extent = 
               Top = 6
               Left = 501
               Bottom = 269
               Right = 653
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "C12"
            Begin Extent = 
               Top = 6
               Left = 824
               Bottom = 121
               Right = 976
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "C06"
            Begin Extent = 
               Top = 130
               Left = 683
               Bottom = 258
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "CUSTOMER"
            Begin Extent = 
               Top = 146
               Left = 320
               Bottom = 261
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 46
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 2685
         Width = 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_019_PORT_FOR_KPI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'500
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
         Width = 2610
         Width = 2130
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2670
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_019_PORT_FOR_KPI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_019_PORT_FOR_KPI';

