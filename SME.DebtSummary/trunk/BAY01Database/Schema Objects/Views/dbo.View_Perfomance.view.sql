CREATE VIEW [dbo].[View_Perfomance]
AS


select T.*,B.[Name]
      ,B.[BOTID]
      ,B.[GLGROUP]
      ,B.[PDGROUP]
      ,B.[GECustSize]
      ,B.[BaySize]
      ,B.[Rating]
      ,B.[Busi_Type]
      ,B.[Tdr]
      ,B.[Count]
      ,B.[DateReport]
      ,B.[DateRegister]
      ,B.[Date_Report]
      ,B.[Branch]
      ,B.[BranchMaxPrin]
      ,B.[Dept]
      ,B.[DEPT_APPV]
      ,B.[DEPT_TRAN]
      ,B.[Class]
      ,B.[ClassE]
      ,B.[AGING]
      ,B.[NPL]
      ,B.[Limit]
      ,B.[PrinResv]
      ,B.[PrincipalFull]
      ,B.[PrincipalG]
      ,B.[Principal]
      ,B.[Cont]
      ,B.[CCF1]
      ,B.[Contingent]
      ,B.[AccruFull]
      ,B.[Accru]
      ,B.[SuspOri]
      ,B.[Susp]
      ,B.[UNEARNPRIN]
      ,B.[UNEARNINT]
      ,B.[UNCLEAPRIN]
      ,B.[UNCLEAINT]
      ,B.[DEFER]
      ,B.[UseValue]
      ,B.[BAfterC]
      ,B.[TdrLoss]
      ,B.[Reserve]
      ,B.[PVLOSS]
      ,B.[ExtraResv]
      ,B.[BaySpresv]
      ,B.[Totresv]
      ,B.[Limit_Out]
      ,B.[Principal_Out]
      ,B.[Olddef_Exc]
      ,B.[ResvExc]
      ,B.[Full_IAS39]
      ,B.[ResvFull]
      ,B.[BotClass]
      ,B.[AddResv]
      ,B.[BotColl]
      ,B.[CUS_DEPT_FLAG]
      ,B.[CUS_DEPT_TRAN]
      ,B.[OFFICR_ID]
      ,B.[NPLFLAG]
      ,B.[StatusPAY]
      ,B.[Affiliate]
      ,B.[BOT]
      ,B.[BOTYear]
      ,B.[BOTClassAfter] from ByCustomer as B Right outer join
(	SELECT TEMP.CIF,TEMP.LEAD_ID,TEMP.LEAD_NAME,TEMP.ID AS CA_ID,
CM_CODE,
CM_NAME,
REGION_ID,
REGION_NAME,
TEMP.SUBJECT_DETAIL,TEMP.OTHERS AS DETAIL,TEMP.PROCESS_ID,TEMP.PROCESS,TEMP.PROCESS_DATE
		FROM	(SELECT     ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY PROCESS_DATE DESC) AS SEQ, C.CIF,
C.Undertaker as CM_CODE,
C.Undertakername as CM_NAME,
C.REGION_ID,
C.REGION_NAME,
L.LEAD_ID,L.LEAD_NAME,C.ID,C.SUBJECT_DETAIL,C.OTHERS,C.PROCESS_ID,C.PROCESS,C.PROCESS_DATE
				FROM         dbo.CreditFilter03_Credit_Account_Process AS C INNER JOIN 
                      (SELECT EMP.EMP_ID,EMP.LEAD_ID, LEAD.EMPNAME+' '+LEAD.EMPSURNAME AS LEAD_NAME
					   FROM CONTROLLING_LINE_FULL AS EMP INNER JOIN CONTROLLING_LINE_FULL AS LEAD ON LEAD.EMP_ID = EMP.LEAD_ID) AS L ON C.Undertaker = L.EMP_ID
				WHERE     (C.PROCESS_GROUP IN ('C', 'D', 'E')) 
						
							AND not exists (SELECT EMP_ID FROM CONTROLLING_LINE_FULL WHERE EMP_ID=LEAD_ID AND EMP_ID=Undertaker)
						
							) AS TEMP
		WHERE SEQ = 1
	UNION ALL
		SELECT TEMP.CIF0 AS CIF,TEMP.LEAD_ID,TEMP.LEAD_NAME,TEMP.CA_ID,
PROCESS_EMP_ID as CM_CODE,
PROCESS_EMP_NAME as CM_NAME,
FROM_REGION as REGION_ID,
REGION_NAME as REGION_NAME,
 TEMP.SUBJECT_DETAIL, TEMP.DETAIL,TEMP.PROCESS_ID,TEMP.PROCESS,
 TEMP.LAST_PROCESS_DATE AS PROCESS_DATE
		FROM
			(SELECT ROW_NUMBER() OVER(PARTITION BY CA_TEMP.CIF0 ORDER BY CA_TEMP.LAST_PROCESS_DATE DESC) AS SEQ,CA_TEMP.*
				FROM
				(SELECT [CA_P200_P300_P400_FROM_LEADER_SME].CIF AS CIF0, [NAME] AS [NAME0],*
					FROM .[dbo].[CA_P200_P300_P400_FROM_LEADER_SME]
				UNION ALL
					SELECT [CA_P200_P300_P400_FROM_LEADER_SME].CIF1 AS CIF0, [NAME1] AS [NAME0],*
					FROM .[dbo].[CA_P200_P300_P400_FROM_LEADER_SME]
					WHERE [CA_P200_P300_P400_FROM_LEADER_SME].[CIF1] Is not null
				UNION ALL
					SELECT [CA_P200_P300_P400_FROM_LEADER_SME].CIF2 AS CIF0, [NAME2] AS [NAME0],*
					FROM .[dbo].[CA_P200_P300_P400_FROM_LEADER_SME]
					WHERE [CA_P200_P300_P400_FROM_LEADER_SME].[CIF2] Is not null
				UNION ALL
					SELECT [CA_P200_P300_P400_FROM_LEADER_SME].CIF3 AS CIF0, [NAME3] AS [NAME0],*
					FROM .[dbo].[CA_P200_P300_P400_FROM_LEADER_SME]
					WHERE [CA_P200_P300_P400_FROM_LEADER_SME].[CIF3] Is not null
				UNION ALL
					SELECT [CA_P200_P300_P400_FROM_LEADER_SME].CIF4 AS CIF0, [NAME4] AS [NAME0],*
					FROM .[dbo].[CA_P200_P300_P400_FROM_LEADER_SME]
					WHERE [CA_P200_P300_P400_FROM_LEADER_SME].[CIF4] Is not null
				) AS CA_TEMP
			) AS TEMP
		WHERE TEMP.SEQ = 1
	) as T
on T.Cif = B.Cif 


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
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
         Begin Table = "ANNALS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_Perfomance';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_Perfomance';

