
-- =============================================
-- Author:		Prakit
-- Create date: 11 Jul 2008
-- Description:	CUSTOMER_SME_GROUP_UPDATE
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_GROUP_UPDATE] 
	-- Add the parameters for the stored procedure here
	@GROUP_ID int,
	@GROUP_SIZE_ID smallint,
	@UPDATE_BY nvarchar(10),
	@UPDATE_DATE datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CUSTOMER_SME_GROUP
	SET GROUP_SIZE_ID = @GROUP_SIZE_ID,
		UPDATE_BY = @UPDATE_BY,
		UPDATE_DATE = @UPDATE_DATE
	WHERE (GROUP_ID = @GROUP_ID)
END

