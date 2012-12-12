-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/28
-- Description:	ControllingLineByLevelRoot
-- =============================================
CREATE PROCEDURE ControllingLineByLevelRoot
	-- Add the parameters for the stored procedure here
	@Level_Root nvarchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	WITH control_line AS (SELECT     LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT
							FROM         dbo.Controlling_Level
							WHERE     (LEVEL_ROOT = @Level_Root)
                            UNION ALL
                            SELECT     Controlling_Level_1.LEVEL_ID, Controlling_Level_1.LEVEL_CODE, Controlling_Level_1.LEVEL_NAME, 
                                                  Controlling_Level_1.LEVEL_ROOT
                            FROM         dbo.Controlling_Level AS Controlling_Level_1 INNER JOIN
                                                  control_line AS control_line_2 ON Controlling_Level_1.LEVEL_ROOT = control_line_2.LEVEL_ID)
    
	SELECT  control_line_1.LEVEL_ID, control_line_1.LEVEL_CODE, control_line_1.LEVEL_NAME, control_line_1.LEVEL_ROOT
	FROM    control_line AS control_line_1 

END
