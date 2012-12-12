-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/02/13
-- Description:	ControllingLevelLineByEMP_ID
-- =============================================
CREATE PROCEDURE [dbo].[ControllingLevelLineByEMP_ID]
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
								,C_LV.PRIORITY
								,'Y' AS IS_ROOT
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
								,C_LV2.PRIORITY
								,'N' AS IS_ROOT
						FROM         Controlling_Level AS C_LV2 INNER JOIN
								CTRL_LV AS CTRL_LV2 
								ON C_LV2.LEVEL_ROOT = CTRL_LV2.LEVEL_ID
				)

	SELECT CTRL_LV.LEVEL_ID
			,CTRL_LV.LEVEL_CODE
			,CTRL_LV.LEVEL_NAME
			,CTRL_LV.LEVEL_ROOT
			,CTRL_LV.PRIORITY
			,CTRL_LV.IS_ROOT
	FROM CTRL_LV
	ORDER BY PRIORITY;

END
