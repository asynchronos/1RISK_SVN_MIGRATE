-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/28
-- Description:	ControllingUsersInLevelByLevelId
-- =============================================
CREATE PROCEDURE ControllingUsersInLevelByLevelId
	-- Add the parameters for the stored procedure here
	@LEVEL_ID nvarchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT Controlling_UsersInLevel.LEVEL_ID, TB_EMPLOYEE.EMP_ID , 
		TB_EMPLOYEE.EMPNAME, TB_EMPLOYEE.EMPSURNAME 
	FROM Controlling_UsersInLevel INNER JOIN 
	TB_EMPLOYEE ON Controlling_UsersInLevel.EMP_ID = TB_EMPLOYEE.EMP_ID 
	WHERE Controlling_UsersInLevel.LEVEL_ID=@LEVEL_ID 

END
