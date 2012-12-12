-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/09
-- Description:	Coll_Person_Select
-- =============================================
CREATE PROCEDURE [dbo].[Coll_Person_Select] 
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Cif_Person, Person, GUAR_AMT 
	FROM COLL_Person WHERE (Cif = @CIF)
END
