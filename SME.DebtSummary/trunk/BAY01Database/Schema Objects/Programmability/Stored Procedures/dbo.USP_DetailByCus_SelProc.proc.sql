-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/07
-- Description:	USP_DetailByCus_SelProc
-- =============================================
CREATE PROCEDURE [dbo].[USP_DetailByCus_SelProc] 
	-- Add the parameters for the stored procedure here
	@CIF  int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Cif], [Name], [BOTID], [Tdr], [Branch], [Branch_T], [Class], 
		[ByCustomer_AGING], [ByCusDaily_AGING], [AgingTxt], [Principal], 
		[Accru], [Susp], [PAY_PRIN], [PAY_INT], [PAY_SUSP], [Id_Group], 
		[Group], [Id_Part], [Part_Name], [Id_Region], [Region_Name], 
		[CUS_DEPT_FLAG], [CUS_DEPT_TRAN], [Dep], [OFFICR_ID], [Office] 
	FROM [Detail] WHERE ([Cif] = @CIF)
END
