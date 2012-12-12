-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/11/26
-- Description:	ControllingUserLineByEMP_ID
-- =============================================
CREATE PROCEDURE [dbo].[ControllingUserLineByEMP_ID]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	-- RECURSIVE LEVEL FOR THAT EMP_ID
	WITH CTRL_LV AS (SELECT     C_LV.LEVEL_ID, C_LV.LEVEL_CODE, 
									C_LV.LEVEL_NAME, C_LV.LEVEL_ROOT
							FROM         Controlling_Level AS C_LV
							WHERE EXISTS (
											SELECT C_USER.LEVEL_ID
													,C_USER.EMP_ID
													,C_VIEW.LEVEL_ROOT_VIEWER
											FROM Controlling_UsersInLevel C_USER INNER JOIN
												Controlling_Level_Root_Viewer C_VIEW 
												ON C_USER.LEVEL_ID=C_VIEW.LEVEL_ID
											WHERE (EMP_ID=@EMP_ID)
												AND (C_VIEW.LEVEL_ROOT_VIEWER=C_LV.LEVEL_ID)
										)
							UNION ALL
							SELECT     C_LV2.LEVEL_ID, C_LV2.LEVEL_CODE, 
									C_LV2.LEVEL_NAME, C_LV2.LEVEL_ROOT
							FROM         Controlling_Level AS C_LV2 INNER JOIN
									CTRL_LV AS CTRL_LV2 
									ON C_LV2.LEVEL_ROOT = CTRL_LV2.LEVEL_ID
					)


	SELECT *
	INTO #TEMP
	FROM CTRL_LV;

	-- ไม่ว่าจะเป็นหัวหน้าหรือลูกน้องต้องเห็นคนทั้งกลุ่ม
	SELECT CTRL_FULL.*
	FROM CONTROLLING_LINE_FULL AS CTRL_FULL
	WHERE EXISTS (
		SELECT LEVEL_ID
		FROM #TEMP
		WHERE #TEMP.LEVEL_ID=CTRL_FULL.LEVEL_ID
	)

--	IF EXISTS (
--		SELECT CTRL_FULL.LEVEL_ID
--		FROM CONTROLLING_LINE_FULL AS CTRL_FULL
--		WHERE EMP_ID=LEAD_ID
--			AND EMP_ID=@EMP_ID
--	)
--		-- ถ้าเป็นหัวหน้ากลุ่ม
--		BEGIN
--			SELECT CTRL_FULL.*
--			FROM CONTROLLING_LINE_FULL AS CTRL_FULL
--			WHERE EXISTS (
--				SELECT LEVEL_ID
--				FROM #TEMP
--				WHERE #TEMP.LEVEL_ID=CTRL_FULL.LEVEL_ID
--			)
--		END
--	ELSE
--		-- ถ้าไม่ได้เป็นหัวหน้าจะแสดงเฉพาะชื่อตัวเองในกลุ่มนั้นๆ
--		BEGIN
--			SELECT A.*
--			FROM	(-- เหมือนข้างบน
--					SELECT CTRL_FULL.*
--					FROM CONTROLLING_LINE_FULL AS CTRL_FULL
--					WHERE EXISTS (
--						SELECT LEVEL_ID
--						FROM #TEMP
--						WHERE #TEMP.LEVEL_ID=CTRL_FULL.LEVEL_ID
--					)) AS A
--			-- แต่กรองชื่อคนอื่นที่อยู่ในกลุ่มเดียวกันออกไป
--			WHERE NOT EXISTS (
--				SELECT CTRL_FULL2.EMP_ID
--				FROM CONTROLLING_LINE_FULL AS CTRL_FULL2
--				WHERE EXISTS (SELECT CTRL_FULL3.LEVEL_ID
--								FROM CONTROLLING_LINE_FULL AS CTRL_FULL3
--								WHERE CTRL_FULL3.EMP_ID=@EMP_ID
--									AND CTRL_FULL2.LEVEL_ID=CTRL_FULL3.LEVEL_ID
--								) 
--					AND CTRL_FULL2.EMP_ID<>@EMP_ID
--					AND A.EMP_ID=CTRL_FULL2.EMP_ID
--			)
--		END

	DROP TABLE #TEMP

END
