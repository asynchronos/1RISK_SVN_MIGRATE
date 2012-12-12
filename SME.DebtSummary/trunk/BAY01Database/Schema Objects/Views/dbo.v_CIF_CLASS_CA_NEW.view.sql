CREATE VIEW dbo.v_CIF_CLASS_CA_NEW
AS
SELECT     dbo.v_Credit_Account_Process.ID, dbo.v_Credit_Account_Process.CIF, dbo.v_Credit_Account_Process.CUS_TITLE, 
                      dbo.v_Credit_Account_Process.CUS_FIRST, dbo.v_Credit_Account_Process.CUS_LAST, dbo.v_Credit_Account_Process.SUBJECT, 
                      dbo.v_Credit_Account_Process.SUBJECT_DETAIL, dbo.v_Credit_Account_Process.PROCESS_GROUP, dbo.v_Credit_Account_Process.PROCESS, 
                      MAX(dbo.v_Credit_Account_Process.PROCESS_DATE) AS Date, dbo.Cif_Class.Class5001, dbo.Cif_Class.Class5002, dbo.Cif_Class.Class5003, 
                      dbo.Cif_Class.Class5004, dbo.Cif_Class.Class5005, dbo.Cif_Class.Class5006, dbo.Cif_Class.Class5007, dbo.Cif_Class.Class5008, 
                      dbo.Cif_Class.Class5009, dbo.Cif_Class.Class5010, dbo.Cif_Class.Class5011, dbo.Cif_Class.Class5012, dbo.Cif_Class.Class5101, 
                      dbo.Cif_Class.Class5102, dbo.Cif_Class.Class5103, dbo.Cif_Class.Class5104, dbo.Cif_Class.Class5105, dbo.Cif_Class.Class5106, 
                      dbo.Cif_Class.Class5107, dbo.Cif_Class.Class5108, dbo.Cif_Class.Class5109, dbo.Cif_Class.Class5110, dbo.Cif_Class.Class5111, 
                      dbo.Cif_Class.Class5112, dbo.v_Credit_Account_Process.EMP_ID, dbo.v_Credit_Account_Process.EMPNAME, 
                      dbo.v_Credit_Account_Process.EMPSURNAME, dbo.TB_EMPLOYEE.EMPNAME AS Head_Name, 
                      dbo.TB_EMPLOYEE.EMPSURNAME AS Head_surname
FROM         dbo.v_Credit_Account_Process LEFT OUTER JOIN
                      dbo.TB_EMPLOYEE INNER JOIN
                      dbo.Controlling_Level INNER JOIN
                      dbo.Controlling_LeadsInLevel ON dbo.Controlling_Level.LEVEL_ID = dbo.Controlling_LeadsInLevel.LEVEL_ID INNER JOIN
                      dbo.Controlling_UsersInLevel ON dbo.Controlling_Level.LEVEL_ID = dbo.Controlling_UsersInLevel.LEVEL_ID ON 
                      dbo.TB_EMPLOYEE.EMP_ID = dbo.Controlling_LeadsInLevel.EMP_ID ON 
                      dbo.v_Credit_Account_Process.EMP_ID = dbo.Controlling_UsersInLevel.EMP_ID LEFT OUTER JOIN
                      dbo.Cif_Class ON dbo.v_Credit_Account_Process.CIF = dbo.Cif_Class.Cif_No
GROUP BY dbo.v_Credit_Account_Process.ID, dbo.v_Credit_Account_Process.CIF, dbo.v_Credit_Account_Process.CUS_TITLE, 
                      dbo.v_Credit_Account_Process.CUS_FIRST, dbo.v_Credit_Account_Process.CUS_LAST, dbo.v_Credit_Account_Process.SUBJECT, 
                      dbo.v_Credit_Account_Process.SUBJECT_DETAIL, dbo.v_Credit_Account_Process.PROCESS_GROUP, dbo.v_Credit_Account_Process.PROCESS, 
                      dbo.Cif_Class.Class5001, dbo.Cif_Class.Class5002, dbo.Cif_Class.Class5003, dbo.Cif_Class.Class5004, dbo.Cif_Class.Class5005, 
                      dbo.Cif_Class.Class5006, dbo.Cif_Class.Class5007, dbo.Cif_Class.Class5008, dbo.Cif_Class.Class5009, dbo.Cif_Class.Class5010, 
                      dbo.Cif_Class.Class5011, dbo.Cif_Class.Class5012, dbo.Cif_Class.Class5101, dbo.Cif_Class.Class5102, dbo.Cif_Class.Class5103, 
                      dbo.Cif_Class.Class5104, dbo.Cif_Class.Class5105, dbo.Cif_Class.Class5106, dbo.Cif_Class.Class5107, dbo.Cif_Class.Class5108, 
                      dbo.Cif_Class.Class5109, dbo.Cif_Class.Class5110, dbo.Cif_Class.Class5111, dbo.Cif_Class.Class5112, dbo.v_Credit_Account_Process.EMP_ID, 
                      dbo.v_Credit_Account_Process.EMPNAME, dbo.v_Credit_Account_Process.EMPSURNAME, dbo.TB_EMPLOYEE.EMPNAME, 
                      dbo.TB_EMPLOYEE.EMPSURNAME
HAVING      (dbo.v_Credit_Account_Process.PROCESS_GROUP IN ('C', 'D', 'E'))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[12] 4[11] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[22] 2[67] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[72] 3) )"
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
         Configuration = "(H (1[75] 4) )"
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
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = -192
      End
      Begin Tables = 
         Begin Table = "v_Credit_Account_Process"
            Begin Extent = 
               Top = 10
               Left = 7
               Bottom = 242
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cif_Class"
            Begin Extent = 
               Top = 7
               Left = 242
               Bottom = 237
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 94
         End
         Begin Table = "Controlling_LeadsInLevel"
            Begin Extent = 
               Top = 247
               Left = 388
               Bottom = 332
               Right = 556
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_Level"
            Begin Extent = 
               Top = 250
               Left = 202
               Bottom = 365
               Right = 370
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Controlling_UsersInLevel"
            Begin Extent = 
               Top = 268
               Left = 2
               Bottom = 353
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EMPLOYEE"
            Begin Extent = 
               Top = 230
               Left = 616
               Bottom = 345
               Right = 797
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_CIF_CLASS_CA_NEW';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 1125
         Width = 1185
         Width = 1500
         Width = 1500
         Width = 2715
         Width = 2085
         Width = 1470
         Width = 2085
         Width = 1935
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
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_CIF_CLASS_CA_NEW';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_CIF_CLASS_CA_NEW';

