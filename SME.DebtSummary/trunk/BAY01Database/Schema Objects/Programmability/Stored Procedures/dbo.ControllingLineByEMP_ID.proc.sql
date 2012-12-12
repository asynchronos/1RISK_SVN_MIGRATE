-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/11/26
-- Description:	จะ return ทั้ง ControllingLevelLineByEMP_ID
--		และ ControllingUserLineByEMP_ID
-- =============================================
CREATE PROCEDURE [dbo].[ControllingLineByEMP_ID]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	-- RECURSIVE LEVEL FOR THAT EMP_ID
	EXEC ControllingLevelLineByEMP_ID @EMP_ID;
	EXEC ControllingUserLineByEMP_ID @EMP_ID;

END
