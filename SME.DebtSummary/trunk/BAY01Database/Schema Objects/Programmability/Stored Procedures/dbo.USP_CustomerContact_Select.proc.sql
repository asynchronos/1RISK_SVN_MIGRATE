-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/07
-- Description:	USP_CustomerContact_Select
-- =============================================
CREATE PROCEDURE [dbo].[USP_CustomerContact_Select]
	-- Add the parameters for the stored procedure here
	@CIF  int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [CIF], [NAME], [SURNAME] , [POS], [Tel_Off], [Tel_Mobile], 
		[UP_DT], [EMP_UP], [CR_DT], [EMP_CR] 
	FROM [TB_CONTACT] WHERE ([CIF] = @CIF)
END
