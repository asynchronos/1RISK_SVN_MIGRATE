-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_GET_CIF_IN_GROUP]
	-- Add the parameters for the stored procedure here
	@GROUP_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT GROUP_ID, CIF, CUSTOMER_NAME 
	FROM CUSTOMER_SME00_ALL_STATUS 
	WHERE GROUP_ID=@GROUP_ID
END
