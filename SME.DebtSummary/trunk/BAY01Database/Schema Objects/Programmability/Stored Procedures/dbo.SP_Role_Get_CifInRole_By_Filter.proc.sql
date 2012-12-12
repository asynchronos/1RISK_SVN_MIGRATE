-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_CifInRole_By_Filter]
	-- Add the parameters for the stored procedure here
	@Filter nvarchar(255) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF LEN(LTRIM(RTRIM(@Filter)))=0
		BEGIN
			SELECT C_IN_R.ID
					, C_IN_R.CIF
					, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS [NAME]
					, C_IN_R.ROLE_ID, R.ROLE_NAME
			  FROM dbo.RoleGroup_CifInRole AS C_IN_R INNER JOIN
					dbo.CUSTOMER AS CUS ON C_IN_R.CIF = CUS.CIF INNER JOIN
					dbo.RoleGroup_Role AS R ON C_IN_R.ROLE_ID = R.ROLE_ID
			ORDER BY C_IN_R.CIF
		END
	ELSE
		BEGIN
			SET @Filter = '%' + @Filter + '%'

			SELECT C_IN_R.ID
					, C_IN_R.CIF
					, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS [NAME]
					, C_IN_R.ROLE_ID, R.ROLE_NAME
			  FROM dbo.RoleGroup_CifInRole AS C_IN_R INNER JOIN
					dbo.CUSTOMER AS CUS ON C_IN_R.CIF = CUS.CIF INNER JOIN
					dbo.RoleGroup_Role AS R ON C_IN_R.ROLE_ID = R.ROLE_ID
			 WHERE CONVERT(nvarchar,C_IN_R.CIF) + dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) LIKE @Filter
			ORDER BY C_IN_R.CIF
		END


END
