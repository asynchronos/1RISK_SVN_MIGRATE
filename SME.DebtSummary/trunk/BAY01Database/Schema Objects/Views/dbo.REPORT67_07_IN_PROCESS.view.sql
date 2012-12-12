﻿CREATE VIEW dbo.REPORT67_07_IN_PROCESS
AS
SELECT     R07.OLD_ID, R07.CA_NO_ID, R07.SUBJECT_GROUP, R07.CIF, dbo.GetName(C.CUS_TITLE, C.CUS_FIRST, C.CUS_LAST) AS CUS_NAME, 
                      R07.CA_CREATE_DATE, R07.LAST_PROCESS_GROUP, R07.LAST_PROCESS_ID, R07.LAST_PROCESS, R07.LAST_PROCESS_DATE, R07.EMP_ID, 
                      dbo.GetName(E.TITLE_NAME, E.EMPNAME, E.EMPSURNAME) AS EMP_NAME, R07.LEVEL_ID, R07.LEVEL_NAME, R07.Customer_Size, 
                      R07.SIZE_DETAIL, dbo.REPORT66_CA_SEND_TO_BOARD.PROCESS_DATE AS SEND_TO_BOARD_DATE, R07.REGION_ID, R07.Region_Name, 
                      ROW_NUMBER() OVER (PARTITION BY R07.OLD_ID
ORDER BY R07.SUBJECT_GROUP) AS SEQ
FROM         dbo.REPORT07_SUMMARY AS R07 LEFT OUTER JOIN
                      dbo.EMPLOYEE01 AS E ON E.EMP_ID = R07.EMP_ID LEFT OUTER JOIN
                      dbo.CUSTOMER AS C ON R07.CIF = C.CIF LEFT OUTER JOIN
                      dbo.REPORT66_CA_SEND_TO_BOARD ON R07.OLD_ID = dbo.REPORT66_CA_SEND_TO_BOARD.ID
WHERE     (R07.LAST_PROCESS_GROUP = 'A') OR
                      (R07.LAST_PROCESS_GROUP = 'B')

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
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Configuration = "(H (2[37] 3) )"
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
         Width = 3300
         Width = 1500
         Width = 1920
         Width = 4425
         Width = 4425
         Width = 1815
         Width = 1815
         Width = 2940
         Width = 1500
         Width = 2340
         Width = 2340
         Width = 1500
         Width = 1890
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT67_07_IN_PROCESS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'REPORT67_07_IN_PROCESS';

