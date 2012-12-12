-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/10
-- Description:	CustomerCollByAppId_Select
-- =============================================
CREATE PROCEDURE [dbo].[CustomerCollWithAppId_Select] 
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  distinct  m2.COLLTYPE, m2.APPS_ID, m2.COLLVAL, m2.VALDATE, m2.DISCPCT, m2.DISCVAL, I1.CollName   
	FROM MergeCOS m2 INNER JOIN   Id_Collat I1 ON m2.COLLTYPE = I1.Id_CollType  
	where M2.Cif =@CIF and   (m2.APPS_ID IS NOT NULL) AND (m2.APPS_ID <> 0)
END
