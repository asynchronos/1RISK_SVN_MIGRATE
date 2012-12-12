CREATE VIEW dbo.V_028_ALL_APPROVE_CIF_CA_PRIORITY_BY_CREDIT_UP
AS
SELECT     B3.[OLD_ID], B3.[CA_CREATE_DATE], B3.[IS_CREDIT_UP], B3.[Authority_id], B3.[Authority], B3.[EMP_APPROVE_OR_REQUEST_ID], 
                      dbo.getNAME(E1.TITLE_NAME, E1.EMPNAME, E1.EMPSURNAME) AS [EMP_APPROVE_OR_REQUEST_NAME], 
                      C4.[LEVEL_ID] AS EMP_APPROVE_LEVEL_ID, C4.[LEVEL_NAME] AS EMP_APPROVE_LEVEL_NAME, B3.[APPROVE_DATE], B3.[CIF], B3.[CA_NO_ID], 
                      B3.[LAST_PROCESS_EMP], B3.[LAST_PROCESS_LEVEL_ID], B3.[LAST_PROCESS_LEVEL_NAME], B3.[REGION_ID], B3.[Region_Name], 
                      B3.OLD_REGION_ID, B3.OLD_REGION, B3.[SIZE_IN_CA], A2.CM_CODE, A2.SIZE_BY_CM_STRUCTURE, CASE WHEN B3.[IS_CREDIT_UP] = 'Y' AND 
                      A2.SIZE_BY_CM_STRUCTURE IS NOT NULL THEN SIZE_BY_CM_STRUCTURE WHEN B3.[IS_CREDIT_UP] = 'Y' AND B3.[Authority_id] = '1' AND 
                      A2.SIZE_BY_CM_STRUCTURE IS NULL AND LEFT(B3.[LAST_PROCESS_LEVEL_NAME], 3) <> 'L&M' THEN 'SME_S' WHEN B3.[IS_CREDIT_UP] = 'Y' AND
                       B3.[Authority_id] = '1' AND A2.SIZE_BY_CM_STRUCTURE IS NULL AND LEFT(B3.[LAST_PROCESS_LEVEL_NAME], 3) 
                      = 'L&M' THEN 'SME_M' /*WHEN B3.[IS_CREDIT_UP]='Y' AND B3.[Authority_id]='1' AND A2.SIZE_BY_CM_STRUCTURE='SME_M' THEN 'SME_M'*/ WHEN
                       B3.[IS_CREDIT_UP] = 'Y' AND B3.[Authority_id] <> '1' AND (B3.[EMP_APPROVE_OR_REQUEST_ID] = '047928' OR
                      B3.[EMP_APPROVE_OR_REQUEST_ID] = '050906' OR
                      B3.[EMP_APPROVE_OR_REQUEST_ID] = '138081' OR
                      B3.[EMP_APPROVE_OR_REQUEST_ID] = '141051') THEN 'SME_S' WHEN B3.[IS_CREDIT_UP] = 'Y' AND B3.[Authority_id] <> '1' AND 
                      (B3.[EMP_APPROVE_OR_REQUEST_ID] <> '047928' AND B3.[EMP_APPROVE_OR_REQUEST_ID] <> '050906' AND 
                      B3.[EMP_APPROVE_OR_REQUEST_ID] <> '138081' AND B3.[EMP_APPROVE_OR_REQUEST_ID] <> '141051') AND 
                      LEFT(B3.[LAST_PROCESS_LEVEL_NAME], 3) <> 'L&M' THEN 'SME_S' WHEN B3.[IS_CREDIT_UP] = 'Y' AND B3.[Authority_id] <> '1' AND 
                      (B3.[EMP_APPROVE_OR_REQUEST_ID] <> '047928' AND B3.[EMP_APPROVE_OR_REQUEST_ID] <> '050906' AND 
                      B3.[EMP_APPROVE_OR_REQUEST_ID] <> '138081' AND B3.[EMP_APPROVE_OR_REQUEST_ID] <> '141051') AND 
                      LEFT(B3.[LAST_PROCESS_LEVEL_NAME], 3) = 'L&M' THEN [SIZE_IN_CA] ELSE NULL END AS SME_MIS_FINAL_SIZE
