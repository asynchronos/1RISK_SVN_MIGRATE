CREATE VIEW dbo.EMPLOYEE01
AS
SELECT     dbo.TB_EMPLOYEE.EMP_ID, dbo.TB_TITLE.TITLE_NAME, dbo.TB_TITLE.TITLE_NAME_E, dbo.TB_EMPLOYEE.EMPNAME, 
                      dbo.TB_EMPLOYEE.EMPSURNAME, dbo.TB_EMPLOYEE.EMPNAME_E, dbo.TB_EMPLOYEE.EMPSURNAME_E, dbo.TB_EMPLOYEE.EMAIL, 
                      dbo.TB_EMPLOYEE.IDCARD, dbo.TB_EMPLOYEE.TAX_NO, dbo.TB_EMPLOYEE.ACCNO, dbo.TB_EMPLOYEE.ADDRESS, dbo.TB_EMPLOYEE.SOI, 
                      dbo.TB_EMPLOYEE.ROAD, dbo.TB_EMPLOYEE.LOCALITY, dbo.TB_EMPLOYEE.DISTRINCT, dbo.TB_EMPLOYEE.PROV_CODE, 
                      dbo.TB_EMPLOYEE.ZIPCODE, dbo.TB_EMPLOYEE.TEL_HOME, dbo.TB_EMPLOYEE.TEL_MOBILE, dbo.TB_EMPLOYEE.TEL_INDOOR, 
                      dbo.TB_EMPLOYEE.DATEOFBIRTH, dbo.TB_EMPLOYEE.IMAGENAME, dbo.TB_EMPLOYEE.DATEOFSTART, dbo.TB_EMPLOYEE.STATUS, 
                      dbo.TB_EMPLOYEE.TEAM_ID, dbo.TB_EMPLOYEE.GROUP_HEAD, dbo.TB_EMPLOYEE.ROLE, dbo.TB_EMPLOYEE.PERMIT, 
                      dbo.TB_EMPLOYEE.USERNAME, dbo.TB_EMPLOYEE.PASSWD, dbo.TB_EMPLOYEE.UP_DT, dbo.TB_EMPLOYEE.Dept, 
                      dbo.TB_EMPLOYEE.Id_Region, dbo.TB_EMPLOYEE.Id_Branch, dbo.TB_EMPLOYEE.POSITION_CODE, dbo.TB_EMPLOYEE.Id_Region_Group, 
                      dbo.TB_EMPLOYEE.Id_Branch_Group, dbo.TB_EMPLOYEE.Id_Group_Group, dbo.TB_EMPLOYEE.level_id
FROM         dbo.TB_EMPLOYEE INNER JOIN
                      dbo.TB_TITLE ON dbo.TB_EMPLOYEE.TITLE_CODE = dbo.TB_TITLE.TITLE_CODE
WHERE     (dbo.TB_EMPLOYEE.EMP_ID <> '000001')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[35] 3) )"
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
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_TITLE"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 106
               Right = 395
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'EMPLOYEE01';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'EMPLOYEE01';

