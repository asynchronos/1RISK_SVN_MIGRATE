-- =============================================
-- Author:		Prakit
-- Create date: 11 Jul 2008
-- Description:	CUSTOMER_SME_GROUP_DELETE
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_GROUP_DELETE] 
	-- Add the parameters for the stored procedure here
	@GROUP_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM CUSTOMER_SME_GROUP WHERE (GROUP_ID = @GROUP_ID)
END
