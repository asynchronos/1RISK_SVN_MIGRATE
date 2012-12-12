-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/09
-- Description:	ClassDebt_ALL_Select
-- =============================================
CREATE PROCEDURE [dbo].[ClassDebt_ALL_Select] 
	-- Add the parameters for the stored procedure here
	@Cif_No int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [Cif_Class] 
	WHERE ([Cif_No] = @Cif_No)
END
