-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_CifInRole_By_RoleId]
	-- Add the parameters for the stored procedure here
	@RoleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	CUS.CIF
			, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS [NAME]
			, MAP.ROLE_ID
			, R.ROLE_NAME
			, R.ROLE_CATEGORY_ID
			, C_IN_R.ID
	FROM	dbo.RoleGroup_CifInRole AS C_IN_R INNER JOIN
			dbo.V_ROLE_MAPPING AS MAP ON C_IN_R.ROLE_ID = MAP.NEW_ROLE_ID INNER JOIN -- ต้องLinkกลับด้าน EmpInRoleจะLinkกับMAP.ROLE_ID หรือ ROLE_ID ธรรมดาที่ไม่ต้องทำการ MAPPING
			dbo.CUSTOMER AS CUS ON C_IN_R.CIF = CUS.CIF INNER JOIN
			dbo.RoleGroup_Role AS R ON MAP.ROLE_ID = R.ROLE_ID
	WHERE     (R.ROLE_ID = @RoleId)
END
