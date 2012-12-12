-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Get_CifDetail_By_Cif]
	-- Add the parameters for the stored procedure here
	@Cif int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CIF
			, CifType
			, dbo.GetName(CUS_TITLE, CUS_FIRST, CUS_LAST) AS [Name]
			, dbo.GetName(CUS1_TITLE, CUS1_FIRST, CUS1_LAST) AS Name1
			, dbo.GetName(CUS2_TITLE, CUS2_FIRST, CUS2_LAST) AS Name2
			, dbo.GetName(CUS3_TITLE, CUS3_FIRST, CUS3_LAST) AS Name3
			, CIF0
			, CIF1
			, CIF2 
	FROM CUSTOMER 
	WHERE (CIF = @Cif)
END