FROM         (SELECT     [OLD_ID], [CA_CREATE_DATE], [IS_CREDIT_UP], [Authority_id], [Authority], [EMP_APPROVE_OR_REQUEST_ID], [APPROVE_DATE], [CIF], 
                                              [CA_NO_ID], [LAST_PROCESS_EMP], [LAST_PROCESS_LEVEL_ID], [LAST_PROCESS_LEVEL_NAME], [REGION_ID], [Region_Name], 
                                              OLD_REGION_ID, OLD_REGION, [SIZE_IN_CA]
                       FROM          (SELECT     ROW_NUMBER() OVER (PARTITION BY CIF, OLD_ID
                                               ORDER BY IS_CREDIT_UP DESC) AS SEQ, *
                       FROM          (SELECT DISTINCT 
                                                                      [OLD_ID], [CA_CREATE_DATE], [SUBJECT_DETAIL_ID]/* 101,102,103,114,115 is credit up*/ , 
                                                                      CASE [SUBJECT_DETAIL_ID] WHEN 101 THEN 'Y' WHEN 102 THEN 'Y' WHEN 103 THEN 'Y' WHEN 114 THEN 'Y' WHEN 115 THEN
                                                                       'Y' ELSE 'N' END AS IS_CREDIT_UP, [Send_To_Board] AS [Authority_id], [Authority], 
                                                                      CASE [Send_To_Board] WHEN 1 THEN [EMP_REQUEST_ID] ELSE [EMP_APPROVE_ID] END AS [EMP_APPROVE_OR_REQUEST_ID],
                                                                       [LAST_PROCESS_DATE] AS APPROVE_DATE, [CIF], [CA_NO_ID]/*,[APPROVE_DATE]*/ , [EMP_ID] AS LAST_PROCESS_EMP, 
                                                                      [LEVEL_ID] AS LAST_PROCESS_LEVEL_ID, [LEVEL_NAME] AS LAST_PROCESS_LEVEL_NAME, [REGION_ID], [Region_Name], 
                                                                      OLD_REGION_ID, OLD_REGION, [SIZE_DETAIL] AS SIZE_IN_CA
                                               FROM          [dbo].[REPORT07_SUMMARY]
                                               WHERE      LAST_PROCESS_GROUP = 'D') AS B1) AS B2
WHERE     SEQ = 1) AS B3 INNER JOIN
    (SELECT     CIF, CM_CODE, SIZE_BY_CM_STRUCTURE
      FROM          (SELECT     CIF, CM_CODE, 'SME_M' AS SIZE_BY_CM_STRUCTURE
                              FROM          CUSTOMER_SME SME
                              WHERE      CM_CODE IN
                                                         (SELECT DISTINCT [EMP_ID]
                                                           FROM          [dbo].[V_Role_EmpInRole_With_Mapping]
                                                           WHERE      [ROLE_ID] >= 680 AND [ROLE_ID] <= 688)
                              UNION
                              SELECT     CIF, NULL, NULL
                              FROM         [dbo].[REPORT07_SUMMARY]
                              WHERE     LAST_PROCESS_GROUP = 'D' AND CIF NOT IN
                                                        (SELECT     CIF
                                                          FROM          CUSTOMER_SME SME
                                                          WHERE      CM_CODE IN
                                                                                     (SELECT DISTINCT [EMP_ID]
                                                                                       FROM          [dbo].[V_Role_EmpInRole_With_Mapping]
                                                                                       WHERE      [ROLE_ID] >= 680 AND [ROLE_ID] <= 688))) AS A1) AS A2 ON B3.CIF = A2.CIF LEFT OUTER JOIN
    (SELECT     C3.[LEVEL_ID], C3.[EMP_ID], C3.[LEVEL_NAME]
      FROM          (SELECT     C1.[LEVEL_ID], C1.[EMP_ID], C2.[LEVEL_NAME], ROW_NUMBER() OVER (PARTITION BY C1.EMP_ID
                              ORDER BY C1.LEVEL_ID DESC) AS SEQ
      FROM          [dbo].[Controlling_UsersInLevel] C1 INNER JOIN
                             [dbo].Controlling_Level C2 ON C1.LEVEL_ID = C2.LEVEL_ID) AS C3
WHERE     SEQ = 1) AS C4 ON B3.[EMP_APPROVE_OR_REQUEST_ID] = C4.EMP_ID LEFT OUTER JOIN
dbo.EMPLOYEE01 E1 ON B3.EMP_APPROVE_OR_REQUEST_ID = E1.EMP_ID

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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 26
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
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_028_ALL_APPROVE_CIF_CA_PRIORITY_BY_CREDIT_UP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_028_ALL_APPROVE_CIF_CA_PRIORITY_BY_CREDIT_UP';

