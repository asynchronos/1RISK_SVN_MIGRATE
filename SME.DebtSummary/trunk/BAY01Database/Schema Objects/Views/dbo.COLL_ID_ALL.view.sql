CREATE VIEW dbo.COLL_ID_ALL
AS
SELECT     COLL_ID, Id_TypeCid05 AS buildtype, BUILDNAME AS Buildname_Rentname, ISNULL(CONVERT(nvarchar(50), CHANODE), '') AS Chanode_Addno, 
                      SOI + ' ' + ROAD + ' ' + DISTRICT + ' ' + AMPHUR AS Detail1, PROV_CODE, CONVERT(nvarchar(20), AREA_RAI) + 'ไร่' + CONVERT(nvarchar(20), 
                      AREA_NGAN) + 'งาน' + CONVERT(nvarchar(20), AREA_WAH) + 'ตารางวา' AS Detail2, AREA_RAI AS RAI, AREA_NGAN AS NGAN, AREA_WAH AS WAH, 
                      0 AS SQUAREMATE, CONVERT(nvarchar(20), '') AS MACH_NO
FROM         dbo.Dic05
UNION ALL
SELECT     COLL_ID, Id_Build_Type AS buildtype, BUILNAME AS Buildname_Rentname, BUILD_ADDR AS Chanode_Addno, + 'ซอย ' + ISNULL(BUILD_SOI, '-') 
                      + ' ' + 'ถนน ' + ISNULL(BUILD_ROAD, '-') + ' ' + 'ตำบล' + ISNULL(CONVERT(nvarchar(50), DISTRICT), '-') + ' ' + 'อำเภอ ' + CONVERT(nvarchar(50), AMPHUR)
                       AS Detail1, PROV_CODE, 'ชั้นที่ ' + CONVERT(nvarchar(20), BUIL_FLOOR) + ' ' + 'พื้นที่ขนาด ' + CONVERT(nvarchar(20), BUIL_AREA) + ' ตรม.' AS Detail2, 
                      0 AS RAI, 0 AS NGAN, 0 AS WAH, BUIL_AREA AS SQUAREMATE, CONVERT(nvarchar(20), '') AS MACH_NO
FROM         dbo.Dic07
UNION ALL
SELECT     COLL_ID, Id_Rental_Type AS buildtype, BUILDNAME, REN_ADDR AS Chanode_Addno, ISNULL(CONVERT(nvarchar(50), REN_ROAD), '') 
                      + ISNULL(CONVERT(nvarchar(50), REN_MOO), '') + ISNULL(CONVERT(nvarchar(50), DISTRICT), '') + ISNULL(CONVERT(nvarchar(50), AMPHUR), '') 
                      AS detail1, PROV_CODE, 'ผู้เช่า ' + ISNULL(RENTALNAME, ' ') + ISNULL(REN_OWNER, '') + ' เช่าโดย ' + ISNULL(REN_REN_BY, '') AS Detail2, 0 AS RAI, 
                      0 AS NGAN, 0 AS WAH, 0 AS SQUAREMATE, CONVERT(nvarchar(20), '') AS MACH_NO
FROM         dbo.Dic08
UNION ALL
SELECT     COLL_ID, Id_Fled_Type AS buildtype, BUILDNAME, ADDR AS Chanode_Addno, 'ตั้งอยู่ที่ ' + 'ซอย ' + ISNULL(CONVERT(nvarchar(50), SOI), '') 
                      + 'ถนน ' + ROAD + 'หมู่ ' + ISNULL(CONVERT(nvarchar(50), MOO), '') + 'ตำบล' + ISNULL(CONVERT(nvarchar(50), DISTRICT), '') 
                      + 'อำเภอ ' + ISNULL(CONVERT(nvarchar(50), AMPHUR), '') AS Detail1, PROV_CODE, 'หมายเลขเครื่องจักร ' + ISNULL(MACHNO, '') AS Detail2, 0 AS RAI, 
                      0 AS NGAN, 0 AS WAH, 0 AS SQUAREMATE, CONVERT(Nvarchar(20), MACHNO) AS MACH_NO
FROM         dbo.Dic09
UNION ALL
SELECT     COLL_ID, '' AS buildtype, BUILDNAME, ADDR AS Chanode_Addno, 'ซอย ' + ISNULL(CONVERT(nvarchar(50), SOI), '') 
                      + 'ถนน ' + ISNULL(CONVERT(nvarchar(50), ROAD), '') + 'หมู่ ' + ISNULL(CONVERT(nvarchar(50), MOO), '') + 'ตำบล' + ISNULL(CONVERT(nvarchar(50), 
                      DISTRICT), '') + 'อำเภอ ' + ISNULL(CONVERT(nvarchar(50), AMPHUR), '') AS Detail1, PROV_CODE, 'ชื่อ ' + CONVERT(nvarchar(50), NAME) 
                      + 'หมายเลข ' + CONVERT(nvarchar(50), SHIP_NO) + 'น้ำหนัก ' + CONVERT(nvarchar(50), WEIGHT) + ' กำลัง ' + CONVERT(nvarchar(50), POWER) AS Detail2, 
                      0 AS RAI, 0 AS NGAN, 0 AS WAH, 0 AS SQUAREMATE, CONVERT(Nvarchar(20), SHIP_NO) AS MACH_NO
FROM         dbo.Dic15
UNION ALL
SELECT     COLL_ID AS Expr1, '' AS buildtype, BUILDNAME AS Expr2, ADDR AS Chanode_Addno, 'ซอย ' + ISNULL(CONVERT(nvarchar(50), SOI), '') 
                      + 'ถนน ' + ISNULL(CONVERT(nvarchar(50), ROAD), '') + 'หมู่ ' + ISNULL(CONVERT(nvarchar(50), MOO), '') + 'ตำบล' + ISNULL(CONVERT(nvarchar(50), 
                      DISTRICT), '') + 'อำเภอ ' + ISNULL(CONVERT(nvarchar(50), AMPHUR), '') AS Detail1, PROV_CODE, 'ห้องเลขที่ ' + ISNULL(CONVERT(nvarchar(20), 
                      ROOM_NO), '-') + 'ชั้นที่ ' + ISNULL(CONVERT(nvarchar(20), FLOOR), '-') + 'พื้นที่รวม ' + ISNULL(CONVERT(nvarchar(20), ROOM_AREA), '-') 
                      + 'ตรม.' AS Detail2, 0 AS RAI, 0 AS NGAN, 0 AS WAH, ROOM_AREA AS SQUAREMATE, CONVERT(nvarchar(20), '') AS MACH_NO
FROM         dbo.Dic18

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
         Configuration = "(H (4[14] 2[70] 3) )"
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
      ActivePaneConfig = 3
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
      Begin ColumnWidths = 13
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 5
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'COLL_ID_ALL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'COLL_ID_ALL';

