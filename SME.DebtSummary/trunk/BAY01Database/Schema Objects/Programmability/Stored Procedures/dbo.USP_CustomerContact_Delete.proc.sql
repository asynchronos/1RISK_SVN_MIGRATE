-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/07
-- Description:	USP_CustomerContact_Delete
-- =============================================
CREATE PROCEDURE [dbo].[USP_CustomerContact_Delete]
	-- Add the parameters for the stored procedure here
	@CIF  int ,
	@NAME nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [TB_CONTACT] WHERE [CIF] = @CIF AND [NAME] = @NAME
END
