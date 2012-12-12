-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EMPLOYEE_Get_Employee_By_EmpId]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     E.EMP_ID, T.TITLE_NAME, E.EMPNAME, E.EMPSURNAME, T.TITLE_NAME_E, E.EMPNAME_E, E.EMPSURNAME_E, E.EMAIL, E.IDCARD, E.TAX_NO, 
			  E.ACCNO, E.ADDRESS, E.SOI, E.ROAD, E.LOCALITY, E.DISTRINCT, E.PROV_CODE, E.ZIPCODE, E.TEL_HOME, E.TEL_MOBILE, E.TEL_INDOOR, 
			  E.DATEOFBIRTH, E.IMAGENAME, E.DATEOFSTART, E.STATUS, E.TEAM_ID, E.GROUP_HEAD, E.ROLE, E.PERMIT, E.USERNAME, E.PASSWD, E.UP_DT, 
			  E.Dept, E.Id_Region, E.Id_Branch, E.POSITION_CODE, E.Id_Region_Group, E.Id_Branch_Group, E.Id_Group_Group
	FROM         dbo.TB_EMPLOYEE AS E INNER JOIN
						  dbo.TB_TITLE AS T ON E.TITLE_CODE = T.TITLE_CODE
	WHERE     (E.EMP_ID = @EMP_ID)
END
