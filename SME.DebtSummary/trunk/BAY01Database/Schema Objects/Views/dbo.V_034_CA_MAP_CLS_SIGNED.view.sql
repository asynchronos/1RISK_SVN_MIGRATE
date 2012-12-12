CREATE VIEW dbo.V_034_CA_MAP_CLS_SIGNED
AS
SELECT     CIF, OLD_ID, CASHTYPE, COUNT(*) AS COUNT_SUBJECT, SUM(APPROVE_VALUE) AS APPROVE_VALUES, SUM(LIMIT_CHANGE_PRODUCT_THB) 
                      AS LIMIT_CHANGE_VALUE
FROM         (SELECT DISTINCT 
                                              CA.SUBJECT_IDEN, CA.IS_CREDIT_UP, CA.OLD_ID, CA.REFERENCE, CA.CA_CREATE_DATE, CA.APPROVE_DATE, CA.CA_NO_ID, CA.CIF, 
                                              CA.DECB_RD2, CA.CASHTYPE, CA.APPROVE_VALUE, CLS.ID_KEY, CLS.LEADER1_CA_OLD_ID, CLS.CLS_LIMIT_PRODUCT_ID_KEY, 
                                              CLS.LIMIT_NO_PRODUCT, CLS.APPL_KEY, CLS.APPL_ID, CLS.PRODUCT_CODE, CLS.PRODUCT_NAME, CLS.ACCOUNT_NO, 
                                              CLS.LIMIT_AMOUNT_PRODUCT_THB, CLS.LIMIT_AMOUNT_PRODUCT_CCY, CLS.LIMIT_PRODUCT_CA_NO, 
                                              CLS.LIMIT_PRODUCT_CA_DATE, CLS.LIMIT_PRODUCT_APPV_DATE, CLS.LIMIT_PRODUCT_APPV_AUTH_UNIT, 
                                              CLS.LIMIT_PRODUCT_PREVIOUS_CA_NO, CLS.LIMIT_PRODUCT_EFFECT_DATE, CLS.LIMIT_PRODUCT_EXPIRE_DATE, 
                                              CLS.LIMIT_PRODUCT_SIGN_DATE, CLS.LIMIT_CHANGE_PRODUCT_THB, CLS.LIMIT_CHANGE_DATE, CLS.MAPPING_STATUS, 
                                              CLS.LEADER1_CREATED_DATE, CLS.LEADER1_UPDATE_DATE
                       FROM          (SELECT     SUBJECT_IDEN, 'Y' AS IS_CREDIT_UP, OLD_ID, REFERENCE, CA_CREATE_DATE, LAST_PROCESS_DATE AS APPROVE_DATE, 
                                                                      CA_NO_ID, CIF, DECB_RD2, CASHTYPE, APPROVE_VALUE
                                               FROM          dbo.REPORT07_SUMMARY
                                               WHERE      (LAST_PROCESS_GROUP = 'D') AND (SUBJECT_DETAIL_ID IN ('101', '102', '103', '114', '115')) AND 
                                                                      (APPROVE_DATE >= CONVERT(datetime, '01/01/2011', 103)) AND (APPROVE_DATE < CONVERT(datetime, '01/02/2011', 103))) 
                                              AS CA LEFT OUTER JOIN
                                                  (SELECT     ID_KEY, CIF, LEADER1_CA_OLD_ID, CLS_LIMIT_PRODUCT_ID_KEY, LIMIT_NO_PRODUCT, APPL_KEY, APPL_ID, 
                                                                           PRODUCT_CODE, PRODUCT_NAME, ACCOUNT_NO, LIMIT_AMOUNT_PRODUCT_THB, LIMIT_AMOUNT_PRODUCT_CCY, 
                                                                           LIMIT_PRODUCT_CA_NO, LIMIT_PRODUCT_CA_DATE, LIMIT_PRODUCT_APPV_DATE, LIMIT_PRODUCT_APPV_AUTH_UNIT, 
                                                                           LIMIT_PRODUCT_PREVIOUS_CA_NO, LIMIT_PRODUCT_EFFECT_DATE, LIMIT_PRODUCT_EXPIRE_DATE, 
                                                                           LIMIT_PRODUCT_SIGN_DATE, LIMIT_CHANGE_PRODUCT_THB, LIMIT_CHANGE_DATE, MAPPING_STATUS, 
                                                                           LEADER1_CREATED_DATE, LEADER1_UPDATE_DATE
                                                    FROM          dbo.CLS_WHEN_APPROVE
                                                    WHERE      (MAPPING_STATUS IS NOT NULL) AND (MAPPING_STATUS <> 'R')) AS CLS ON CA.CIF = CLS.CIF AND 
                                              CA.OLD_ID = CLS.LEADER1_CA_OLD_ID AND CA.APPROVE_VALUE = CLS.LIMIT_CHANGE_PRODUCT_THB AND 
                                              CA.DECB_RD2 = CLS.PRODUCT_NAME) AS T
GROUP BY CIF, OLD_ID, CASHTYPE

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
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 268
               Right = 313
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
      Begin ColumnWidths = 12
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_034_CA_MAP_CLS_SIGNED';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_034_CA_MAP_CLS_SIGNED';

