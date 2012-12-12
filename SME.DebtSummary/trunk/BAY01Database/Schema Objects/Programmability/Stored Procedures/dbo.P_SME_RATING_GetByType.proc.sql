-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_SME_RATING_GetByType]
	-- Add the parameters for the stored procedure here
	@RatingTypeKey int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RATING_KEY]
		  ,[RATING_DESC]
	  FROM [CUSTOMER_SME_RATING]
	WHERE [RATING_TYPE_KEY] = @RatingTypeKey
	ORDER BY [PRIORITY]
END
