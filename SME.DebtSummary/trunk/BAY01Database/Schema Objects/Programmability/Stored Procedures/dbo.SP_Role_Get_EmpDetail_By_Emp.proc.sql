-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_EmpDetail_By_Emp]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EMP_ID
			, dbo.GetName(TITLE_NAME, EMPNAME, EMPSURNAME) AS [Name]
	FROM EMPLOYEE01 
	WHERE (EMP_ID = @EMP_ID)
END
